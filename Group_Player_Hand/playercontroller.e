note
	description: "Summary description for {PLAYERCONTROLLER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	PLAYER_CONTROLLER

	feature

		player : PLAYER

		make (a_player : PLAYER)
		do
			player := a_player
		end

		deferred do_turn(enemy : PLAYER) -- look at cards and play one of them or none


end
