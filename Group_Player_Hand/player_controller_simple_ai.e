note
	description: "Summary description for {PLAYER_CONTROLLER_SIMPLE_AI}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PLAYER_CONTROLLER_SIMPLE_AI
inherit
	PLAYER_CONTROLLER
redefine
	do_turn

	feature
		do_turn ( enemy : PLAYER)

		local
			card_to_play : CARD
		do

			-- take first card and play it
			card_to_play := player.hand.cards.first

			-- ??
			card_to_play.play()


		end

end
