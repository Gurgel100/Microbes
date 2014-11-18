note
	description: "Summary description for {CARD}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CARD

create
	make

feature --Initialization

	make (n: STRING)
			--Create a card of type 'n'
		require
			name_exists: n /= Void
		do
			name.make_empty
			name.append (n)
		ensure
			name_set: name ~ n
		end

feature

	name: STRING
			-- Type of card

	defense_value: INTEGER
			-- Defence value of a card

	attack_value: INTEGER
			-- Defence value of a card

	number_of_copies: INTEGER
			-- Number of copies for each card

feature

	set_defense_value (def: INTEGER)
			-- Set defense value
		require
			defense_value_valid: def > 0
		do
			defence_value := def
		ensure
			denfence_value_set: defence_value = def
		end

	set_attack_value (at: INTEGER)
			-- Set attack value
		require
			attack_value_valid: at > 0
		do
			attack_value := at
		ensure
			attack_value_set: attack_value = at
		end

end
