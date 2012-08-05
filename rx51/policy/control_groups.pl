

control_group(system).
control_group(sysutils).
control_group(telephony).
control_group(desktop).
control_group(callui).
control_group(home).
control_group(mediasrc).
control_group(mediarend).
control_group(camera).
control_group(media).
control_group(browser).
control_group(messaging).
control_group(mail).
control_group(mapping).
control_group(gaming).
control_group(tracker).
control_group(download).
control_group(support).
control_group(contacts).
control_group(appmanager).
control_group(accessories).
control_group(apputils).
control_group(trusted).
control_group(default).


control_group_to_mode(camera, camera).
control_group_to_mode(media, media).
control_group_to_mode(browser, media).
control_group_to_mode(messaging, media).
control_group_to_mode(mail, media).
control_group_to_mode(mapping, navigation).
control_group_to_mode(gaming, game).
control_group_to_mode(tracker, background).
control_group_to_mode(support, background).
control_group_to_mode(telephony, telephony).
control_group_to_mode('<none>', background).
control_group_to_mode(desktop, background).


partition(system).
partition(desktop).
partition(active_ui).
partition(standby_ui).
partition(launcher).
partition(background).
