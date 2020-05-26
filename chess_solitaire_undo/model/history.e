note
	description: "Summary description for {cmd_history}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	HISTORY

create
	make

feature --data structure uses for implementing stack

	cmd_history: LIST [COMMAND]
	chess_pieces: LIST [STRING]
	x_coord: LIST [INTEGER]
	y_coord: LIST [INTEGER]

feature {ETF_MODEL}

	make
		do
			create {ARRAYED_LIST [INTEGER]} x_coord.make (0)
			create {ARRAYED_LIST [INTEGER]} y_coord.make (0)
			create {ARRAYED_LIST [COMMAND]} cmd_history.make (0)
			create {ARRAYED_LIST [STRING]} chess_pieces.make (0)
		end


feature
	undo_cursor
		do
			x_coord.back
			y_coord.back
			chess_pieces.back
		end

	redo_cursor
		do
			x_coord.forth
			y_coord.forth
			chess_pieces.forth
		end

	put (cmd: COMMAND)
		do
			from
				cmd_history.forth
			until
				cmd_history.after
			loop
				cmd_history.remove
			end
			cmd_history.force (cmd)
			cmd_history.finish
		end

	put_pieces (n: STRING)
		do
			from
				chess_pieces.forth
			until
				chess_pieces.after
			loop
				chess_pieces.remove
			end
			chess_pieces.force (n)
			chess_pieces.finish
		end

	put_x_coord (r: INTEGER)
		do
			from
				x_coord.forth
			until
				x_coord.after
			loop
				x_coord.remove
			end
			x_coord.force (r)
			x_coord.finish
		end

	put_y_coord (c: INTEGER)
		do
			from
				y_coord.forth
			until
				y_coord.after
			loop
				y_coord.remove
			end
			y_coord.force (c)
			y_coord.finish
		end


	is_empty: BOOLEAN
		do
			Result := cmd_history.is_empty
			Result := chess_pieces.is_empty
			Result := x_coord.is_empty
			Result := y_coord.is_empty
		end

	is_first: BOOLEAN
		do
			Result := cmd_history.isfirst
			Result := chess_pieces.isfirst
			Result := x_coord.isfirst
			Result := y_coord.isfirst
		end

	is_last: BOOLEAN
		do
			Result := cmd_history.islast
			Result := chess_pieces.islast
			Result := x_coord.islast
			Result := y_coord.islast
		end

		after:BOOLEAN	-- Is there no valid cursor position to the right of cursor?
		do
			Result := cmd_history.index = cmd_history.count + 1
		end

	before: BOOLEAN
			-- Is there no valid cursor position to the left of cursor?
		do
			Result := cmd_history.index = 0
		end

		feature -- comands
	extend_history(a_op: COMMAND)
			-- remove all operations to the right of the current
			-- cursor in history, then extend with `a_op'
		do
			remove_right
			cmd_history.extend(a_op)
			cmd_history.finish
		ensure
			cmd_history[cmd_history.count] = a_op
		end

	remove_right
			--remove all elements
			-- to the right of the current cursor in history
		do
			if not cmd_history.islast and not cmd_history.after then
				from
					cmd_history.forth
				until
					cmd_history.after
				loop
					cmd_history.remove
				end
			end
		end



	forth
		require
			not after
		do
			cmd_history.forth
		end

	back
		require
			not before
		do
			cmd_history.back
		end

	item: COMMAND
		do
			Result := cmd_history.item
		end

	on_item: BOOLEAN
		do
			Result := ((not cmd_history.is_empty) and (not cmd_history.before))
		end

	end_item: BOOLEAN
		do
			Result := ((not cmd_history.is_empty) and (not cmd_history.islast))
		end

	pieces_item: STRING
		do
			Result := chess_pieces.item
		end

	pieces_onitem: BOOLEAN
		do
			Result := ((not chess_pieces.is_empty) and (not chess_pieces.before))
		end

	pieces_end_item: BOOLEAN
		do
			Result := ((not chess_pieces.is_empty) and (not chess_pieces.islast))
		end

	item_r: INTEGER
		do
			Result := x_coord.item
		end

	row_on_item: BOOLEAN
		do
			Result := ((not x_coord.is_empty) and (not x_coord.before))
		end

	row_end_item: BOOLEAN
		do
			Result := ((not x_coord.is_empty) and (not x_coord.islast))
		end

	col_item: INTEGER
		do
			Result := y_coord.item
		end

	col_on_item: BOOLEAN
		do
			Result := ((not y_coord.is_empty) and (not y_coord.before))
		end

	col_end_item: BOOLEAN
		do
			Result := ((not y_coord.is_empty) and (not y_coord.islast))
		end

end

