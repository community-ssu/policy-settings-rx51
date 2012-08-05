

group_privacy_limit(alwayson, public).
group_privacy_limit(cstone, public).
group_privacy_limit(cscall, public).
group_privacy_limit(ipcall, public).
group_privacy_limit(camera, public).
group_privacy_limit(ringtone, A) :-
	profile(privacy, A).
group_privacy_limit(alarm, public).
group_privacy_limit(voiceui, public).
group_privacy_limit(game, public).
group_privacy_limit(player, public).
group_privacy_limit(flash, public).
group_privacy_limit(fmradio, public).
group_privacy_limit(event, A) :-
	profile(privacy, A).
group_privacy_limit(systemsound, public).
group_privacy_limit(othermedia, A) :-
	profile(privacy, A).
group_privacy_limit(background, public).
group_privacy_limit(idle, public).


implicated_privacy(public) :-
	current_playback_group(audio_playback, A),
	current_playback_group(video_playback, A),
	call_group(A).


invalid_audio_device_choice(A, sink, B) :-
	call_group(A),
	(   (   audio_route:privacy_override(public)
	    ;   audio_route:implicated_privacy(public)
	    )
	*-> audio_device_privacy(private, B)
	;   audio_device_privacy(public, B)
	).
invalid_audio_device_choice(A, sink, earpiece) :-
	call_group(A),
	current_playback_group(video_playback, A).
invalid_audio_device_choice(A, sink, earpieceandtvout) :-
	call_group(A),
	current_playback_group(video_playback, A).
invalid_audio_device_choice(A, sink, fmtx) :-
	call_group(A).
invalid_audio_device_choice(A, sink, bthsp) :-
	accessory:selectable_audio(fmtx),
	not(call_group(A)).
invalid_audio_device_choice(_, sink, bthsp) :-
	bluetooth_override(_).
invalid_audio_device_choice(_, sink, tvoutandbthsp) :-
	bluetooth_override(_).
invalid_audio_device_choice(ringtone, sink, A) :-
	audio_accessory(A),
	audio_device_privacy(private, A),
	audio_device_type(sink, A).
invalid_audio_device_choice(A, sink, earpiece) :-
	not(call_group(A)).
invalid_audio_device_choice(A, sink, earpieceandtvout) :-
	not(call_group(A)).
invalid_audio_device_choice(B, sink, A) :-
	twin_audio_device(A),
	not(notification_group(B)).
invalid_audio_device_choice(A, _, bta2dp) :-
	call_group(A).
invalid_audio_device_choice(A, _, tvoutandbta2dp) :-
	call_group(A).
invalid_audio_device_choice(_, source, headmike).
invalid_audio_device_choice(_, source, bthsp) :-
	not(audio_route:get_route(sink, bthsp)).
invalid_audio_device_choice(_, source, tvoutandbthsp) :-
	not(audio_route:get_route(sink, tvoutandbthsp)).
invalid_audio_device_choice(_, source, headset) :-
	not(audio_route:get_route(sink, headset)).
