note
	description: "Summary description for {CARD}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CARD
inherit
	ATTACKABLE

create
	make

feature --Initialization

	make (n: STRING)
			--Create a card of type 'n'
		require
			name_exists: n /= Void
		do
			create name.make_empty
			name.append (n)
		ensure
			name_set: name ~ n
		end

feature

	name: STRING
			-- Type of card
	atp: INTEGER
		--
	--hp: INTEGER
		-- Health point
	-- attack_value: INTEGER
			-- Attack value of a card


	number_of_copies: INTEGER
			-- Number of copies for each card

feature

	set_atp (a_atp: INTEGER)
			-- Set defense value
		require
			atp_positive: a_atp>=0
		do
			atp := a_atp
		ensure
			atp_set: atp = a_atp
		end

	set_hp (a_hp: INTEGER)
			-- Set attack value
		require
			hp_valid: a_hp >= 0
		do
			hp := a_hp
		ensure
			hp_set: hp = a_hp
		end
	set_attack (a_attack: INTEGER)
			-- Set attack value
		require
			attack_valid: a_attack >= 0
		do
			attack_value := a_attack
		ensure
			attack_set: attack_value = a_attack
		end

end
