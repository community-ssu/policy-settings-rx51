

configuration([hwconfig, media_groups, control_groups, profile, playback_rules, accessory_rules, audio_route_rules, audio_volume_rules, audio_cork_rules, cgroup_partition_rules, cgroup_freeze_rules, cgroup_schedule_rules]).


subsystems([playback, accessory, video_route, audio_route, audio_volume, audio_cork, audio_mute, cgroup_partition, cgroup_freeze, cgroup_schedule, context, telephony]).
% Load our 'configuration' and 'subsystems'. libprolog.pl relies on subsystems.
:- configuration(List), ensure_loaded(List).
:- subsystems(List), use_module(List).
