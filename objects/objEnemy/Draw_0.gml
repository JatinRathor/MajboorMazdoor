var _color = c_white;
//if (enemyState == ENEMYSTATE.HURT) _color = c_red
draw_sprite_ext(sprite_index,image_index,x,y+z,((image_xscale) - (squasheight*2)) * facing ,image_yscale+squasheight,0,_color,1)


if (flashTimer-- > 0) {
    gpu_set_blendmode(bm_add);
    draw_set_color(c_white);
    draw_set_alpha(0.9);

    draw_sprite_ext(sprite_index,image_index,x,y+z,((image_xscale) - (squasheight*2)) * facing ,image_yscale+squasheight,0,c_white,1)

    draw_set_alpha(1);
    gpu_set_blendmode(bm_normal);
}