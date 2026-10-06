current_level = 0;
gameLevels = 
[
    rmGameMenu,
    rmTutorialArea,
    rmSubwaySurfer,
    rmLevel1,
    rmLevel2,
    rmLevel5,
    rmLevel4,
    rmLevel3,
    rmLevel7


]


GameProgress = function(){

    current_level++

}

JumpToNextPlayArea = function(){
    
    room_goto(gameLevels[current_level]);

}


JumpToNextPlayArea();


batAbilitySwitch = true;
doubleJumpAbilitySwitch = true;