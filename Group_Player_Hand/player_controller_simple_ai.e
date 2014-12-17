note
	description: "Summary description for {PLAYER_CONTROLLER_SIMPLE_AI}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PLAYER_CONTROLLER_SIMPLE_AI

inherit

	PLAYER_CONTROLLER

feature

	choose_card (hand: HAND): CARD
			-- take first card and play it
		local
			card_to_play: CARD
		do
			Result := hand.cards.first
		end

	attack (my_minions, enemy_minions: LIST [ATTACKABLE])
			-- Attack the enemy
		do
			if not my_minions.is_empty and not enemy_minions.is_empty then
				my_minions.first.fight (enemy_minions.first)
			end
		end

end
