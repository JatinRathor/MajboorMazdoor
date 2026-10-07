// Inherit the parent event
phase = 0;
loop_Call = undefined;

 var _fallMethod = function(){
    SHAKE_MAGNITUDE = 1.5;
    objGameMusic.playSFX(sfxPoof); 
    instance_create_depth(x -choose(-10,10,20,-15)  ,y-choose(-10,30,20,50) -30,depth-10,objAnim);}
loop_Call=call_later(0.3, time_source_units_seconds, _fallMethod, true);

alpha = 1;

alarm[0] = 200;
baseX = x;