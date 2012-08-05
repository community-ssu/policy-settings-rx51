:- module(playback,[current_mode/2, current_mode/1, current_playback_group/2, update_active_group_entries/3, update_active_group_entries/1, update_mode/2, update_mode/1, update_playback_entries/6, update_playback_entries/3, update_playback_entries/4, update_playback_groups/1]).


update_playback_entries(A, B, D) :-
	(   group_and_media_flag_is_consistent(A, B),
	    get_group_request(A, B, C),
	    update_playback_entries(A, '<undef>', '<undef>', B, C, D), !
	;   D=[]
	).


active_playback_group(G, A, J, C, E) :-
	(   playback(B, D, _, _, A, F, _, _, play),
	    not((
		B=C,
		D=E
		)),
	    H is F/\G,
	    not(H=0)
	;   media_bit(I, G),
	    active_group(A, I),
	    not(A=J)
	), !.


set_current_group_(A) :-
	find_active_group(A, B),
	media_group_seqno(D, B),
	get_current_group(A, C),
	media_group_seqno(E, C),
	D>=E,
	set_current_group(A, B).


get_group_request(B, D, A) :-
	C='_media_flag',
	playback_state(A),
	media_group(B),
	nb_setval(C, 0),
	forall(group_request_flag(C, B, A), true),
	nb_getval(C, D).


restartable_playback_group(A, C) :-
	fact_exists('com.nokia.policy.playback', [group, flags, reqstate], [A, B, play]),
	playback_media(B, C), !.


playback_group_list_entry(A) :-
	get_current_group(B, C),
	A=[current_playback_group, [media, B], [group, C]].


active_group_request(B, A, play) :-
	fact_exists('com.nokia.policy.active_media_group', [media, group, state, reqstate], [A, B, off, on]).
active_group_request(B, A, stop) :-
	fact_exists('com.nokia.policy.active_media_group', [media, group, state, reqstate], [A, B, on, off]).


reset_current_groups :-
	forall(reset_current_group_(A), media(A)).


group_list_entry(C, B, D, E, A) :-
	A=[active_media_group, [media, B], [group, C], [state, D], [reqstate, E]].


active_group_state(B, A, C, D) :-
	fact_exists('com.nokia.policy.active_media_group', [media, group, state, reqstate], [A, B, C, D]).


playback_list_elem(B, C, D, E, F, G, H, I, J, K, A) :-
	A=[playback, [dbusid, B], [object, C], [pid, D], [stream, E], [group, F], [flags, G], [reqstate, H], [state, I], [setstate, J], [playhint, K]].


varname_for_current_group(A, B) :-
	media(A),
	atom_concat('_current_group_for_', A, B).


playback_state(play).
playback_state(stop).


restart_candidate(A, B) :-
	was_playing(A, B), !.


active_group(B, A) :-
	fact_exists('com.nokia.policy.active_media_group', [media, group, state], [A, B, on]).


playback_grant(systemsound, _, _, _, play) :-
	fail.
playback_grant(inputsound, _, _, _, play) :-
	fail.
playback_grant(ringtone, _, _, _, stop) :-
	not(any_call_exists).
playback_grant(A, _, _, B, play) :-
	not((
	    (   A=systemsound
	    ;   A=inputsound
	    )
	    )),
	current_group_for_media(B, A).
playback_grant(A, B, C, D, stop) :-
	not(A=ringtone),
	(   playback(B, C, _, _, A, D, _, _, play)
	;   forall(playback_media(D, E), active_group(A, E))
	), !.


copy_current_groups_from_factstore :-
	forall(copy_current_group_from_factstore_(A), media(A)).


copy_current_group_from_factstore_(A) :-
	current_playback_group(A, B),
	set_current_group(A, B).


group_stop(B, C, D, A) :-
	forall(find_playback_group(A, B, C, D, E, F), set_current_group(E, F)).


current_priority(A, B, C) :-
	playback_media(A, B),
	get_current_group(B, D),
	media_group_priority(C, D).


top_group(C) :-
	A='_seqno',
	nb_setval(A, 1),
	forall(media_seqno(A), true),
	nb_getval(A, B),
	media_group_seqno(B, C).


playback(A, B, C, D, E, F, G, H, I) :-
	fact_exists('com.nokia.policy.playback', [dbusid, object, pid, stream, group, flags, reqstate, state, setstate], [A, B, C, D, E, F, G, H, I]).


playback_list(E, G, I, B, play, Q) :-
	playback(F, H, L, M, D, A, N, O, K),
	C is A/\B,
	not(C=0),
	allowed_state_for_play_request(D, P, E),
	(   F=G,
	    H=I
	*-> J=play
	;   preempt_group(E, D)
	*-> J=stop
	;   J=K
	),
	playback_list_elem(F, H, L, M, D, A, N, O, J, P, Q).
playback_list(I, D, F, _, stop, O) :-
	playback(C, E, L, M, A, B, G, N, K),
	allowed_state_for_stop_request(A, H, B),
	(   C=D,
	    E=F
	*-> J=stop
	;   restart_candidate(G, A),
	    H=play,
	    restart_group(I, A)
	*-> J=play
	;   J=K
	),
	playback_list_elem(C, E, L, M, A, B, G, N, J, H, O).


current_mode(A, B, C) :-
	fact_exists('com.nokia.policy.mode', [mode, leave, enter], [A, B, C]).


find_active_group(C, A) :-
	active_playback(A, B),
	media_group_interface_in_factstore(playback, A),
	playback_media(B, C).
find_active_group(B, A) :-
	active_group(A, B),
	media_group_interface_in_factstore(active_media_group, A).


update_active_group_entries(A, B, F) :-
	(   get_group_request(A, B, C),
	    update_current_groups(A, '<undef>', '<undef>', B, C),
	    playback_grant(A, '<undef>', '<undef>', B, C),
	    group_state(C, D),
	    findall(E, group_list(A, B, D, E), F), !
	;   F=[]
	).


update_playback_entries(A, C, D, B, E, G) :-
	group_and_media_flag_is_consistent(A, B),
	update_current_groups(A, C, D, B, E),
	playback_grant(A, C, D, B, E),
	findall(F, playback_list(A, C, D, B, E, F), G).


update_playback_entries(B, C, A, G) :-
	not(A=preempt),
	group_and_media_flag_is_consistent(B, C),
	(   (   A=stop
	    *-> D=play
	    ;   D=stop
	    ),
	    playback(E, F, _, _, B, C, _, _, D),
	    update_playback_entries(B, E, F, C, A, G), !
	;   G=[]
	).
update_playback_entries(A, B, preempt, F) :-
	(   group_and_media_flag_is_consistent(A, B),
	    playback(C, D, _, _, A, B, _, _, play),
	    update_current_groups(A, C, D, B, stop),
	    findall(E, playback_list(A, C, D, B, stop, E), F), !
	;   F=[]
	).


get_current_group(A, C) :-
	varname_for_current_group(A, B),
	nb_getval(B, C).


current_mode(A, B) :-
	fact_exists('com.nokia.policy.mode', [mode, state], [A, B]).


find_playback_group_(B, C, D, E, A) :-
	media_group(A),
	active_playback_group(B, A, C, D, E), !.


set_current_groups :-
	forall(set_current_group_(A), media(A)).


current_media_flag(C, A) :-
	get_current_group(B, A),
	media_bit(B, E),
	nb_getval(C, D),
	F is D\/E,
	nb_setval(C, F).


any_call_exists :-
	fact_exists('com.nokia.policy.call', [id], [_]).


allowed_state_for_play_request(B, E, A) :-
	media_group_priority(D, A),
	media_group_priority(C, B),
	(   C=D
	*-> E=play
	;   preempt_group(A, B)
	*-> E=stop
	;   E=play
	).


playback_group(A, B, C) :-
	fact_exists('com.nokia.policy.playback', [dbusid, object, group], [A, B, C]).


current_media_group(A, C) :-
	playback_media(A, B),
	media_group(B, C),
	get_current_group(B, C).


rules([update_playback_groups/1, update_active_group_entries/1, update_active_group_entries/3, update_playback_entries/3, update_playback_entries/4, update_playback_entries/6, update_mode/1, update_mode/2]).


group_state(play, on).
group_state(stop, off).


group_list(B, A, D, E) :-
	playback_media(A, C),
	group_list_entry(B, C, D, D, E).


was_playing(play, _).
was_playing(_, flash).


group_request_flag(D, A, B) :-
	active_group_request(A, C, B),
	media_bit(C, F),
	nb_getval(D, E),
	G is E\/F,
	nb_setval(D, G).


group_and_media_flag_is_consistent(C, A) :-
	forall(playback_media(A, B), media_group(B, C)).


playback_media(A, B, C) :-
	integer(A),
	media_bit(B, C),
	C is A/\C.


allowed_state_for_stop_request(B, D, A) :-
	(   forall(current_media_group(A, C), allowed_state_for_play_request(B, play, C))
	*-> D=play
	;   D=stop
	).


group_play(E, B, A) :-
	current_priority(A, D, C),
	B>=C,
	set_current_group(D, E).


playback_media(A, B) :-
	integer(A),
	media_bit(B, C),
	C is A/\C.


current_group_for_media(A, B) :-
	ground(A),
	media_group(B),
	forall(current_media_group(A, C), C==B).
current_group_for_media(A, B) :-
	not(ground(A)),
	C='_media_flag',
	media_group(B),
	nb_setval(C, 0),
	forall(current_media_flag(C, B), true),
	nb_getval(C, A),
	not(A=0).


set_current_group(A, C) :-
	varname_for_current_group(A, B),
	nb_setval(B, C).


update_active_group_entries(B) :-
	(   findall(A, group_list(A), B), !
	;   B=[]
	).


active_playback(A, B, C) :-
	fact_exists('com.nokia.policy.playback', [dbusid, object, group, setstate], [A, B, C, play]).


media_seqno(C) :-
	(   media(A),
	    current_playback_group(A, B),
	    media_group_seqno(D, B),
	    nb_getval(C, E),
	    D>E,
	    nb_setval(C, D), !
	;   true
	).


find_playback_group(A, D, E, F, B, G) :-
	playback_media(A, B, C),
	find_playback_group_(C, D, E, F, G).


update_mode(A, C) :-
	(   mode(A),
	    current_mode(B),
	    not(A=B),
	    mode_hooks(B, _, D),
	    mode_hooks(A, E, _),
	    C=[[mode, [foo, bar], [mode, A], [leave, D], [enter, E], [state, start]]], !
	;   C=[]
	).


update_current_groups(A, _, _, C, play) :-
	copy_current_groups_from_factstore,
	media_group_priority(B, A),
	forall(group_play(A, B, C), true).
update_current_groups(B, C, D, A, stop) :-
	copy_current_groups_from_factstore,
	current_group_for_media(A, B),
	group_stop(B, C, D, A).


update_playback_groups(B) :-
	reset_current_groups,
	set_current_groups,
	findall(A, playback_group_list_entry(A), B).


current_playback_group(A, B) :-
	fact_exists('com.nokia.policy.current_playback_group', [media, group], [A, B]).


reset_current_group_(A) :-
	media(A),
	set_current_group(A, idle).


active_playback(A, B) :-
	fact_exists('com.nokia.policy.playback', [group, flags, setstate], [A, B, play]).


update_mode(C) :-
	(   top_group(A),
	    media_group_to_mode(A, B),
	    update_mode(B, C), !
	;   C=[]
	).


group_list(E) :-
	media_group(A),
	media(B),
	active_group_state(A, B, _, D),
	(   (   current_playback_group(B, A)
	    ;   A=idle
	    )
	*-> C=on
	;   C=off
	),
	group_list_entry(A, B, C, D, E).


current_mode(A) :-
	fact_exists('com.nokia.policy.mode', [mode], [A]).
