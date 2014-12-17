note
	description: "Summary description for {POOL}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	POOL
inherit
	ARRAY [CARD]

create make_pool

feature
	make_pool(my_file: PLAIN_TEXT_FILE)
	require
		file_exists: my_file.exists
	local
		i: INTEGER
		card: CARD
	do
		make_empty
		my_file.read_line
		from
			i:=1
		until
			my_file.last_string ~ "No new line at end of file%R"
		loop

			if not (my_file.last_string ~ "No new line at end of file%R") then
				create card.make(my_file.last_string)

				my_file.read_integer
				card.set_attack(my_file.last_integer)

				my_file.read_integer
				card.set_atp(my_file.last_integer)

				my_file.read_integer
				card.set_hp(my_file.last_integer)
				force(card,i)

				my_file.read_line
				i:=i+1
				end
		end
	end


end
