note
	description: "Summary description for {GAME}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GAME

create
	make

feature {NONE} -- Initialization

	make (c1, c2: PLAYER_CONTROLLER)
			-- Initialization for `Current'.
		require
			c1_exists: c1 /= Void
			c2_exists: c2 /= Void
		do
			create player1.make(create {DECK}.make_good, c1)
			create player2.make(create {DECK}.make_good, c2)
			controller1 := c1
			controller2 := c2
		end

	controller1: PLAYER_CONTROLLER

	controller2: PLAYER_CONTROLLER

	player1: PLAYER

	player2: PLAYER

feature

	start
		do
			from
			until
				is_finished
			loop
				print("Player 1 it's your turn%N")
				player1.perform_turn(player2)
				print("Player 2 it's your turn%N")
				player2.perform_turn(player1)
			end

			if player1.is_dead then
				print("Player 2 won")
			elseif player2.is_dead then
				print("Player 1 won")
			end


		end

	is_finished: BOOLEAN
		do
			Result := player1.is_dead or player2.is_dead
		end

invariant
	player1_exists: player1 /= Void
	player2_exists: player2 /= Void
	--c1_exists: c1 /= Void
	--c2_exists: c2 /= Void

end
