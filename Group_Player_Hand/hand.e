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

		deck : DECK
		cards : LIST[CARD]

	feature {PLAYER}

		draw
			do
				cards.extend(deck.draw())
			end

		play (card : CARD)
			do
				cards.remove(card)
			end

	feature {NONE}

		make (a_deck : DECK)
			do
				deck = a_deck
			end


end
