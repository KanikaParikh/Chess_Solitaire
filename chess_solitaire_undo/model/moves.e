note
	description: "Summary description for {MOVES}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MOVES

inherit
COMMAND


create
make
feature
	make(m:ETF_MODEL;a1,b1:INTEGER)
	do
		model:= m
		b:=a1
		c:=b1
	end
feature{NONE}
model:ETF_MODEL
b,c:INTEGER
feature
		execute
			do
					model.set_counter (3)
				    model.refactor_arr.copy (model.array)

				    if(model.refactor_arr.item (b, c) ~ "P") then
						if(model.is_valid(b-1,c-1)) then
						model.array.put ("+",b-1,c-1)
						model.check_valid(b-1,c-1)
						end
						if(model.is_valid(b-1,c+1)) then
						model.array.put ("+",b-1,c+1)
						model.check_valid(b-1,c+1)
						end
					model.refresh("P",b,c)
					end
					if(model.refactor_arr.item (b,c) ~ "R") then

						if(model.is_valid(b-1,c)) then
							model.array.put ("+",b-1,c)
							model.check_valid(b-1,c)
						end

					  	if(model.is_valid(b-2,c)) then
							model.array.put ("+",b-2,c)
							model.check_valid(b-2,c)
						end
						if(model.is_valid(b,c-2)) then
					 	model.array.put ("+",b,c-2)
						model.check_valid(b,c-2)
						end

						if(model.is_valid(b-3,c)) then
							model.array.put ("+",b-3,c)
							model.check_valid(b-3,c)
						end
						if(model.is_valid(b,c-3)) then
							model.array.put ("+",b,c-3)
							model.check_valid(b,c-3)
						end

						if(model.is_valid(b,c-1)) then
							model.array.put ("+",b,c-1)
							model.check_valid(b,c-1)
						end

						if(model.is_valid(b,c+1)) then
							model.array.put ("+",b,c+1)
							model.check_valid(b,c+1)
						end
						if(model.is_valid(b,c+2)) then
							model.array.put ("+",b,c+2)
							model.check_valid(b,c+2)
						end
						if(model.is_valid(b,c+3)) then
							model.array.put ("+",b,c+3)
							model.check_valid(b,c+3)
						end

						if(model.is_valid(b+3,c)) then
							model.array.put ("+",b+3,c)
							model.check_valid(b+3,c)
						end

						if(model.is_valid(b+1,c)) then
							model.array.put ("+",b+1,c)
							model.check_valid(b+1,c)
						end
						if(model.is_valid(b+2,c)) then
							model.array.put ("+",b+2,c)
							model.check_valid(b+2,c)
						end
						model.refresh("R",b,c)
					end

				if(model.refactor_arr.item (b,c) ~ "N") then

						if(model.is_valid(b-1,c+2)) then
							model.array.put ("+",b-1,c+2)
							model.check_valid(b-1,c+2)
						end
						if(model.is_valid(b-1,c-2)) then
							model.array.put ("+",b-1,c-2)
							model.check_valid(b-1,c-2)
						end
					  if(model.is_valid(b+1,c-2)) then
							model.array.put ("+",b+1,c-2)
							model.check_valid(b+1,c-2)
						end
						if(model.is_valid(b+2,c+1)) then
							model.array.put ("+",b+2,c+1)
							model.check_valid(b+2,c+1)
						end
						if(model.is_valid(b+1,c+2)) then
							model.array.put ("+",b+1,c+2)
							model.check_valid(b+1,c+2)
						end

						if(model.is_valid(b+2,c-1)) then
							model.array.put ("+",b+2,c-1)
							model.check_valid(b+2,c-1)
						end
						if(model.is_valid(b-2,c-1)) then
							model.array.put ("+",b-2,c-1)
							model.check_valid(b-2,c-1)
						end

						if(model.is_valid(b-2,c+1)) then
							model.array.put ("+",b-2,c+1)
							model.check_valid(b-2,c+1)
						end
						model.refresh("N",b,c)
					end
				if(model.refactor_arr.item (b,c) ~ "K") then

						if(model.is_valid(b-1,c-1)) then
							model.array.put ("+",b-1,c-1)
							model.check_valid(b-1,c-1)
						end
						if(model.is_valid(b-1,c)) then
							model.array.put ("+",b-1,c)
							model.check_valid(b-1,c)
						end

					   if(model.is_valid(b+1,c)) then
							model.array.put ("+",b+1,c)
							model.check_valid(b+1,c)
						end
						if(model.is_valid(b+1,c+1)) then
							model.array.put ("+",b+1,c+1)
							model.check_valid(b+1,c+1)
						end

						if(model.is_valid(b+1,c-1)) then
							model.array.put ("+",b+1,c-1)
							model.check_valid(b+1,c-1)
						end

						if(model.is_valid(b,c+1)) then
							model.array.put ("+",b,c+1)
							model.check_valid(b,c+1)
						end

						if(model.is_valid(b,c-1)) then
							model.array.put ("+",b,c-1)
							model.check_valid(b,c-1)
						end

						if(model.is_valid(b-1,c+1)) then
							model.array.put ("+",b-1,c+1)
							model.check_valid(b-1,c+1)
						end
						model.refresh("K",b,c)
					end
					if(model.refactor_arr.item (b,c) ~ "B") then

						if(model.is_valid(b-1,c-1)) then
							model.array.put ("+",b-1,c-1)
							model.check_valid(b-1,c-1)
						end
						if(model.is_valid(b+1,c-1)) then
							model.array.put ("+",b+1,c-1)
							model.check_valid(b+1,c-1)
						end

						if(model.is_valid(b-1,c+1)) then
							model.array.put ("+",b-1,c+1)
							model.check_valid(b-1,c+1)
						end

						if(model.is_valid(b+1,c+1)) then
							model.array.put ("+",b+1,c+1)
							model.check_valid(b+1,c+1)
						end
						if(model.is_valid(b+2,c+2)) then
							model.array.put ("+",b+2,c+2)
							model.check_valid(b+2,c+2)
						end

						if(model.is_valid(b+3,c+3)) then
							model.array.put ("+",b+3,c+3)
							model.check_valid(b+3,c+3)
						end

						if(model.is_valid(b-3,c-3)) then
							model.array.put ("+",b-3,c-3)
							model.check_valid(b-3,c-3)
						end

						if(model.is_valid(b-2,c-2)) then
							model.array.put ("+",b-2,c-2)
							model.check_valid(b-2,c-2)
						end
				    	if(model.is_valid(b+3,c-3)) then
						model.array.put ("+",b+3,c-3)
						model.check_valid(b+3,c-3)
						end
						if(model.is_valid(b-3,c+3)) then
							model.array.put ("+",b-3,c+3)
							model.check_valid(b-3,c+3)
						end

						if(model.is_valid(b-2,c+2)) then
							model.array.put ("+",b-2,c+2)
							model.check_valid(b-2,c+2)
						end

				    	if(model.is_valid(b+2,c-2)) then
							model.array.put ("+",b+2,c-2)
							model.check_valid(b+2,c-2)
     					end

						model.refresh("B",b,c)

					end

					if(model.refactor_arr.item (b,c) ~ "Q") then


						if(model.is_valid(b-1,c-1)) then
							model.array.put ("+",b-1,c-1)
							model.check_valid(b-1,c-1)
						end
						if(model.is_valid(b+1,c-1)) then
							model.array.put ("+",b+1,c-1)
							model.check_valid(b+1,c-1)
						end

						if(model.is_valid(b-1,c+1)) then
							model.array.put ("+",b-1,c+1)
							model.check_valid(b-1,c+1)
						end

						if(model.is_valid(b+1,c+1)) then
							model.array.put ("+",b+1,c+1)
							model.check_valid(b+1,c+1)
						end
						if(model.is_valid(b+2,c+2)) then
							model.array.put ("+",b+2,c+2)
							model.check_valid(b+2,c+2)
						end

						if(model.is_valid(b+3,c+3)) then
							model.array.put ("+",b+3,c+3)
							model.check_valid(b+3,c+3)
						end

						if(model.is_valid(b-3,c-3)) then
							model.array.put ("+",b-3,c-3)
							model.check_valid(b-3,c-3)
						end

						if(model.is_valid(b-2,c-2)) then
							model.array.put ("+",b-2,c-2)
							model.check_valid(b-2,c-2)
						end
				    	if(model.is_valid(b+3,c-3)) then
						model.array.put ("+",b+3,c-3)
						model.check_valid(b+3,c-3)
						end
						if(model.is_valid(b-3,c+3)) then
							model.array.put ("+",b-3,c+3)
							model.check_valid(b-3,c+3)
						end

						if(model.is_valid(b-2,c+2)) then
							model.array.put ("+",b-2,c+2)
							model.check_valid(b-2,c+2)
						end

				    	if(model.is_valid(b+2,c-2)) then
							model.array.put ("+",b+2,c-2)
							model.check_valid(b+2,c-2)
     					end

						if(model.is_valid(b-1,c)) then
							model.array.put ("+",b-1,c)
							model.check_valid(b-1,c)
						end

					  	if(model.is_valid(b-2,c)) then
							model.array.put ("+",b-2,c)
							model.check_valid(b-2,c)
						end
						if(model.is_valid(b,c-2)) then
					 	model.array.put ("+",b,c-2)
						model.check_valid(b,c-2)
						end

						if(model.is_valid(b-3,c)) then
							model.array.put ("+",b-3,c)
							model.check_valid(b-3,c)
						end
						if(model.is_valid(b,c-3)) then
							model.array.put ("+",b,c-3)
							model.check_valid(b,c-3)
						end

						if(model.is_valid(b,c-1)) then
							model.array.put ("+",b,c-1)
							model.check_valid(b,c-1)
						end

						if(model.is_valid(b,c+1)) then
							model.array.put ("+",b,c+1)
							model.check_valid(b,c+1)
						end
						if(model.is_valid(b,c+2)) then
							model.array.put ("+",b,c+2)
							model.check_valid(b,c+2)
						end
						if(model.is_valid(b,c+3)) then
							model.array.put ("+",b,c+3)
							model.check_valid(b,c+3)
						end

						if(model.is_valid(b+3,c)) then
							model.array.put ("+",b+3,c)
							model.check_valid(b+3,c)
						end

						if(model.is_valid(b+1,c)) then
							model.array.put ("+",b+1,c)
							model.check_valid(b+1,c)
						end
						if(model.is_valid(b+2,c)) then
							model.array.put ("+",b+2,c)
							model.check_valid(b+2,c)
						end

						model.refresh("Q",b,c)

					end
					model.moves_arr.copy (model.array)
					--model.array.copy (model.refactor_arr)
					--model.his_object.put(Current)
	end
undo

	do


	end
redo

	do
		--mac.redo
	end


end
