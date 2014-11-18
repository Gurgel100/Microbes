note
	description: "Summary description for {DECK}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	DECK

feature
	make (deck_count: INTEGER)
		-- Create a sequence of 30 cards
	local
		i: INTEGER
		deck: ARRAY
	do

		create deck.make_empty

		from i:=1
		until i > deck_count
		loop
			--to be added
		end
		ensure: deck_filled: deck.full = True
	end

feature

	deck_count: INTEGER = 30
		-- Number of cards in a deck


feature

	draw_card
		-- Removes top card
		require
			deck_not_empty: deck_count > 0
		do
			deck.remove_head(1)
		end

	add_card (C:CARD)
		--Adds a new card from the 'pool'
		require
			card_exists: c /= Void
		do
			deck.put(c,1)
		end
		ensure
			one_card_in_deck: deck.count = 1

end
