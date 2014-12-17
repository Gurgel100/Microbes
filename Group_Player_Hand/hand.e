note
	description: "Summary description for {HAND}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	HAND

create
	make

feature

	deck: DECK

	cards: LINKED_LIST [CARD]

	last_card: detachable CARD

feature {PLAYER}

	draw
			-- draws a card from the deck

		do

			cards.extend (deck.draw)
		end

	play (card: CARD)
			-- plays a card and removes it from the hand
		require
			card_exists: card /= Void
			card_is_in_hand: cards.has (card)
		do
			cards.prune (card)
			-- last_card := cards.remove (card)
			last_card := card
			if attached last_card as c then
				--c.play()
				-- TODO
			end
		ensure
			cards.count = old cards.count - 1
		end

feature {NONE}

	make (a_deck: DECK)
		require
			deck_exists: a_deck /= Void
		do
			deck := a_deck
			create cards.make
		ensure
			deck_set: deck = a_deck
			cards_exists: cards /= Void
		end

invariant
	deck_exists: deck /= Void
	cards_exists: cards /= Void

end
