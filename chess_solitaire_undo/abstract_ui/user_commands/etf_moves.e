note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_MOVES
inherit
	ETF_MOVES_INTERFACE
create
	make
feature -- command
	moves(row: INTEGER_32 ; col: INTEGER_32)
    	do
			-- perform some update on the model state
			if(model.counter < 2) then
				model.error ("Error: Game not yet started")
			elseif(model.counter = 6) then
				model.error ("Error: Game already over")
			elseif(not (model.is_valid (row,col))) then
				model.error ("Error: ("+row.out +", "+col.out+") not a valid slot")
			elseif(model.array.item (row, col) ~ ".") then
				model.error ("Error: Slot @ ("+ row.out+ ", "+ col.out +") not occupied")
		    else

			model.error ("Game In Progress...")
			model.moves(row,col)
			end
			etf_cmd_container.on_change.notify ([Current])
    	end

end
