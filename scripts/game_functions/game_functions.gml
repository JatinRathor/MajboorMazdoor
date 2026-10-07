globalvar GAMEPAUSED;

GAMEPAUSED = false;

function place_meeting_3d(_x, _y, _z, _obj)
{
    var xyMeeting = instance_place(_x, _y, _obj);
    var zMeeting = false;
    
    if (xyMeeting)
    {
        zMeeting = rectangle_in_rectangle(0, xyMeeting.z, 1, xyMeeting.z + xyMeeting.z, 0, _z, 1, _z + height-1);

    }
    
    return xyMeeting && zMeeting;
}


function game_pause(_value = true){
    
    if (_value)
    {  GAMEPAUSED = true;
        with(objPlayer) {if (playerState != PLAYERSTATE.AUTOMATED) playerState = PLAYERSTATE.PAUSE};
        with(objEnemy) enemyState = ENEMYSTATE.PAUSE;
    } else {
        GAMEPAUSED = false;
    	with(objPlayer) playerState = PLAYERSTATE.IDLE;
        with(objEnemy) enemyState = ENEMYSTATE.IDLE;
    }

}

function setSprite(_sprite,_index= -1,_speed =1){
    sprite_index = _sprite;
    if (_index != -1) image_index = _index;    
    image_speed = _speed;


}

function cutsceneBar(_value = true){
    
     with(objGameUI) cutscenePlaying = _value;

}