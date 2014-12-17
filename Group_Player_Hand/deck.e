note
	description: "Summary description for {DECK}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	DECK

create make_good, make_bad

feature
	cards : LINKED_LIST [CARD]

	make_good
		-- Create a good deck
	local
		i,r: INTEGER
		random: RANDOM
		pool:POOL
		file: PLAIN_TEXT_FILE
		path:PATH
	do
		create cards.make
		
		create file.make_open_read ("good.txt")
		--create file.make_create_read_write ("good.txt")

		create pool.make_pool(file)

		file.close

		from
			i:=1
			create random.make
		until i > deck_count
		loop

			r := random.next_random (pool.count - 1) + 1
			cards.extend (pool[r])
			i:=i+1
			random.forth
		end

	end

	make_bad
		-- Create an evil deck
	local
		i,r: INTEGER
		random: RANDOM
		pool:POOL
		file: PLAIN_TEXT_FILE
		path:PATH
	do
		create cards.make
		create file.make_create_read_write ("evil.txt")
		create pool.make_pool(file)
		file.close

		from
			i:=1
			create random.make
		until i > deck_count
		loop

			r := random.next_random (pool.count - 1) + 1
			cards.extend (pool[r])
			i:=i+1
			random.forth
		end
	end
feature

	deck_count: INTEGER = 5
		-- Number of cards in a deck
feature

	draw : CARD
		require
			deck_not_empty: not cards.is_empty
		do
			Result := cards.first
			cards.prune (Result)

		ensure
			less_cards: cards.count = old cards.count - 1
		end
end

