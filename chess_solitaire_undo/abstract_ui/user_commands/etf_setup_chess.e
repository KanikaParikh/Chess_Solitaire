note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_SETUP_CHESS
inherit
	ETF_SETUP_CHESS_INTERFACE
create
	make
feature -- command
	setup_chess(c: INTEGER_32 ; row: INTEGER_32 ; col: INTEGER_32)
		require else
			setup_chess_precond(c, row, col)

    	do
			-- perform some update on the model state
--			if(model.counter = 6) then
--		    	model.error ("Error: Game already over")
--		    else
if(model.counter >=2 and model.counter <7) then
				model.error ("Error: Game already started")
			elseif((row<1 or row>=5 or col<1 or col>=5 ))then
				model.error ("Error: ("+ row.out+", "+ col.out +") not a valid slot")
			else
				if (model.array.item (row, col) ~ "K" or model.array.item (row, col) ~ "B" or model.array.item (row, col) ~ "P"
				or model.array.item (row, col) ~ "Q" or model.array.item (row, col) ~ "N" or model.array.item (row, col) ~ "R") then
				model.error ("Error: Slot @ ("+ row.out+", "+ col.out +") already occupied")

	          else
			 	model.setup_chess(enum_items.current_keys.at (c),row,col)
			end
			end
			etf_cmd_container.on_change.notify ([Current])
    	end

end
