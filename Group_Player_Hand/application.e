note
	description : "Microbes application root class"
	date        : "$Date$"
	revision    : "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			game : GAME

		do
			--| Add your code here

			create game.make(create {PLAYER_CONTROLLER_SIMPLE_AI}, create {PLAYER_CONTROLLER_SIMPLE_AI})

			game.start

		end

end
