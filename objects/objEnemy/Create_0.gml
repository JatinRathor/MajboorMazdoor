enum ENEMYSTATE {
    
    IDLE,
    MOVING,
    PAUSE,
    ATTACK,
    HURT,
    DEAD
    
}
moveSpeed = 0.5;       
     
xSpd = 0;           
zSpd = 0;
ySpd = 0;  

grav = 1;  
jumpForce = -12;

z = 0;
floorZ = 0;
height = 22;


shadow = instance_create_layer(x,y,"Instances",objShadow);
shadow.owner = self;

hp = 3;

hurtMethod = function(){
    
    canHurt = true;
    if (!GAMEPAUSED) enemyState = ENEMYSTATE.IDLE else enemyState = ENEMYSTATE.PAUSE;
   

}

hurtTimmer = time_source_create(time_source_game, 0.8, time_source_units_seconds, hurtMethod)
canHurt = true;

attackMethod = function(){
    
   canAttack = true;

}

attackTimmer = time_source_create(time_source_game, 2, time_source_units_seconds, attackMethod);
_attack_object = noone;
canAttack = true;
enemyState = ENEMYSTATE.IDLE;

baseSprite = sprEnemyToppy;
attackSprite = sprEnemyToppy;
attackSpriteMask = sprEnemyToppy;

//ImageFlasing
flashTimer = 0;
flashMaxTime = 18;

//Wiggle
squasheight = 0;


baseAngle = image_angle;
facing=1;


