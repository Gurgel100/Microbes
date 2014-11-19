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

	last_card: CARD

feature {PLAYER}

	draw
			-- draws a card from the deck
		do
			cards.extend (deck.draw)
		end

	play (card: CARD)
			-- plays a card and removes it from the hand
		do
			last_card := cards.remove (card)
			if last_card /= void then
				last_card.play()
			end
		end

feature {NONE}

	make (a_deck: DECK)
		do
			deck := a_deck
		end

end
