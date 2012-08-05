

call_group(cscall).
call_group(ipcall).


media(audio_playback).
media(video_playback).
media(audio_recording).
media(video_recording).
media(audio_flashplay).


media_bit(audio_playback, 1).
media_bit(video_playback, 2).
media_bit(audio_recording, 4).
media_bit(video_recording, 8).
media_bit(audio_flashplay, 16).


media_group(alwayson).
media_group(cstone).
media_group(cscall).
media_group(ipcall).
media_group(camera).
media_group(ringtone).
media_group(alarm).
media_group(voiceui).
media_group(game).
media_group(player).
media_group(flash).
media_group(fmradio).
media_group(othermedia).
media_group(event).
media_group(systemsound).
media_group(inputsound).
media_group(background).
media_group(idle).


media_group(audio_playback, alwayson).
media_group(audio_playback, cstone).
media_group(audio_playback, cscall).
media_group(audio_playback, ipcall).
media_group(audio_playback, camera).
media_group(audio_playback, ringtone).
media_group(audio_playback, alarm).
media_group(audio_playback, voiceui).
media_group(audio_playback, game).
media_group(audio_playback, player).
media_group(audio_playback, flash).
media_group(audio_playback, fmradio).
media_group(audio_playback, event).
media_group(audio_playback, systemsound).
media_group(audio_playback, inputsound).
media_group(audio_playback, othermedia).
media_group(audio_playback, background).
media_group(video_playback, ipcall).
media_group(video_playback, camera).
media_group(video_playback, voiceui).
media_group(video_playback, game).
media_group(video_playback, player).
media_group(video_playback, flash).
media_group(video_playback, othermedia).
media_group(video_playback, background).
media_group(audio_recording, cscall).
media_group(audio_recording, ipcall).
media_group(audio_recording, camera).
media_group(audio_recording, player).
media_group(audio_recording, flash).
media_group(audio_recording, othermedia).
media_group(audio_recording, background).
media_group(video_recording, camera).
media_group(video_recording, player).
media_group(video_recording, flash).
media_group(video_recording, othermedia).
media_group(video_recording, background).
media_group(audio_flashplay, alwayson).
media_group(audio_flashplay, cstone).
media_group(audio_flashplay, cscall).
media_group(audio_flashplay, ipcall).
media_group(audio_flashplay, camera).
media_group(audio_flashplay, ringtone).
media_group(audio_flashplay, alarm).
media_group(audio_flashplay, voiceui).
media_group(audio_flashplay, game).
media_group(audio_flashplay, player).
media_group(audio_flashplay, flash).
media_group(audio_flashplay, fmradio).
media_group(audio_flashplay, event).
media_group(audio_flashplay, systemsound).
media_group(audio_flashplay, inputsound).
media_group(audio_flashplay, othermedia).
media_group(audio_flashplay, background).


media_group_interface_in_factstore(no_interface, alwayson).
media_group_interface_in_factstore(no_interface, cstone).
media_group_interface_in_factstore(active_media_group, cscall).
media_group_interface_in_factstore(playback, ipcall).
media_group_interface_in_factstore(playback, camera).
media_group_interface_in_factstore(playback, ringtone).
media_group_interface_in_factstore(playback, alarm).
media_group_interface_in_factstore(playback, voiceui).
media_group_interface_in_factstore(playback, game).
media_group_interface_in_factstore(playback, player).
media_group_interface_in_factstore(playback, flash).
media_group_interface_in_factstore(playback, fmradio).
media_group_interface_in_factstore(active_media_group, othermedia).
media_group_interface_in_factstore(playback, event).
media_group_interface_in_factstore(playback, systemsound).
media_group_interface_in_factstore(playback, inputsound).
media_group_interface_in_factstore(playback, background).
media_group_interface_in_factstore(no_interface, idle).


media_group_priority(13, alwayson).
media_group_priority(12, cstone).
media_group_priority(11, cscall).
media_group_priority(11, ipcall).
media_group_priority(10, camera).
media_group_priority(9, ringtone).
media_group_priority(8, alarm).
media_group_priority(7, voiceui).
media_group_priority(6, game).
media_group_priority(5, player).
media_group_priority(5, flash).
media_group_priority(5, fmradio).
media_group_priority(5, othermedia).
media_group_priority(4, event).
media_group_priority(3, systemsound).
media_group_priority(3, inputsound).
media_group_priority(2, background).
media_group_priority(1, idle).
media_group_priority(0, '<undef>').


media_group_seqno(18, alwayson).
media_group_seqno(17, cstone).
media_group_seqno(16, cscall).
media_group_seqno(15, ipcall).
media_group_seqno(14, camera).
media_group_seqno(13, ringtone).
media_group_seqno(12, alarm).
media_group_seqno(11, voiceui).
media_group_seqno(10, game).
media_group_seqno(9, player).
media_group_seqno(8, flash).
media_group_seqno(7, fmradio).
media_group_seqno(6, othermedia).
media_group_seqno(5, event).
media_group_seqno(4, systemsound).
media_group_seqno(3, inputsound).
media_group_seqno(2, background).
media_group_seqno(1, idle).
media_group_seqno(0, '<undef>').


media_group_type(sink, alwayson).
media_group_type(sink, cstone).
media_group_type(sink, cscall).
media_group_type(source, cscall).
media_group_type(sink, ipcall).
media_group_type(source, ipcall).
media_group_type(sink, camera).
media_group_type(sink, ringtone).
media_group_type(sink, alarm).
media_group_type(sink, voiceui).
media_group_type(sink, game).
media_group_type(sink, player).
media_group_type(source, player).
media_group_type(sink, flash).
media_group_type(source, flash).
media_group_type(sink, fmradio).
media_group_type(sink, othermedia).
media_group_type(source, othermedia).
media_group_type(sink, event).
media_group_type(sink, systemsound).
media_group_type(sink, inputsound).
media_group_type(sink, background).
media_group_type(sink, idle).
media_group_type(source, idle).


notification_group(alwayson).
notification_group(cstone).
notification_group(ringtone).
notification_group(alarm).
notification_group(event).
notification_group(systemsound).
notification_group(inputsound).


player_group(player).
player_group(flash).
player_group(fmradio).
player_group(othermedia).
player_group(background).
