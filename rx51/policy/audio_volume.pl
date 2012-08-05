:- module(audio_volume,[set_volume_limits/1]).


volume_limit_action(A, C) :-
	media_group_type(sink, B),
	volume_limit(A, B, D),
	C=[volume_limit, [group, B], [limit, D]].


rules([set_volume_limits/1]).


set_volume_limits(C) :-
	playback:current_playback_group(audio_playback, A),
	findall(B, volume_limit_action(A, B), C).
