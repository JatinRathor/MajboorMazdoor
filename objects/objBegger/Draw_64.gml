var _gui_scale = CAMERA.vport_w/CAMERA.wview;

if (heartReceived){
    
    if fadeInAlpha<2 fadeInAlpha+=0.02;
     draw_set_colour(c_white);
    var _message_sprite = sprBeggerMessage0;

    switch (phase) {
        case 1: _message_sprite = sprBeggerMessage1; break;
        case 2: _message_sprite = sprBeggerMessage2;break;
    }
    
   


    if (phase == 3)
    {    
        draw_set_colour(c_black);
        draw_set_alpha(fadeInAlpha);
        draw_rectangle(0,0,384*_gui_scale,216*_gui_scale,false);
        draw_set_alpha(1);    
    } else { draw_sprite_ext(_message_sprite,0,(x-CAMERA.xview)*_gui_scale,(y-CAMERA.yview-80)*_gui_scale,_gui_scale/2,_gui_scale/2,0,c_white,fadeInAlpha); }
}

  
   
   