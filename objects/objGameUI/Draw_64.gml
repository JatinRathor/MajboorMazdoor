var _gui_scale = CAMERA.vport_w/CAMERA.wview;






var x_shift = 22*_gui_scale;

for(var i = 0; i<maxPlayerHP; i++) 
{        
        draw_sprite_ext(sprPlayerHeartBG,0,100 + x_shift*i,95,_gui_scale,_gui_scale,0,c_white,1);
        if (i<playerHp) draw_sprite_ext(sprPlayerHeart,heartFrame,100 + x_shift*i,90,_gui_scale,_gui_scale,0,c_white,1);
        
}

if (playerDead)
{  
    draw_set_colour(c_black);
    draw_rectangle(0,0,384*_gui_scale,216*_gui_scale,false);
    draw_set_colour(c_white);
     draw_set_font(fnt_base)
    draw_set_halign(fa_center)
    draw_set_valign(fa_middle)
    draw_text(CAMERA.vport_w/2,CAMERA.vport_h/2,"You are Dead")
    draw_set_colour(c_white);


}


if (startScreen)
{  

    draw_sprite_ext(sprgameSplash,0,0,0,_gui_scale/2,_gui_scale/2,0,c_white,1);

    draw_set_colour(c_black);
    draw_set_font(fnt_base)
    draw_set_halign(fa_center)
    draw_set_valign(fa_middle)
    draw_text(CAMERA.vport_w/2,CAMERA.vport_h/2 + 80*_gui_scale,"Press Space to Start")
     draw_set_colour(c_white);

  


}




if (gamePaused)
{  
    draw_set_colour(c_black);
    draw_set_alpha(1);
    draw_rectangle(0,0,384*_gui_scale,216*_gui_scale,false);
    draw_set_alpha(1);
    draw_set_colour(c_white);
     draw_set_font(fnt_base)
    draw_set_halign(fa_center)
    draw_set_valign(fa_middle)
    draw_text(CAMERA.vport_w/2,CAMERA.vport_h/2,"Game Paused")
    draw_set_colour(c_white);


}

if cutscenePlaying{
    if cutsceneBarFadein<1 cutsceneBarFadein=lerp(cutsceneBarFadein,1,0.1)
    draw_set_colour(c_black);
    draw_set_alpha(1);
    draw_rectangle(0,0,384*_gui_scale,(32*_gui_scale)*cutsceneBarFadein,false);

    draw_rectangle(0,CAMERA.vport_h-((32*_gui_scale)*cutsceneBarFadein),384*_gui_scale,CAMERA.vport_h,false);
    draw_set_alpha(1);
    draw_set_colour(c_white);
    

} else {cutsceneBarFadein=0}

