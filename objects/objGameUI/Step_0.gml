if (playerHp<= 0){
    
    //DeathScreen
   playerDead = true;
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
