var _gui_scale = CAMERA.vport_w/CAMERA.wview;

if (draw_comic != -1)
{  
    if fadeInAlpha<2 fadeInAlpha+=0.02;  
    if fadeInAlphaBG<0.9 fadeInAlphaBG+=0.02;         
    draw_set_colour(c_black);
    draw_set_alpha(fadeInAlphaBG);
    draw_rectangle(0,0,384*_gui_scale,216*_gui_scale,false);
    draw_set_alpha(1);
    draw_set_colour(c_white);
    
    if (draw_comic == 0)    
    draw_sprite_ext(sprCutsceneLegBroke,0,CAMERA.vport_w/2,CAMERA.vport_h/2,_gui_scale/2,_gui_scale/2,0,c_white,fadeInAlpha) ; 
    else if (draw_comic == 1) 
    draw_sprite_ext(sprCutsceneLegBrokeReaction,0,CAMERA.vport_w/2,CAMERA.vport_h/2,_gui_scale/2,_gui_scale/2,0,c_white,fadeInAlpha) ; 

    draw_set_font(fnt_base)
    draw_set_halign(fa_center)
    draw_set_valign(fa_middle)
    draw_text(CAMERA.vport_w/2,CAMERA.vport_h/2+ 400,"Press 'Space' to continue")
    draw_set_colour(c_white);


}