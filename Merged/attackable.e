note
	description: "Summary description for {ATTACKABLE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	ATTACKABLE

feature -- Access

	health_points: INTEGER

	attack_strength: INTEGER

feature -- Fight!

	fight(other: ATTACKABLE)
		do
			other.set_health_points(other.health_points - attack_strength)
			set_health_points(health_points - other.attack_strength)

			if other.health_points < 0 then
				other.set_health_points(0)
			end
			if health_points < 0 then
				set_health_points(0)
			end
		end

feature -- Setters

	set_health_points(hp: INTEGER)
		do
			health_points := hp
		end

	set_attack_strength(s: INTEGER)
		do
			attack_strength := s
		end

feature

	is_dead: BOOLEAN
		do
			Result := (health_points = 0)
		end

invariant
	hp_positive: health_points >= 0
end
