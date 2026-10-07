gameBGMusicMode = 0;
currentBGMusic = sfxBGMusicMain;
nextBGMusic = undefined;

switching_music = false;


switchBGMusic = function(_musicName){

    if (currentBGMusic == _musicName) exit;
    switching_music = true;
    nextBGMusic  = _musicName;  

}


playSFX = function(_sfxName){
     
    audio_play_sound(_sfxName,0,false,gameMusicLevel);
}

gameMusicLevel = 0.4;
fadeIn = 1;

 audio_play_sound(currentBGMusic,0,true,gameMusicLevel);

audio_falloff_set_model(audio_falloff_linear_distance);