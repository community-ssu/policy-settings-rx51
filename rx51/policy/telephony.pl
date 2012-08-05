:- module(telephony,[call_audio_update/1, call_domain/2, call_exists/2, call_request/3]).


has_active_video_call :-
	call_exists([state, video], [active, yes]).


autohold_active_calls(A, B) :-
	(   is_cellular_call(A)
	->  autohold_by_cellular(B)
	;   autohold_by_noncellular(B)
	).


call_actions(A, onhold, [B]) :-
	hold_call(A, B), !.
call_actions(A, peerhungup, [B]) :-
	peerhungup_call(A, B), !.
call_actions(A, localhungup, [B]) :-
	localhungup_call(A, B), !.
call_actions(A, disconnected, E) :-
	(   call_exists([id, state], [A, localhungup])
	;   call_exists([id, state], [A, active])
	),
	not(is_conference_parent(A)),
	last_autoheld_call(B),
	activate_call(B, D),
	disconnect_call(A, C),
	append([C], [D], E), !.
call_actions(A, disconnected, [B]) :-
	disconnect_call(A, B), !.
call_actions(A, callout, B) :-
	has_active_video_call,
	disconnect_call(A, B), !.
call_actions(C, callout, F) :-
	not(has_alerting_call),
	number_of_calls(A),
	max_allowed_calls(B),
	A<B,
	autohold_active_calls(C, D),
	create_call(C, E),
	append(D, [E], F), !.
call_actions(C, created, [D]) :-
	(   not(has_alerting_call),
	    not(has_conference_call),
	    number_of_calls(A),
	    max_allowed_calls(B),
	    A<B
	->  create_call(C, D)
	;   reject_call(C, busy, D)
	).
call_actions(A, active, [B]) :-
	not(has_active_call),
	activate_call(A, B), !.
call_actions(A, active, D) :-
	autohold_active_calls(A, B),
	activate_call(A, C),
	append(B, [C], D), !.
call_actions(A, _, [B]) :-
	reject_call(A, B), !.


number_of_calls(A) :-
	num_calls_in_state(created, B),
	num_calls_in_state(callout, C),
	num_calls_in_state(active, D),
	num_calls_in_state(onhold, E),
	num_calls_in_state(autohold, F),
	A=B+C+D+E+F.


call_prefix(cellular, '/org/freedesktop/Telepathy/Connection/ring/tel/ring/').
call_prefix(skype, '/org/freedesktop/Telepathy/Connection/spirit/skype/').
call_prefix(gtalk, '/org/freedesktop/Telepathy/Connection/gabble/jabber/').


audio_groups(A, [[active_media_group, [group, cscall], [media, audio_playback], [reqstate, A]], [active_media_group, [group, cscall], [media, audio_flashplay], [reqstate, A]]]).


peerhungup_call(A, [A, peerhungup]).


has_localhungup_call :-
	call_exists([state], [localhungup]).


has_held_call :-
	(   call_exists([state], [onhold])
	;   call_exists([state], [autohold])
	).


rules([call_request/3, call_audio_update/1]).


has_outgoing_call :-
	call_exists([state, direction], [created, outgoing]).


has_peerhungup_call :-
	(   call_exists([state, direction, connected], [peerhungup, incoming, yes])
	;   call_exists([state, direction], [peerhungup, outgoing])
	).


has_early_emergency_call :-
	fact_exists('com.nokia.policy.emergency_call', [state], [active]).


nonholdable_call(A) :-
	call_exists([id, holdable], [A, no]).


disconnect_call(A, [A, disconnected]).


active_audio_groups(A) :-
	(   (   has_active_call
	    ;   has_held_call
	    ;   has_outgoing_call
	    ;   has_peerhungup_call
	    ;   has_early_emergency_call
	    )
	->  audio_groups(on, A)
	;   audio_groups(off, A)
	).


has_active_call :-
	(   call_exists([state], [active])
	;   call_exists([state], [conference])
	).


max_allowed_calls(2).


hold_call(A, [A, onhold]).


autohold_by_cellular(B) :-
	find_calls(active, A),
	autohold_by_cellular_(A, [], B).


is_cellular_path(A) :-
	sub_string(A, 0, 52, _, '/org/freedesktop/Telepathy/Connection/ring/tel/ring/').


autohold_or_disconnect(A, B) :-
	(   nonholdable_call(A),
	    disconnect_call(A, B)
	;   autohold_action(A, B)
	), !.


autohold_by_noncellular(B) :-
	find_calls(active, A),
	maplist(autohold_call, A, B).


localhungup_call(A, [A, localhungup]).


autohold_by_cellular_([], A, A).
autohold_by_cellular_([A|B], D, E) :-
	is_cellular_call(A),
	cmt_autohold_call(A, C),
	autohold_by_cellular_(B, [C|D], E), !.
autohold_by_cellular_([A|B], D, E) :-
	autohold_call(A, C),
	autohold_by_cellular_(B, [C|D], E), !.


is_cellular_call(A) :-
	call_exists([id, path], [A, B]),
	is_cellular_path(B).


autohold_call(A, B) :-
	autohold_or_disconnect(A, B).


activate_call(A, [A, active]).


last_autoheld_call(B) :-
	autohold_orders(A),
	max_elem(A, C),
	call_exists([id, state, order], [B, autohold, C]).


autohold_action(A, [A, autohold]).


cmt_autohold_call(A, [A, cmtautohold]).


has_conference_call :-
	call_exists([state], [conference]).


num_calls_in_state(A, C) :-
	find_calls(A, B),
	length(B, C).


is_conference_parent(A) :-
	call_exists([id, parent], [A, A]).


find_calls(B, C) :-
	findall(A, call_exists([id, state], [A, B]), C).


max_elem_([], A, A).
max_elem_([A|C], B, D) :-
	compare(>, A, B),
	max_elem_(C, A, D), !.
max_elem_([_|A], B, C) :-
	max_elem_(A, B, C).


max_elem([B|A], C) :-
	max_elem_(A, B, C).


autohold_orders(B) :-
	findall(A, call_exists([order], [A]), B).


reject_call(A, [A, disconnected]).


call_exists(A, B) :-
	fact_exists('com.nokia.policy.call', A, B).


call_audio_update(A) :-
	active_audio_groups(A).


call_domain(A, B) :-
	call_exists([id, path], [A, C]),
	call_prefix(B, D),
	sub_atom(C, 0, _, _, D).


reject_call(A, B, [A, B]).


call_request(A, B, [D]) :-
	call_actions(A, B, C),
	append([call_action], C, D).


create_call(A, [A, created]).


has_alerting_call :-
	call_exists([state, direction], [created, incoming]).
