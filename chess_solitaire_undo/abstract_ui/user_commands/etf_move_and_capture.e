note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_MOVE_AND_CAPTURE
inherit
	ETF_MOVE_AND_CAPTURE_INTERFACE
create
	make
feature -- command
	move_and_capture(r1: INTEGER_32 ; c1: INTEGER_32 ; r2: INTEGER_32 ; c2: INTEGER_32)
    	do
			-- perform some update on the model state
			if(model.counter < 2 ) then
				model.error ("Error: Game not yet started")
			elseif(model.counter = 6 ) then
				model.error ("Error: Game already over")
			elseif(not (model.is_valid (r1,c1))) then
				model.error ("Error: ("+r1.out +", "+c1.out+") not a valid slot")
			elseif(not (model.is_valid (r2,c2))) then
				model.error ("Error: ("+r2.out +", "+c2.out+") not a valid slot")
			elseif(model.array.item (r1, c1) ~ ".") then
				model.error ("Error: Slot @ ("+ r1.out+ ", "+ c1.out +") not occupied")
			elseif(model.array.item (r2, c2) ~ ".") then
				model.error ("Error: Slot @ ("+ r2.out+ ", "+ c2.out +") not occupied")

		    else
		    	model.moves (r1,c1)
		    	model.array.copy (model.refactor_arr)
		    	if(model.moves_arr.item (r2, c2) /~ "+") then
				model.error ("Error: Invalid move of " + model.array.item (r1,c1) + " from " +"(" + r1.out + ", "+  c1.out + ")" + " to (" + r2.out + ", "+ c2.out+ ")")
				elseif(model.block_exits (r1, c1, r2, c2))then
				model.error ("Error: Block exists between ("+ r1.out + ", "+  c1.out + ") and ("+ r2.out + ", "+ c2.out+ ")")
				else
				model.move_and_capture(r1,c1,r2,c2)
			--	model.error ("Game In Progress...")
				end
			end

			etf_cmd_container.on_change.notify ([Current])
    	end

end
