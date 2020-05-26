note
	description: "Summary description for {SETUP_CHESS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SETUP_CHESS

inherit
COMMAND

create
make
feature
	make(m:ETF_MODEL;x:STRING;y,z:INTEGER)
	do
		model:= m
		a:=x
		b:=y
		c:=z
	end

feature{NONE}
model:ETF_MODEL
b,c:INTEGER
a:STRING

feature-- methods
redo
	do
		model.his_object.redo_cursor
		model.array.put (model.his_object.chess_pieces.item,model.his_object.x_coord.item,model.his_object.y_coord.item)
		model.set_index_value (model.index_value + 1)
		model.error ("Game being Setup...")
	end

execute
	do

					model.array.put (a, b, c)
					model.set_counter (1)
					model.his_object.put_x_coord (b)
					model.his_object.put_y_coord (c)
					model.his_object.put_pieces (a)

					model.set_index_value (model.index_value + 1)
					model.error ("Game being Setup...")
       model.his_object.put (Current)
	end
undo
	do
		model.array.put (".",model.his_object.x_coord.item,model.his_object.y_coord.item)
		model.his_object.undo_cursor
		model.set_index_value (model.index_value - 1 )
		model.error ("Game being Setup...")
	end

end
