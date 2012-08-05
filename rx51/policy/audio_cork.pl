:- module(audio_cork,[set_corks/1]).


cork_action(A, C) :-
	media_group_type(sink, B),
	cork(A, B, D),
	C=[cork_stream, [group, B], [cork, D]].


rules([set_corks/1]).


set_corks(C) :-
	playback:current_playback_group(audio_playback, A),
	findall(B, cork_action(A, B), C).
