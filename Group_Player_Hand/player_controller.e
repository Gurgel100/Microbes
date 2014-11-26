note
	description: "Summary description for {PLAYERCONTROLLER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	PLAYER_CONTROLLER

feature

	player: detachable PLAYER

	make
		do
		end

	set_player (a_player: PLAYER)
		require
			a_player_exists: a_player /= Void
		do
			player := a_player
		ensure
			player_is_set: player = a_player
		end

	choose_card (hand : HAND) : CARD
		deferred
		end

	attack ( my_minions, enemy_minions : LIST[ATTACKABLE])
		deferred
		end

end
