:- module(cgroup_freeze,[cgroup_freeze/1, cgroup_freeze/3]).


systemui(A) :-
	fact_exists('com.nokia.policy.systemui', [value], [A]).


rotate(A) :-
	fact_exists('com.nokia.policy.rotate', [value], [A]).


rotation_to_state(on, frozen).
rotation_to_state(off, thawed).


iowait(A) :-
	fact_exists('com.nokia.policy.iowait', [value], [A]).


pop_to_state(popup, frozen).
pop_to_state(popdown, thawed).


freeze_entry(A, B, C, D, E, G) :-
	partition(F),
	freeze_state(A, B, C, D, E, F, H),
	G=[partition_freeze, [partition, F], [state, H]].


cgroup_current(A) :-
	fact_exists('com.nokia.policy.cgroup_current', [value], [A]).


phase_to_state(start, frozen).
phase_to_state(ready, thawed).
phase_to_state(stop, thawed).


cgroup_freeze(C) :-
	playback:current_mode(A, B),
	cgroup_freeze(A, B, C).


iowait_to_state(low, thawed).
iowait_to_state(high, frozen).


get_freeze_state(A) :-
	nb_getval(freeze_state, A).


reset_freeze_state :-
	nb_setval(freeze_state, thawed).


freeze_state(A, B, C, D, E, F, G) :-
	reset_freeze_state,
	forall(calculate_freeze_state(A, B, C, D, E, F), true),
	get_freeze_state(G).


cgroup_freeze(A, B, K) :-
	(   mode(A),
	    phase_to_state(B, F),
	    rotate(C),
	    rotation_to_state(C, G),
	    iowait(D),
	    iowait_to_state(D, H),
	    systemui(E),
	    pop_to_state(E, I),
	    findall(J, freeze_entry(A, F, G, H, I, J), K), !
	;   K=[]
	).


rules([cgroup_freeze/1, cgroup_freeze/3]).


calculate_freeze_state(A, C, _, _, _, B) :-
	partition_mode_freeze(A, B),
	set_freeze_state(C).
calculate_freeze_state(_, _, C, _, _, A) :-
	partition_rotation_freeze(A),
	cgroup_current(B),
	not(cgroup_partition(B, A)),
	set_freeze_state(C).
calculate_freeze_state(_, _, _, B, _, A) :-
	partition_iowait_freeze(A),
	set_freeze_state(B).
calculate_freeze_state(_, _, _, _, B, A) :-
	partition_systemui_freeze(A),
	set_freeze_state(B).
calculate_freeze_state(_, _, _, _, _, _).


cgroup_partition(A, B) :-
	fact_exists('com.nokia.policy.cgroup_partition', [group, partition], [A, B]).


set_freeze_state(A) :-
	(   A=frozen
	*-> nb_setval(freeze_state, A)
	;   true
	).
