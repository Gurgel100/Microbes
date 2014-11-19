note
	description: "Summary description for {PLAYERCONTROLLER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	PLAYER_CONTROLLER

	feature

		player : PLAYER

		game: MICROBES_GAME

		make (a_player : PLAYER; a_game: MICROBES_GAME)
		do
			player := a_player
			game := a_game
		end

		deferred do_turn(enemy : PLAYER) -- look at cards and play one of them or none


end
