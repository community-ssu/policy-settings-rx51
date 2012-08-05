:- module(video_route,[set_video_routes/1]).


current_tv_standard(B) :-
	(   fact_exists('com.nokia.policy.gconf', [key, value], ['/system/tvout', A]),
	    canonical_tv_standard(A, B), !
	;   B=pal
	).


rules([set_video_routes/1]).


canonical_tv_standard(pal, pal).
canonical_tv_standard('PAL', pal).
canonical_tv_standard('Pal', pal).
canonical_tv_standard(ntsc, ntsc).
canonical_tv_standard('NTSC', ntsc).
canonical_tv_standard('Ntsc', ntsc).


set_video_routes(A) :-
	route_to_device(B),
	current_tv_standard(C),
	A=[[video_route, [device, B], [tvstandard, C]]].


current_route(A) :-
	fact_exists('com.nokia.policy.video_route', [device], [A]).


route_to_device(A) :-
	video_device(A),
	accessory:selectable_video(A), !.
