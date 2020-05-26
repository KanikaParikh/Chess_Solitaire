note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_START_GAME
inherit
	ETF_START_GAME_INTERFACE
create
	make
feature -- command
	start_game
    	do
			-- perform some update on the model state
				if(model.counter >=2 and model.counter <7) then
					model.error ("Error: Game already started")
--				elseif(model.helper_lose /= 1 or model.helper_lose = 12) then
--				model.error ("Game Over: You Lose!")
				else
					model.start_game

				end

			etf_cmd_container.on_change.notify ([Current])
    	end

end
