note
	description: "Summary description for {PLAYER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PLAYER

create
	make

feature {NONE} -- Initialization

	make (a_deck: DECK)
			-- Initialization for `Current'.
		do
			deck := a_deck
			create hand.make (deck)
			create controller.make (Current)
			atp := 0
			health := 100
		end

feature

	perform_turn (a_enemy: PLAYER)
			-- Perform one turn
		do
			if atp < 10 then
				atp := atp + 1
			end
			hand.draw
			controller.do_turn (a_enemy)
		end

	take_damage (a_damage: INTEGER)
			-- Take damage to the player
		do
			health := health - a_damage
		end

	is_dead: BOOLEAN
			-- Is the player dead?
		do
			Result := health <= 0
		end

feature {PLAYER_CONTROLLER}

	health: INTEGER
			-- Health of the player

	atp: INTEGER
			-- ATP of the player

	hand: HAND
			-- Hand of the player

feature {NONE}

	deck: DECK
			-- Deck of the player

	controller: PLAYER_CONTROLLER
			-- Controller which controlls the player

end
