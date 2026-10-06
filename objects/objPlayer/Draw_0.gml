var _color = c_white;
var _randomAlpha = 1;
if (playerState == PLAYERSTATE.HURT) _randomAlpha = irandom_range(0.8,1);
draw_sprite_ext(sprite_index,image_index,x,y+z,image_xscale,image_yscale,image_angle,_color,_randomAlpha)



