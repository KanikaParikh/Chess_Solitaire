note
	description: "A default business model."
	author: "Jackie Wang"
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_MODEL

inherit
	ANY
		redefine
			out
		end

create {ETF_MODEL_ACCESS}
	make

feature {NONE} -- Initialization
	make
			-- Initialization for `Current'.
		do
			create str.make_empty
		--	create error_msg.make_empty
			index_value := 0
			str:="Game being Setup..."
			create array.make_filled (".",4,4) -- actual chess array
			create refactor_arr.make_filled (".",4,4) -- duplicate chess array
			create moves_arr.make_filled (".",4,4) -- possible moves array
			counter := 0 -- state of the game
			create points_tup.make_empty -- tuple array for game lose
			tp_counter:=0 -- state for game lose
			create{HISTORY} his_object.make

		end

feature -- model attributes
	str : STRING
	index_value,tp_counter : INTEGER
	array: ARRAY2[STRING]
	refactor_arr:ARRAY2[STRING]
	counter, abc: INTEGER
	points_tup: ARRAY[TUPLE[INTEGER,INTEGER]]
	moves_arr:ARRAY2[STRING]
	his_object :HISTORY



feature -- model operations

	redo
	local
		cmd:COMMAND
		do
			if(his_object.end_item ~ FALSE or counter=6 ) then
				error("Error: Nothing to redo")
				else
					his_object.forth
					cmd:= his_object.item
					cmd.redo
				end
		end

	undo
	local
		cmd:COMMAND
		do
			if(his_object.on_item ~ FALSE ) then
				error("Error: Nothing to undo")
				else

					cmd:= his_object.item
					cmd.undo
					his_object.back
				end
		end

	 setup_chess (a: STRING ; b:INTEGER; c: INTEGER)
	 local
		setup_state : SETUP_CHESS

	    	do
	    		create setup_state.make (current,a,b,c)
				setup_state.execute
		  end


	start_game
	local
		start_state : START_GAME

	    	do
	    		create start_state.make (current)

					start_state.execute
	    	end

	move_and_capture (b1 : INTEGER; c1 : INTEGER;b2 : INTEGER;c2 : INTEGER)
		local
			move_and_cap:MOVE_AND_CAPTURE
			second_value:STRING
		do
			create move_and_cap.make (Current,b1,c1,b2,c2)
			second_value := array.item (b2, c2)
			his_object.put_x_coord (b1)
			his_object.put_y_coord (c1)
			his_object.put_pieces(second_value)
			move_and_cap.execute
      end

	moves(b: INTEGER ;c: INTEGER)

		local
			move_state : MOVES
		    	do
		    		create move_state.make (current,b,c)
						move_state.execute
			   end

	reset_game
	local
		reset_state : RESET_GAME
	    	do
	    		create reset_state.make (current)
					reset_state.execute
					make
	    end

	reset
			-- Reset model state.
		do
			make
		end

feature -- queries
	out : STRING
		do
			create Result.make_from_string ("  # of chess pieces on board: ")
			Result.append (index_value.out)
			Result.append ("%N  ")
			Result.append (str)
			Result.append ("%N  ")

			across array.lower |..| array.upper is index
		    loop
		    	if( index \\ 4 = 0 and index/= 16)
		    	then
		    	Result.append (array.at (index))
		    	Result.append ("%N  ")
		    	else
		    	Result.append (array.at (index))
		    	end
		    end
		   -- Result.append ("%N" + counter.out)
		    --get the array again if move_and_capture is called without moves

				if(counter = 3) then
				array.copy (refactor_arr)
				end
		end



feature -- my helper methods

	set_index_value(v:INTEGER)
	do
		index_value:=v
	end
	set_counter(co:INTEGER)
	do
		counter:=co
	end

	set_tp_counter(c:INTEGER)
	do
		tp_counter:=c
	end

	error (msg :STRING)
	do
	str:= msg
	end


	is_valid(b: INTEGER; c:INTEGER) : BOOLEAN
	do

	Result:= not (b>=5 or b<1 or c<1 or c>=5)
	end

	check_valid (in:INTEGER; jn:INTEGER)
	do
		if(refactor_arr.item (in,jn) /~ ".") then
			tp_counter := 6

		end
	end

	loose
	local
		xy,position,yz,bc: INTEGER
	do
		position:=1
		from xy:=1

		until xy>4

		loop
				from yz:=1

				until yz>4

				loop
				if(array.item (xy,yz) /~ ".") then

					points_tup.force ([xy,yz],position)
					position:= position +1
				end
				yz:=yz+1
				end
			xy:=xy+1

		end

		from bc:=1

		until bc >points_tup.upper

		loop
			moves(points_tup.at (bc).integer_32_item (1),points_tup.at (bc).integer_32_item (2))
			array.copy (refactor_arr)
			bc:=bc+1
		end

		if(tp_counter /=6 ) then
			str:= "Game Over: You Lose!"
			counter:=6
		end
	end

	refresh (m:STRING; y:INTEGER; z:INTEGER)
		do
		across
			1|..| 4 as p
		loop
			across
				1 |..| 4 as k
			loop
				if( (array.item (p.item,k.item) /~ "+") and (p.item /= y or k.item /= z)) then
					array.put (".",p.item,k.item)
				end
			end
		end

		end

	block_exits(a1,b1,a2,b2:INTEGER): BOOLEAN
		do
			if(array.item (a1,b1) ~ "R")then
			if(a1=a2)then
				if(b2=b1+2)then
				Result:= array.item(a1,b1+1) /~ "."
				end
				if(b2=b1+3) then
				Result:= ((array.item(a1,b1+2) /~ ".") or (array.item (a1,b1+1)/~ "."))
				end

				if(b2=b1-2)then
				Result:= array.item(a1,b1-1) /~ "."
				end
				if(b2=b1-3) then
				Result:= (array.item(a1,b1-2) /~ ".") or (array.item (a1,b1-1)/~ ".")
				end

			end

			if(b1=b2)then
				if(a2=a1+2)then
				Result:= array.item(a1+1,b1) /~ "."
				end
				if(a2=a1+3) then
				Result:= ((array.item(a1+2,b1) /~ ".") or (array.item (a1+1,b1)/~ "."))
				end

				if(a2=a1-2)then
				Result:= array.item(a1-1,b1) /~ "."
				end
				if(a2=a1-3) then
				Result:= (array.item(a1-2,b1) /~ ".") or (array.item (a1-1,b1)/~ ".")
				end

			end
		end


		if(array.item (a1,b1) ~ "B")then

			if(a2=a1+2 and b2=b1+2) then
			Result:= array.item(a1+1,b1+1) /~ "."
			end
			if(a2=a1+3 and b2=b1+3) then
			Result:= (array.item(a1+2,b1+2) /~ ".") or (array.item(a1+1,b1+1) /~ ".")
			end
			if(a2=a1-2 and b2=b1-2) then
			Result:= array.item(a1-1,b1-1) /~ "."
			end
			if(a2=a1-3 and b2=b1-3) then
			Result:= (array.item(a1-1,b1-1) /~ ".") or (array.item(a1-2,b1-2) /~ ".")
			end
			if(a2=a1+2 and b2=b1-2) then
			Result:= array.item(a1+1,b1-1) /~ "."
			end
			if(a2=a1+3 and b2=b1-3) then
			Result:= (array.item(a1+2,b1-2) /~ ".") or (array.item(a1+1,b1-1) /~ ".")
			end
			if(a2=a1-2 and b2=b1+2) then
			Result:= array.item(a1-1,b1+1) /~ "."
			end
			if(a2=a1-2 and b2=b1+2) then
			Result:= (array.item(a1-1,b1+1) /~ ".") or (array.item(a1-2,b1+2) /~ ".")
			end


end

		if(array.item (a1,b1) ~ "N")then

				if(a2=a1+1 and b2=b1+2) then
				Result:= (array.item(a1+1,b1) /~ ".") or (array.item(a1+1,b1+1) /~ ".")
				end
				if(a2=a1+2 and b2=b1+1) then
				Result:= (array.item(a1+1,b1) /~ ".") or (array.item(a1+2,b1) /~ ".")
				end
				if(a2=a1-1 and b2=b1+2) then
				Result:= (array.item(a1-1,b1) /~ ".") or (array.item(a1-1,b1+1) /~ ".")
				end
				if(a2=a1-2 and b2=b1+1) then
				Result:= (array.item(a1-1,b1) /~ ".") or (array.item(a1-2,b1) /~ ".")
				end
				if(a2=a1-2 and b2=b1-1) then
				Result:= (array.item(a1-1,b1) /~ ".") or (array.item(a1-2,b1) /~ ".")
				end
				if(a2=a1-1 and b2=b1-2) then
				Result:= (array.item(a1-1,b1) /~ ".") or (array.item(a1-1,b1-1) /~ ".")
				end
				if(a2=a1+1 and b2=b1-2) then
				Result:= (array.item(a1+1,b1) /~ ".") or (array.item(a1+1,b1-1) /~ ".")
				end
				if(a2=a1+2 and b2=b1-1) then
				Result:= (array.item(a1+1,b1) /~ ".") or (array.item(a1+2,b1) /~ ".")
				end
		end

		if(array.item (a1,b1) ~ "Q")then
				if(a1=a2)then
					if(b2=b1+2)then
					Result:= array.item(a1,b1+1) /~ "."
					end
					if(b2=b1+3) then
					Result:= ((array.item(a1,b1+2) /~ ".") or (array.item (a1,b1+1)/~ "."))
					end

					if(b2=b1-2)then
					Result:= array.item(a1,b1-1) /~ "."
					end
					if(b2=b1-3) then
					Result:= (array.item(a1,b1-2) /~ ".") or (array.item (a1,b1-1)/~ ".")
					end

		        end

			if(b1=b2)then
				if(a2=a1+2)then
				Result:= array.item(a1+1,b1) /~ "."
				end
				if(a2=a1+3) then
				Result:= ((array.item(a1+2,b1) /~ ".") or (array.item (a1+1,b1)/~ "."))
				end

				if(a2=a1-2)then
				Result:= array.item(a1-1,b1) /~ "."
				end
				if(a2=a1-3) then
				Result:= (array.item(a1-2,b1) /~ ".") or (array.item (a1-1,b1)/~ ".")
				end

			end



			if(a2=a1+2 and b2=b1+2) then
			Result:= array.item(a1+1,b1+1) /~ "."
			end
			if(a2=a1+3 and b2=b1+3) then
			Result:= (array.item(a1+2,b1+2) /~ ".") or (array.item(a1+1,b1+1) /~ ".")
			end
			if(a2=a1-2 and b2=b1-2) then
			Result:= array.item(a1-1,b1-1) /~ "."
			end
			if(a2=a1-3 and b2=b1-3) then
			Result:= (array.item(a1-1,b1-1) /~ ".") or (array.item(a1-2,b1-2) /~ ".")
			end
			if(a2=a1+2 and b2=b1-2) then
			Result:= array.item(a1+1,b1-1) /~ "."
			end
			if(a2=a1+3 and b2=b1-3) then
			Result:= (array.item(a1+2,b1-2) /~ ".") or (array.item(a1+1,b1-1) /~ ".")
			end
			if(a2=a1-2 and b2=b1+2) then
			Result:= array.item(a1-1,b1+1) /~ "."
			end
			if(a2=a1-2 and b2=b1+2) then
			Result:= (array.item(a1-1,b1+1) /~ ".") or (array.item(a1-2,b1+2) /~ ".")
			end




	 end

end
end




