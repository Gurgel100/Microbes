note
	description: "Summary description for {ATTACKABLE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	ATTACKABLE

feature

	hp: INTEGER

	attack_value: INTEGER

	take_damage (a_damage: INTEGER)
			-- Take damage
		require
			damage_positive: a_damage >= 0
		do
			hp := hp - hp.min(a_damage)
		ensure
			health_decreased: hp = old hp - a_damage
		end

	fight (a_enemy: ATTACKABLE)
		require
			enemy_not_void: a_enemy /= Void
		do
			a_enemy.take_damage(attack_value)
			take_damage(a_enemy.attack_value)
		end

invariant
	hp_not_negative: hp >= 0
end
