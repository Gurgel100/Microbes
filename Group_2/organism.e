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

	set_health_points(a_health: INTEGER)
		do
			health_points := a_health
		end

	set_atp(a_atp: INTEGER)
		do
			atp := a_atp
		end

	set_attack_strength(a_strength: INTEGER)
		do
			attack_strength := a_strength
		end

feature

	health_points: INTEGER

	atp: INTEGER
		-- energy_cost

	attack_strength: INTEGER

	name: STRING




end
