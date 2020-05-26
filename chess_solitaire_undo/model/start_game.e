note
	description: "Summary description for {START_GAME}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	START_GAME

inherit
COMMAND

create
make
feature
	make(m:ETF_MODEL)
	do
		model:= m
	end
feature{NONE}
model:ETF_MODEL

feature

execute
	do

					if (model.index_value = 1) then
						model.set_counter (6)
						model.error ("Game Over: You Win!")

		    		else
			    		model.set_counter (2)
						model.error ("Game In Progress...")
				    	model.loose
		        	end
		model.his_object.put (Current)
	end
undo
	do
      -- model.set_index_value (1)
      	model.set_counter (1)
       model.error ("Game being Setup...")
       --model.loose
	end
redo
	do
		model.set_counter (2)
		model.error ("Game In Progress...")
	end


end
