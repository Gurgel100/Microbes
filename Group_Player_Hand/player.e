note
	description: "Summary description for {PLAYER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PLAYER
	inherit
		ATTACKABLE

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


			create {LINKED_LIST[CARD]}minions.make

			controller := a_controller
			atp := 0
			hp := 100
		ensure
			hp_is_set: hp = 100
			atp_is_set: atp = 0
		end

feature

	perform_turn (a_enemy: like Current)
			-- Perform one turn
		require
			enemy_not_void: a_enemy /= Void
			enemy_not_dead: not a_enemy.is_dead
		local
			card_to_play : CARD
			enemies : LIST[ATTACKABLE]
		do
			if atp < atp_max then
				atp := atp + 1
			end
			hand.draw

			card_to_play := controller.choose_card (hand)
			--card_to_play.play()

			minions.extend(card_to_play)

			enemies := a_enemy.attackables


			controller.attack(attackables, enemies)

		end

	is_dead: BOOLEAN
			-- Is the player dead?
		do
			Result := hp <= 0
		end

feature {PLAYER}

	atp: INTEGER
			-- ATP of the player

	hand: HAND
			-- Hand of the player

	minions : LIST[CARD]

	attackables : LIST[ATTACKABLE]
	do
		create {LINKED_LIST[ATTACKABLE]}Result.make

		across minions as m loop
			Result.extend(m.item)
		end

		if minions.is_empty then
			-- if there are no minions left, attack the enemy himself

			Result.extend(Current)
		end

	end

feature {NONE}

	deck: DECK
			-- Deck of the player

	controller: PLAYER_CONTROLLER
			-- Controller which controlls the player

	atp_max: INTEGER = 10

invariant
	deck_not_void: deck /= Void
	controller_not_void: controller /= Void
	hand_not_void: hand /= Void
	atp_is_in_range: atp >= 0 AND atp <= atp_max
end
