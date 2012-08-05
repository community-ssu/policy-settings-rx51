

map_level('0', _, 0).
map_level(B, A, A) :-
	not(B='0').


profile(A, C) :-
	profile_field_name(A, B),
	(   fact_exists('com.nokia.policy.current_profile', [B], [D])
	*-> (   A=name
	    *-> C=D
	    ;   profile_field_value(C, D)
	    )
	;   profile_default_value(A, C)
	).


profile_default_value(name, general).
profile_default_value(privacy, public).
profile_default_value(clock, enabled).
profile_default_value(calendar, enabled).
profile_default_value(systemsound, 100).


profile_field_name(name, value).
profile_field_name(privacy, 'ringing.alert.type').
profile_field_name(clock, 'clock.alarm.enabled').
profile_field_name(calendar, 'calendar.alarm.enabled').
profile_field_name(systemsound, 'system.sound.level').


profile_field_value(public, ringing).
profile_field_value(private, silent).
profile_field_value(enabled, 'On').
profile_field_value(disabled, 'Off').


profile_limit(A, D, E) :-
	profile_field_name(A, B),
	(   fact_exists('com.nokia.policy.current_profile', [B], [C])
	*-> map_level(C, D, E)
	;   E=D
	).


profile_limit(A, C, D, B) :-
	(   fact_exists('com.nokia.policy.current_profile', [value], [A])
	->  B=C
	;   B=D
	).
