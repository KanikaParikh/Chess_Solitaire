note
	description: "Summary description for {MOVE_AND_CAPTURE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MOVE_AND_CAPTURE



inherit
COMMAND

create
make
feature
	make(m:ETF_MODEL;x,y,u,v: INTEGER)
	do
		model:= m
		r1:= x
		r2:=u
		c1:=y
		c2:=v
	end

feature
model:ETF_MODEL
r1,c1,r2,c2: INTEGER

feature

execute


	do
--				if(model.counter = 3) then
--				model.array.copy (model.refactor_arr)
--				else
--					model.moves (r1,c1)
--					model.array.copy (model.refactor_arr)
--				end

				model.set_tp_counter(0)
				model.array.put (model.array.item (r1, c1),r2, c2)
				model.array.put (".",r1,c1)
				model.error("Game In Progress...")
				model.set_counter (4)
				model.set_index_value (model.index_value - 1)

	           	model.loose
				if(	model.tp_counter/=6)
				then
				model.error("Game Over: You Lose!")
				model.set_counter (6)
				end

				if (model.index_value = 1) then
				model.error("Game Over: You Win!")
				model.set_counter (6)
				end
				--s := model.block_exits (r1, c1, r2, c2)

	   model.his_object.put(Current)
	end
undo
	do
       model.array.put (model.array.item (r2,c2),model.his_object.x_coord.item,model.his_object.y_coord.item)
	   model.array.put (model.his_object.chess_pieces.item, r2, c2)
	   model.his_object.undo_cursor
	   model.error ("Game In Progress...")
	   model.set_counter (4)
	   model.set_index_value (model.index_value +1)
	end
redo
	do

      model.array.put (model.array.item (r1, c1), r2, c2)

      model.array.put (".", r1,c1)
      model.his_object.redo_cursor
      model.error ("Game In Progress...")
      		   model.set_index_value (model.index_value - 1)
      model.set_counter (4)
	       if(model.index_value = 1)
	       then
	       	model.set_counter (6)
			model.error ("Game Over: You Win!")
		   end

	end


end
