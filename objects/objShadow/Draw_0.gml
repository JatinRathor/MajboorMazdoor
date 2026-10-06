if instance_exists(owner)
{
    var _heigtfactor = -(owner.z+1)/140   
    draw_set_alpha(0.3);
    draw_set_colour(c_black);
    draw_sprite_ext(sprShadow,0,owner.x,owner.bbox_bottom,1-_heigtfactor,1-_heigtfactor,0,c_white,0.5);
    draw_set_alpha(1);
    draw_set_colour(c_white);
}