:- module(cgroup_schedule,[cgroup_schedule/1]).


schedule_entry(A, B) :-
	partition_rotation_schedule(A, D, C),
	B=[partition_schedule, [partition, C], [share, D]].


cgroup_schedule(C) :-
	(   rotate(A),
	    findall(B, schedule_entry(A, B), C), !
	;   C=[]
	).


rotate(A) :-
	fact_exists('com.nokia.policy.rotate', [value], [A]).


rules([cgroup_schedule/1]).
