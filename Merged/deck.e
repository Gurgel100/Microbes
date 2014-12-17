note
	description: "Summary description for {DECK}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	DECK
inherit
	ARRAY [CARD]

create make_good, make_bad

feature
	make_good
		-- Create a good deck
	local
		i,r: INTEGER
		random: V_RANDOM
		pool:POOL
		file: PLAIN_TEXT_FILE
		path:PATH
	do
		create file.make_create_read_write ("C:\..\good.txt")
		create pool.make_pool(file)
		file.close
		make_empty
		from
			i:=1
			create random
		until i > deck_count
		loop
			r:=random.bounded_item(1, pool.count)
			force (pool[r], i)
			i:=i+1
			random.forth
		end
	end

	make_bad
		-- Create an evil deck
	local
		i,r: INTEGER
		random: V_RANDOM
		pool:POOL
		file: PLAIN_TEXT_FILE
		path:PATH
	do
		create file.make_create_read_write ("C:\..\evil.txt")
		create pool.make_pool(file)
		file.close
		make_empty
		from
			i:=1
			create random
		until i > deck_count
		loop
			r:=random.bounded_item(1, pool.count)
			force (pool[r], i)
			i:=i+1
			random.forth
		end
	end
feature

	deck_count: INTEGER = 5
		-- Number of cards in a deck
feature

	draw
		require
			deck_not_empty: not is_empty
		do
			remove_head
		ensure
			less_cards: count = old count - 1
		end
end

