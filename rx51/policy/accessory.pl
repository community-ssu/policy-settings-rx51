:- module(accessory,[selectable_audio/1, selectable_video/1, update_accessible_audio_entry/4, update_accessible_video_entry/3, update_selectable_audio_entry/4, update_selectable_video_entry/3]).


first_selectable_video_accessory(A, B) :-
	(   ground(A)
	;   A=undefined
	),
	(   selectable_video_accessory(A, B), !
	;   B=undefined
	).


selectable_video_accessory(B, A) :-
	video_accessory(A),
	not(B==A),
	accessible_video(A).


selectable_video_entry_list_elem(B, C, A) :-
	(   A=[selectable_video, [name, B], [selectable, C]]
	;   twin_video_device(B, D),
	    A=[selectable_video, [name, D], [selectable, C]]
	).


audio_driver_state(A, B) :-
	fact_exists('com.nokia.policy.audio_device_accessible', [name, driver], [A, B]).


selectable_video_entry(A, 1, B) :-
	(   ground(A),
	    accessible_video(A),
	    selectable_video_entry_list_elem(A, 1, B)
	;   accessory_exclude(A, C),
	    video_accessory(C),
	    selectable_video_entry_list_elem(C, 0, B)
	).
selectable_video_entry(A, 0, B) :-
	(   ground(A),
	    video_accessory(A),
	    selectable_video_entry_list_elem(A, 0, B)
	;   first_selectable_video_accessory(A, D),
	    video_accessory(C),
	    not(C=A),
	    (   C=D
	    *-> selectable_video_entry_list_elem(C, 1, B)
	    ;   selectable_video(C),
		selectable_video_entry_list_elem(C, 0, B)
	    )
	).


accessible_video(A) :-
	fact_exists('com.nokia.policy.video_device_accessible', [name, connected], [A, 1]).


audio_connected_state(A, B) :-
	fact_exists('com.nokia.policy.audio_device_accessible', [name, connected], [A, B]).


new_audio_driver_state(B, A, C) :-
	(   ground(A), !
	;   A= -1
	),
	(   A<0
	*-> audio_driver_state(B, C)
	;   C=A
	).


rules([update_accessible_video_entry/3, update_selectable_video_entry/3, update_accessible_audio_entry/4, update_selectable_audio_entry/4]).


accessible_audio_accessory(B, A) :-
	audio_accessory(A),
	not(B==A),
	accessible_audio(A).


new_audio_connect_state(B, A, C) :-
	(   ground(A), !
	;   A= -1
	),
	(   A<0
	*-> audio_connected_state(B, C)
	;   C=A
	).


first_accessible_audio_accessory(A, C, B) :-
	(   ground(A)
	;   A=undefined
	),
	(   accessible_audio_accessory(A, B),
	    audio_device_type(C, B), !
	;   B=undefined
	).


accessible_audio(A) :-
	fact_exists('com.nokia.policy.audio_device_accessible', [name, driver, connected], [A, 1, 1]).


top_priority_accessory(B, A, C) :-
	audio_device_type(A),
	first_accessible_audio_accessory(B, A, C).


selectable_audio_entry_list_elem(B, C, A) :-
	(   A=[selectable_audio, [name, B], [selectable, C]]
	;   twin_audio_device(B, D, E),
	    accessible_audio(D),
	    A=[selectable_audio, [name, E], [selectable, C]]
	).


selectable_video(A) :-
	fact_exists('com.nokia.policy.video_device_selectable', [name, selectable], [A, 1]).


video_connected_state(A, B) :-
	fact_exists('com.nokia.policy.video_device_accessible', [name, connected], [A, B]).


selectable_audio_entry(A, 1, B) :-
	(   ground(A),
	    accessible_audio(A),
	    selectable_audio_entry_list_elem(A, 1, B)
	;   selectable_audio(C),
	    accessory_exclude(A, C),
	    selectable_audio_entry_list_elem(C, 0, B)
	).
selectable_audio_entry(A, 0, B) :-
	(   ground(A),
	    selectable_audio_entry_list_elem(A, 0, B)
	;   audio_device_type(C, A),
	    top_priority_accessory(A, C, E),
	    audio_accessory(D),
	    audio_device_type(C, D),
	    not(D=A),
	    (   D=E
	    *-> selectable_audio_entry_list_elem(D, 1, B)
	    ;   accessory_exclude(E, D)
	    *-> selectable_audio(D),
		selectable_audio_entry_list_elem(D, 0, B)
	    ;   accessible_audio(D),
		selectable_audio_entry_list_elem(D, 1, B)
	    )
	).


update_accessible_audio_entry(A, B, C, D) :-
	(   audio_accessory(A)
	*-> new_audio_driver_state(A, B, E),
	    new_audio_connect_state(A, C, F),
	    D=[[accessible_audio, [name, A], [driver, E], [connected, F]]]
	;   D=[]
	).


update_selectable_audio_entry(A, B, C, H) :-
	(   audio_accessory(A)
	*-> new_audio_driver_state(A, B, D),
	    new_audio_connect_state(A, C, E),
	    F is D/\E,
	    findall(G, selectable_audio_entry(A, F, G), H)
	;   H=[]
	).


update_accessible_video_entry(B, A, C) :-
	(   A>=0,
	    video_accessory(B)
	*-> C=[[accessible_video, [name, B], [connected, A]]]
	;   C=[]
	).


update_selectable_video_entry(A, B, D) :-
	(   accessory(A),
	    B>=0
	*-> findall(C, selectable_video_entry(A, B, C), D)
	;   D=[]
	).


selectable_audio(A) :-
	fact_exists('com.nokia.policy.audio_device_selectable', [name, selectable], [A, 1]).
