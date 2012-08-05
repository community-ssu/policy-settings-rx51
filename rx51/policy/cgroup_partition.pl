:- module(cgroup_partition,[cgroup_assign/1, cgroup_mode/3]).


partition_entry(B, C, A) :-
	A=[cgroup_partition, [group, B], [partition, C]].


cgroup_current(A) :-
	fact_exists('com.nokia.policy.cgroup_current', [value], [A]).


assign_entry(telephony, _, C) :-
	control_group_partition(telephony, A, B),
	partition_entry(A, B, C).
assign_entry(A, B, G) :-
	not(A=telephony),
	control_group_partition(A, C, F),
	(   migrating_group(B, C, D)
	*-> E=D
	;   E=F
	),
	partition_entry(C, E, G).


rules([cgroup_mode/3, cgroup_assign/1]).


cgroup_mode(A, active, C) :-
	(   control_group_to_mode(A, B),
	    playback:update_mode(B, C), !
	;   C=[]
	).
cgroup_mode(_, standby, A) :-
	A=[].


cgroup_assign(D) :-
	playback:current_mode(A),
	cgroup_current(B),
	findall(C, assign_entry(A, B, C), D).
