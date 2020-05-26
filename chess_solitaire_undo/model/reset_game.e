note
	description: "Summary description for {RESET_GAME}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	RESET_GAME

inherit
COMMAND

create
make
feature
	make(reset_model:ETF_MODEL)
	do
		model:= reset_model
	end

feature
execute
	do
		model.set_counter(5)
           
	end
undo
	do

	end
redo
	do

	end

feature{NONE}
model:ETF_MODEL
end
