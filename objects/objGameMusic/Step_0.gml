if (switching_music){
    fadeIn = lerp(fadeIn,0,0.1);
    audio_sound_gain(currentBGMusic,gameMusicLevel*fadeIn)
    if (fadeIn < 0.05)
    {
        switching_music = false;
        audio_stop_sound(currentBGMusic);
        audio_play_sound(nextBGMusic,0,true,gameMusicLevel);

    }

}





