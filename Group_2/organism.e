note
	description: "Summary description for {ORGANISM}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ORGANISM

create
	make

feature

	make(a_name: STRING; a_strength: INTEGER; a_atp: INTEGER; a_health: INTEGER)
		do
			set_name(a_name)
			set_health_points(a_health)
			set_attack_strength(a_strength)
			set_atp(a_atp)
		end

feature

	set_name(a_name: STRING)
		do
			name := a_name
		end

	set_atp(a_atp: INTEGER)
		do
			atp := a_atp
		end

feature

	atp: INTEGER
		-- energy_cost

	name: STRING

end
