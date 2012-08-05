

volume_limit(alwayson, alwayson, A) :-
	profile_limit(systemsound, 100, A).
volume_limit(alwayson, cstone, 100).
volume_limit(alwayson, cscall, 100).
volume_limit(alwayson, ipcall, 100).
volume_limit(alwayson, camera, 100).
volume_limit(alwayson, ringtone, 100).
volume_limit(alwayson, alarm, 100).
volume_limit(alwayson, voiceui, 100).
volume_limit(alwayson, game, 100).
volume_limit(alwayson, player, 100).
volume_limit(alwayson, fmradio, 100).
volume_limit(alwayson, flash, 100).
volume_limit(alwayson, event, 100).
volume_limit(alwayson, systemsound, A) :-
	profile_limit(systemsound, 100, A).
volume_limit(alwayson, inputsound, A) :-
	profile_limit(silent, 0, 100, A).
volume_limit(alwayson, othermedia, A) :-
	profile_limit(silent, 0, 100, A).
volume_limit(alwayson, background, 100).
volume_limit(alwayson, idle, 100).
volume_limit(cstone, alwayson, A) :-
	profile_limit(systemsound, 100, A).
volume_limit(cstone, cstone, 100).
volume_limit(cstone, cscall, 100).
volume_limit(cstone, ipcall, 100).
volume_limit(cstone, camera, 100).
volume_limit(cstone, ringtone, 100).
volume_limit(cstone, alarm, 100).
volume_limit(cstone, voiceui, 100).
volume_limit(cstone, game, 100).
volume_limit(cstone, player, 100).
volume_limit(cstone, fmradio, 100).
volume_limit(cstone, flash, 100).
volume_limit(cstone, event, 100).
volume_limit(cstone, systemsound, A) :-
	profile_limit(systemsound, 100, A).
volume_limit(cstone, inputsound, A) :-
	profile_limit(silent, 0, 100, A).
volume_limit(cstone, othermedia, 100).
volume_limit(cstone, background, 100).
volume_limit(cstone, idle, 100).
volume_limit(cscall, alwayson, A) :-
	profile_limit(systemsound, 100, A).
volume_limit(cscall, cstone, 100).
volume_limit(cscall, cscall, 100).
volume_limit(cscall, ipcall, 100).
volume_limit(cscall, camera, 0).
volume_limit(cscall, ringtone, 0).
volume_limit(cscall, alarm, 0).
volume_limit(cscall, voiceui, 50).
volume_limit(cscall, game, 0).
volume_limit(cscall, player, 0).
volume_limit(cscall, flash, 0).
volume_limit(cscall, fmradio, 0).
volume_limit(cscall, event, 0).
volume_limit(cscall, systemsound, 0).
volume_limit(cscall, inputsound, 0).
volume_limit(cscall, othermedia, 0).
volume_limit(cscall, background, 10).
volume_limit(cscall, idle, 100).
volume_limit(ipcall, alwayson, A) :-
	profile_limit(systemsound, 100, A).
volume_limit(ipcall, cstone, 100).
volume_limit(ipcall, cscall, 100).
volume_limit(ipcall, ipcall, 100).
volume_limit(ipcall, camera, 0).
volume_limit(ipcall, ringtone, 0).
volume_limit(ipcall, alarm, 0).
volume_limit(ipcall, voiceui, 50).
volume_limit(ipcall, game, 0).
volume_limit(ipcall, player, 0).
volume_limit(ipcall, flash, 0).
volume_limit(ipcall, fmradio, 0).
volume_limit(ipcall, event, 0).
volume_limit(ipcall, systemsound, 0).
volume_limit(ipcall, inputsound, 0).
volume_limit(ipcall, othermedia, 0).
volume_limit(ipcall, background, 10).
volume_limit(ipcall, idle, 100).
volume_limit(camera, alwayson, 0).
volume_limit(camera, cstone, 0).
volume_limit(camera, cscall, 100).
volume_limit(camera, ipcall, 100).
volume_limit(camera, camera, 100).
volume_limit(camera, ringtone, 0).
volume_limit(camera, alarm, 0).
volume_limit(camera, voiceui, 0).
volume_limit(camera, game, 0).
volume_limit(camera, player, 0).
volume_limit(camera, flash, 0).
volume_limit(camera, fmradio, 0).
volume_limit(camera, event, 0).
volume_limit(camera, systemsound, 0).
volume_limit(camera, inputsound, 0).
volume_limit(camera, othermedia, 0).
volume_limit(camera, background, 0).
volume_limit(camera, idle, 0).
volume_limit(ringtone, alwayson, A) :-
	profile_limit(systemsound, 100, A).
volume_limit(ringtone, cstone, 100).
volume_limit(ringtone, cscall, 100).
volume_limit(ringtone, ipcall, 100).
volume_limit(ringtone, camera, 0).
volume_limit(ringtone, ringtone, 100).
volume_limit(ringtone, alarm, 0).
volume_limit(ringtone, voiceui, 10).
volume_limit(ringtone, game, 0).
volume_limit(ringtone, player, 0).
volume_limit(ringtone, flash, 0).
volume_limit(ringtone, fmradio, 0).
volume_limit(ringtone, event, 0).
volume_limit(ringtone, systemsound, 0).
volume_limit(ringtone, inputsound, 0).
volume_limit(ringtone, othermedia, 0).
volume_limit(ringtone, background, 0).
volume_limit(ringtone, idle, 0).
volume_limit(alarm, alwayson, A) :-
	profile_limit(systemsound, 100, A).
volume_limit(alarm, cstone, 0).
volume_limit(alarm, cscall, 0).
volume_limit(alarm, ipcall, 0).
volume_limit(alarm, camera, 0).
volume_limit(alarm, ringtone, 0).
volume_limit(alarm, alarm, 100).
volume_limit(alarm, voiceui, 0).
volume_limit(alarm, game, 0).
volume_limit(alarm, player, 0).
volume_limit(alarm, flash, 0).
volume_limit(alarm, fmradio, 0).
volume_limit(alarm, event, 0).
volume_limit(alarm, systemsound, 0).
volume_limit(alarm, inputsound, 0).
volume_limit(alarm, othermedia, 0).
volume_limit(alarm, background, 0).
volume_limit(alarm, idle, 0).
volume_limit(voiceui, alwayson, A) :-
	profile_limit(systemsound, 100, A).
volume_limit(voiceui, cstone, 100).
volume_limit(voiceui, cscall, 100).
volume_limit(voiceui, ipcall, 100).
volume_limit(voiceui, camera, 100).
volume_limit(voiceui, ringtone, 100).
volume_limit(voiceui, alarm, 100).
volume_limit(voiceui, voiceui, 100).
volume_limit(voiceui, game, 0).
volume_limit(voiceui, player, 0).
volume_limit(voiceui, flash, 0).
volume_limit(voiceui, fmradio, 0).
volume_limit(voiceui, event, 100).
volume_limit(voiceui, systemsound, 0).
volume_limit(voiceui, inputsound, 0).
volume_limit(voiceui, othermedia, 0).
volume_limit(voiceui, background, 50).
volume_limit(voiceui, idle, 100).
volume_limit(game, alwayson, A) :-
	profile_limit(systemsound, 100, A).
volume_limit(game, cstone, 100).
volume_limit(game, cscall, 100).
volume_limit(game, ipcall, 100).
volume_limit(game, camera, 100).
volume_limit(game, ringtone, 100).
volume_limit(game, alarm, 100).
volume_limit(game, voiceui, 100).
volume_limit(game, game, 100).
volume_limit(game, player, 100).
volume_limit(game, flash, 0).
volume_limit(game, fmradio, 100).
volume_limit(game, event, 100).
volume_limit(game, systemsound, 0).
volume_limit(game, inputsound, 0).
volume_limit(game, othermedia, A) :-
	profile_limit(silent, 0, 100, A).
volume_limit(game, background, 100).
volume_limit(game, idle, 100).
volume_limit(player, alwayson, A) :-
	profile_limit(systemsound, 100, A).
volume_limit(player, cstone, 100).
volume_limit(player, cscall, 100).
volume_limit(player, ipcall, 100).
volume_limit(player, camera, 100).
volume_limit(player, ringtone, 100).
volume_limit(player, alarm, 100).
volume_limit(player, voiceui, 100).
volume_limit(player, game, 100).
volume_limit(player, player, 100).
volume_limit(player, flash, 0).
volume_limit(player, fmradio, 0).
volume_limit(player, event, 100).
volume_limit(player, systemsound, 0).
volume_limit(player, inputsound, 0).
volume_limit(player, othermedia, 0).
volume_limit(player, background, 100).
volume_limit(player, idle, 100).
volume_limit(flash, alwayson, A) :-
	profile_limit(systemsound, 100, A).
volume_limit(flash, cstone, 100).
volume_limit(flash, cscall, 100).
volume_limit(flash, ipcall, 100).
volume_limit(flash, camera, 100).
volume_limit(flash, ringtone, 100).
volume_limit(flash, alarm, 100).
volume_limit(flash, voiceui, 100).
volume_limit(flash, game, 100).
volume_limit(flash, player, 100).
volume_limit(flash, flash, 100).
volume_limit(flash, fmradio, 0).
volume_limit(flash, event, 100).
volume_limit(flash, systemsound, 0).
volume_limit(flash, inputsound, 0).
volume_limit(flash, othermedia, 0).
volume_limit(flash, background, 100).
volume_limit(flash, idle, 100).
volume_limit(fmradio, alwayson, A) :-
	profile_limit(systemsound, 100, A).
volume_limit(fmradio, cstone, 100).
volume_limit(fmradio, cscall, 100).
volume_limit(fmradio, ipcall, 100).
volume_limit(fmradio, camera, 100).
volume_limit(fmradio, ringtone, 100).
volume_limit(fmradio, alarm, 100).
volume_limit(fmradio, voiceui, 100).
volume_limit(fmradio, game, 100).
volume_limit(fmradio, player, 0).
volume_limit(fmradio, flash, 0).
volume_limit(fmradio, fmradio, 100).
volume_limit(fmradio, event, 100).
volume_limit(fmradio, systemsound, 0).
volume_limit(fmradio, inputsound, 0).
volume_limit(fmradio, othermedia, 0).
volume_limit(fmradio, background, 0).
volume_limit(fmradio, idle, 100).
volume_limit(othermedia, alwayson, A) :-
	profile_limit(systemsound, 100, A).
volume_limit(othermedia, cstone, 100).
volume_limit(othermedia, cscall, 100).
volume_limit(othermedia, ipcall, 100).
volume_limit(othermedia, camera, 100).
volume_limit(othermedia, ringtone, 100).
volume_limit(othermedia, alarm, 100).
volume_limit(othermedia, voiceui, 100).
volume_limit(othermedia, game, 100).
volume_limit(othermedia, player, 100).
volume_limit(othermedia, flash, 100).
volume_limit(othermedia, fmradio, 100).
volume_limit(othermedia, event, 100).
volume_limit(othermedia, systemsound, A) :-
	profile_limit(systemsound, 100, A).
volume_limit(othermedia, inputsound, A) :-
	profile_limit(silent, 0, 100, A).
volume_limit(othermedia, othermedia, A) :-
	profile_limit(silent, 0, 100, A).
volume_limit(othermedia, background, 100).
volume_limit(othermedia, idle, 100).
volume_limit(event, alwayson, A) :-
	profile_limit(systemsound, 100, A).
volume_limit(event, cstone, 0).
volume_limit(event, cscall, 0).
volume_limit(event, ipcall, 0).
volume_limit(event, camera, 0).
volume_limit(event, ringtone, 0).
volume_limit(event, alarm, 0).
volume_limit(event, voiceui, 0).
volume_limit(event, game, 0).
volume_limit(event, player, 0).
volume_limit(event, flash, 0).
volume_limit(event, fmradio, 0).
volume_limit(event, event, 100).
volume_limit(event, systemsound, A) :-
	profile_limit(systemsound, 10, A).
volume_limit(event, inputsound, 0).
volume_limit(event, othermedia, 0).
volume_limit(event, background, 10).
volume_limit(event, idle, 100).
volume_limit(systemsound, alwayson, A) :-
	profile_limit(systemsound, 100, A).
volume_limit(systemsound, cstone, 100).
volume_limit(systemsound, cscall, 100).
volume_limit(systemsound, ipcall, 100).
volume_limit(systemsound, camera, 100).
volume_limit(systemsound, ringtone, 100).
volume_limit(systemsound, alarm, 100).
volume_limit(systemsound, voiceui, 100).
volume_limit(systemsound, game, 100).
volume_limit(systemsound, player, 100).
volume_limit(systemsound, flash, 100).
volume_limit(systemsound, fmradio, 100).
volume_limit(systemsound, event, 100).
volume_limit(systemsound, systemsound, A) :-
	profile_limit(systemsound, 100, A).
volume_limit(systemsound, inputsound, A) :-
	profile_limit(silent, 0, 100, A).
volume_limit(systemsound, othermedia, A) :-
	profile_limit(silent, 0, 100, A).
volume_limit(systemsound, background, 100).
volume_limit(systemsound, idle, 100).
volume_limit(inputsound, alwayson, A) :-
	profile_limit(systemsound, 100, A).
volume_limit(inputsound, cstone, 100).
volume_limit(inputsound, cscall, 100).
volume_limit(inputsound, ipcall, 100).
volume_limit(inputsound, camera, 100).
volume_limit(inputsound, ringtone, 100).
volume_limit(inputsound, alarm, 100).
volume_limit(inputsound, voiceui, 100).
volume_limit(inputsound, game, 100).
volume_limit(inputsound, player, 100).
volume_limit(inputsound, flash, 100).
volume_limit(inputsound, fmradio, 100).
volume_limit(inputsound, event, 100).
volume_limit(inputsound, systemsound, A) :-
	profile_limit(systemsound, 100, A).
volume_limit(inputsound, inputsound, A) :-
	profile_limit(silent, 0, 100, A).
volume_limit(inputsound, othermedia, A) :-
	profile_limit(silent, 0, 100, A).
volume_limit(inputsound, background, 100).
volume_limit(inputsound, idle, 100).
volume_limit(background, alwayson, A) :-
	profile_limit(systemsound, 100, A).
volume_limit(background, cstone, 100).
volume_limit(background, cscall, 100).
volume_limit(background, ipcall, 100).
volume_limit(background, camera, 100).
volume_limit(background, ringtone, 100).
volume_limit(background, alarm, 100).
volume_limit(background, voiceui, 100).
volume_limit(background, game, 100).
volume_limit(background, player, 100).
volume_limit(background, flash, 100).
volume_limit(background, fmradio, 100).
volume_limit(background, event, 100).
volume_limit(background, systemsound, A) :-
	profile_limit(systemsound, 100, A).
volume_limit(background, inputsound, A) :-
	profile_limit(silent, 0, 100, A).
volume_limit(background, othermedia, A) :-
	profile_limit(silent, 0, 100, A).
volume_limit(background, background, 100).
volume_limit(background, idle, 100).
volume_limit(idle, alwayson, A) :-
	profile_limit(systemsound, 100, A).
volume_limit(idle, cstone, 100).
volume_limit(idle, cscall, 100).
volume_limit(idle, ipcall, 100).
volume_limit(idle, camera, 100).
volume_limit(idle, ringtone, 100).
volume_limit(idle, alarm, 100).
volume_limit(idle, voiceui, 100).
volume_limit(idle, game, 100).
volume_limit(idle, player, 100).
volume_limit(idle, flash, 100).
volume_limit(idle, fmradio, 100).
volume_limit(idle, event, 100).
volume_limit(idle, systemsound, A) :-
	profile_limit(systemsound, 100, A).
volume_limit(idle, inputsound, A) :-
	profile_limit(silent, 0, 100, A).
volume_limit(idle, othermedia, A) :-
	profile_limit(silent, 0, 100, A).
volume_limit(idle, background, 100).
volume_limit(idle, idle, 100).
