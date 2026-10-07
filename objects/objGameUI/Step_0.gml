

if playerDead{
    
    game_pause();   
    if keyboard_check_pressed(vk_anykey) {game_restart();}

}

if InputPressed(INPUT_VERB.CANCEL) && instance_exists(objPlayer){

    gamePaused = !gamePaused;  
    game_pause(gamePaused); 
   
}


if keyboard_check_pressed(vk_anykey) && (startScreen){

        startScreen = false;
        with(objGameProgression) {
            GameProgress();
            JumpToNextPlayArea();
        }
   
}

heartFrame  += 0.2;


if keyboard_check_pressed(vk_shift) {

                    if instance_exists(objPlayer)
                    var _heart = instance_create_layer(objPlayer.x,objPlayer.y-22,"Instances",objFallingHeart);
   
}

                    