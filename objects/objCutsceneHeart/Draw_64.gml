var _gui_scale = CAMERA.vport_w/CAMERA.wview;





if (draw_comic)
{  
    if fadeInAlpha<2 fadeInAlpha+=0.05;    
    draw_set_colour(c_black);
    draw_set_alpha(0.9*fadeInAlpha);
    draw_rectangle(0,0,384*_gui_scale,216*_gui_scale,false);
    draw_set_alpha(1);
    draw_set_colour(c_white);
        
    draw_sprite_ext(sprCutsceneHeartBrokeReaction,0,CAMERA.vport_w/2,CAMERA.vport_h/2,_gui_scale/2,_gui_scale/2,0,c_white,fadeInAlpha) ; 


    draw_set_font(fnt_base)
    draw_set_halign(fa_center)
    draw_set_valign(fa_middle)
    draw_text(CAMERA.vport_w/2,CAMERA.vport_h/2+ 400,"Press 'Space' to continue")
    draw_set_colour(c_white);


}