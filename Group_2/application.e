note
	description : "Group_2 application root class"
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
		do
			-- Test xD
			print ("Hello Eiffel World!%N")
		end

end
