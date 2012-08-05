:- module(audio_mute,[set_mute/1]).


mute_action(C, A) :-
	audio_device_type(source, B),
	A=[mute_device, [device, B], [mute, C]].


mute(B) :-
	(   fact_exists('com.nokia.policy.mute', [value], [A]),
	    (   not(A=0)
	    *-> B=muted
	    ;   B=unmuted
	    ), !
	;   B=unmuted
	).


set_mute(C) :-
	mute(A),
	findall(B, mute_action(A, B), C).


rules([set_mute/1]).
