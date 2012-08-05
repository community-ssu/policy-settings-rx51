

media_group_to_mode(cscall, telephony).
media_group_to_mode(ipcall, telephony).
media_group_to_mode(camera, camera).
media_group_to_mode(ringtone, telephony).
media_group_to_mode(voiceui, navigation).
media_group_to_mode(game, game).
media_group_to_mode(player, media).
media_group_to_mode(flash, media).
media_group_to_mode(fmradio, media).
media_group_to_mode(othermedia, media).
media_group_to_mode(background, background).
media_group_to_mode(idle, idle).


context:mode(A) :-
	fact_exists('com.nokia.policy.mode', [foo, mode], [bar, A]).


mode(telephony).
mode(camera).
mode(navigation).
mode(game).
mode(media).
mode(background).
mode(idle).


mode_hooks(telephony, telephony_mode_start, telephony_mode_stop).
mode_hooks(camera, camera_mode_start, camera_mode_stop).
mode_hooks(navigation, navigation_mode_start, navigation_mode_stop).
mode_hooks(game, do_nothing_when_enter, do_nothing_when_leave).
mode_hooks(media, do_nothing_when_enter, do_nothing_when_leave).
mode_hooks(background, do_nothing_when_enter, do_nothing_when_leave).
mode_hooks(idle, do_nothing_when_enter, do_nothing_when_leave).


preempt_group(cscall, cscall).
preempt_group(cscall, ipcall).
preempt_group(cscall, ringtone).
preempt_group(cscall, alarm).
preempt_group(cscall, camera).
preempt_group(cscall, voiceui).
preempt_group(cscall, game).
preempt_group(cscall, player).
preempt_group(cscall, flash).
preempt_group(cscall, fmradio).
preempt_group(cscall, event).
preempt_group(cscall, systemsound).
preempt_group(cscall, inputsound).
preempt_group(cscall, othermedia).
preempt_group(cscall, background).
preempt_group(ipcall, cscall).
preempt_group(ipcall, ipcall).
preempt_group(ipcall, ringtone).
preempt_group(ipcall, alarm).
preempt_group(ipcall, camera).
preempt_group(ipcall, voiceui).
preempt_group(ipcall, game).
preempt_group(ipcall, player).
preempt_group(ipcall, flash).
preempt_group(ipcall, fmradio).
preempt_group(ipcall, event).
preempt_group(ipcall, systemsound).
preempt_group(ipcall, inputsound).
preempt_group(ipcall, othermedia).
preempt_group(ipcall, background).
preempt_group(camera, camera).
preempt_group(camera, ringtone).
preempt_group(camera, alarm).
preempt_group(camera, voiceui).
preempt_group(camera, game).
preempt_group(camera, player).
preempt_group(camera, flash).
preempt_group(camera, fmradio).
preempt_group(camera, event).
preempt_group(camera, systemsound).
preempt_group(camera, inputsound).
preempt_group(camera, othermedia).
preempt_group(camera, background).
preempt_group(voiceui, voiceui).
preempt_group(voiceui, game).
preempt_group(voiceui, player).
preempt_group(voiceui, flash).
preempt_group(voiceui, fmradio).
preempt_group(voiceui, event).
preempt_group(voiceui, othermedia).
preempt_group(voiceui, background).
preempt_group(game, game).
preempt_group(game, player).
preempt_group(game, flash).
preempt_group(game, fmradio).
preempt_group(game, event).
preempt_group(game, systemsound).
preempt_group(game, inputsound).
preempt_group(game, othermedia).
preempt_group(game, background).
preempt_group(player, player).
preempt_group(player, flash).
preempt_group(player, fmradio).
preempt_group(player, event).
preempt_group(player, systemsound).
preempt_group(player, inputsound).
preempt_group(player, othermedia).
preempt_group(player, background).
preempt_group(flash, player).
preempt_group(flash, fmradio).
preempt_group(flash, event).
preempt_group(flash, systemsound).
preempt_group(flash, inputsound).
preempt_group(flash, othermedia).
preempt_group(flash, background).
preempt_group(fmradio, player).
preempt_group(fmradio, flash).
preempt_group(fmradio, fmradio).
preempt_group(fmradio, event).
preempt_group(fmradio, systemsound).
preempt_group(fmradio, inputsound).
preempt_group(fmradio, othermedia).
preempt_group(fmradio, background).
preempt_group(othermedia, player).
preempt_group(othermedia, flash).
preempt_group(othermedia, fmradio).
preempt_group(othermedia, event).
preempt_group(othermedia, systemsound).
preempt_group(othermedia, inputsound).
preempt_group(othermedia, othermedia).
preempt_group(othermedia, background).
preempt_group(ringtone, flash).
preempt_group(ringtone, player).


restart_group(cscall, flash).
restart_group(cscall, background).
restart_group(cscall, systemsound).
restart_group(cscall, inputsound).
restart_group(ipcall, flash).
restart_group(ipcall, background).
restart_group(ipcall, systemsound).
restart_group(ipcall, inputsound).
restart_group(ringtone, flash).
restart_group(ringtone, player).
restart_group(ringtone, background).
restart_group(alarm, flash).
restart_group(alarm, background).
restart_group(event, flash).
restart_group(event, background).
restart_group(camera, flash).
restart_group(camera, systemsound).
restart_group(camera, inputsound).
restart_group(camera, background).
restart_group(voiceui, flash).
restart_group(voiceui, systemsound).
restart_group(voiceui, inputsound).
restart_group(voiceui, background).
restart_group(game, flash).
restart_group(game, systemsound).
restart_group(game, inputsound).
restart_group(game, background).
restart_group(player, flash).
restart_group(player, systemsound).
restart_group(player, inputsound).
restart_group(player, background).
restart_group(flash, flash).
restart_group(flash, systemsound).
restart_group(flash, inputsound).
restart_group(flash, background).
restart_group(fmradio, flash).
restart_group(fmradio, systemsound).
restart_group(fmradio, inputsound).
restart_group(fmradio, background).
restart_group(othermedia, flash).
restart_group(othermedia, background).
restart_group(background, flash).
restart_group(background, background).
