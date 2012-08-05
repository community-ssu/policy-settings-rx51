:- module(audio_route,[bluetooth_override/1, get_route/2, privacy_override/1, set_audio_routes/1, update_factstore_entry/4]).


route_action(E) :-
	audio_device_type(A),
	route_to_device(A, B),
	set_route(A, B),
	audio_configuration(A, B, C, D),
	route_entry_list_elem(A, B, C, D, E).


current_audio_playback_group(A) :-
	(   playback:current_playback_group(audio_playback, A), !
	;   A=undefined
	).


audio_configuration(source, _, na, na).
audio_configuration(sink, A, B, C) :-
	fact_exists('com.nokia.policy.audio_output_configuration', [device, mode, hwid], [A, B, C]).


get_route(sink, A) :-
	nb_getval(sink_route, A).
get_route(source, A) :-
	nb_getval(source_route, A).


route_to_device(B, C) :-
	(   current_audio_playback_group(A),
	    device_candidate(A, B, C),
	    not(invalid_audio_device_choice(A, B, C)), !
	;   B=sink,
	    C=null
	).


bluetooth_override(A) :-
	fact_exists('com.nokia.policy.bluetooth_override', [value], [A]),
	not(A=default),
	not(A=disconnected).


set_route(sink, A) :-
	nb_setval(sink_route, A).
set_route(source, A) :-
	nb_setval(source_route, A).


route_entry_list_elem(B, C, D, E, A) :-
	A=[audio_route, [type, B], [device, C], [mode, D], [hwid, E]].


current_route(A, B) :-
	fact_exists('com.nokia.policy.audio_route', [type, device], [A, B]).


test_invalid_audio_device_choice(A, B, C) :-
	media_group(A),
	audio_device_type(B, C),
	invalid_audio_device_choice(A, B, C).


rules([set_audio_routes/1, update_factstore_entry/4]).


privacy_override(A) :-
	fact_exists('com.nokia.policy.privacy_override', [value], [A]),
	not(A=default).


set_audio_routes(B) :-
	set_route(_, undefined),
	findall(A, route_action(A), B).


privacy_map(private, private).
privacy_map(public, private).
privacy_map(public, public).


privacy_match(A, C) :-
	privacy_map(A, B),
	audio_device_privacy(B, C).


update_factstore_entry(B, C, D, A) :-
	A=[[B, [C, D]]].


privacy(B, A) :-
	(   privacy_override(A), !
	;   implicated_privacy(A), !
	;   group_privacy_limit(B, C),
	    privacy_map(C, A)
	).


device_candidate(A, B, C) :-
	privacy(A, D),
	audio_device_type(B, C),
	audio_device_privacy(D, C),
	accessory:selectable_audio(C).
