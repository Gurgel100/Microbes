note
	description: "Summary description for {PLAYER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PLAYER
	inherit
		ATTACKABLE
	end

create
	make

feature {NONE} -- Initialization

	make (a_deck: DECK; a_controller: PLAYER_CONTROLLER)
			-- Initialization for `Current'.
		require
			deck_not_void: a_deck /= Void
			controller_not_void: a_controller /= Void
		do
			deck := a_deck
			create hand.make (deck)
			create active_cards
			controller := a_controller
			atp := 0
			health := 100
		ensure
			health_is_set: health = 100
			atp_is_set: atp = 0
		end

feature

	perform_turn (a_enemy: like Current)
			-- Perform one turn
		require
			enemy_not_void: a_enemy /= Void
			enemy_not_dead: not a_enemy.is_dead
		do
			if atp < atp_max then
				atp := atp + 1
			end
			hand.draw
			controller.do_turn (a_enemy)
		end

	is_dead: BOOLEAN
			-- Is the player dead?
		do
			Result := health <= 0
		end

	active_cards: LINKED_LIST[CARD]

feature {PLAYER_CONTROLLER}

	atp: INTEGER
			-- ATP of the player

	hand: HAND
			-- Hand of the player

feature {NONE}

	deck: DECK
			-- Deck of the player

	controller: PLAYER_CONTROLLER
			-- Controller which controlls the player

	atp_max: INTEGER := 10

invariant
	deck_not_void: deck /= Void
	controller_not_void: controller /= Void
	hand_not_void: hand /= Void
	atp_is_in_range: atp >= 0 AND atp <= atp_max
end
