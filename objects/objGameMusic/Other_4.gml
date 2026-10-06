
if !audio_is_playing(sfxBGMusicMain) {

    audio_stop_sound(sfxBossBGMusic);
    audio_sound_gain(sfxBGMusicMain,gameMusicLevel)
    audio_play_sound(sfxBGMusicMain,0,true,gameMusicLevel);
}