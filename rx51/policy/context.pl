:- module(context,[set_context/1]).


call_active :-
	fact_exists('com.nokia.policy.active_media_group', [media, group, state], [audio_playback, cscall, on]).
call_active :-
	fact_exists('com.nokia.policy.playback', [group, setstate], [ipcall, play]).


context_entry(B, C, A) :-
	A=[context, [variable, B], [value, C]].


context_variable(mode, C) :-
	mode(A),
	(   A=telephony
	*-> B=telephony
	;   B=media
	),
	context_entry(mode, B, C).
context_variable(call, B) :-
	(   call_active
	*-> A=active
	;   call_alerting
	*-> A=alerting
	;   A=inactive
	),
	context_entry(call, A, B).
context_variable(jackbias, B) :-
	(   headset_accessible
	*-> A=on
	;   A=off
	),
	context_entry(jackbias, A, B).
context_variable(call_audio_type, C) :-
	(   telephony:call_exists([id, state], [A, active])
	*-> call_domain(A, B)
	;   telephony:call_exists([id, state], [A, peerhungup])
	*-> call_domain(A, B)
	;   telephony:call_exists([id, state, direction], [A, created, outgoing])
	*-> call_domain(A, B)
	;   B=none
	), !,
	context_entry(call_audio_type, B, C).


call_alerting :-
	fact_exists('com.nokia.policy.call', [direction, state], [incoming, created]).


set_context(B) :-
	findall(A, context_variable(_, A), B).


rules([set_context/1]).


headset_accessible :-
	fact_exists('com.nokia.policy.audio_device_accessible', [name, connected], [headset, 1]).


call_domain(A, B) :-
	(   telephony:call_domain(A, B), !
	;   B=unknown
	).


mode(A) :-
	fact_exists('com.nokia.policy.mode', [foo, mode], [bar, A]).
