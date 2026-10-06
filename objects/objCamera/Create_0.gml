/// @description Initialize the views and the camera

target = noone;
cx=x;
cy=y;
cx_prev = x;
cy_prev = y;

globalvar CAMERA;
CAMERA = {
    xview : 0,
camera_id:undefined,
yview : 0,
xview : 0,
wview : 384,
hview : 216,
vport_w:1920,
vport_h:1080,
target_view:0


}; 

application_surface_draw_enable(false);

CAMERA.target_view = 0;

room_start_view_setup = function()
{
	view_enabled = true;
	view_set_visible(CAMERA.target_view, true);
	
	//Set the port bounds of view 0 to 640x480
	view_set_wport(CAMERA.target_view, CAMERA.vport_w);
	view_set_hport(CAMERA.target_view, CAMERA.vport_h);

	//Resize and center
	window_set_rectangle((display_get_width() - view_wport[CAMERA.target_view]) * 0.5, (display_get_height() - view_hport[CAMERA.target_view]) * 0.5, view_wport[CAMERA.target_view], view_hport[CAMERA.target_view]);
	surface_resize(application_surface,CAMERA.vport_w,CAMERA.vport_h);
	//window_set_fullscreen(true);

	CAMERA.camera_id = camera_create_view(32, 32, CAMERA.wview, CAMERA.hview, 0, -1, -1, -1, 32, 32);
	view_set_camera(CAMERA.target_view, CAMERA.camera_id);
	
	//GlobalvarCheck
	//Initialize the global variable for ease of use 
	//CAMERA.camera_id = view_camera[CAMERA.target_view];
	CAMERA.xview = camera_get_view_x(CAMERA.camera_id);
	CAMERA.yview = camera_get_view_y(CAMERA.camera_id);
	CAMERA.wview = camera_get_view_width(CAMERA.camera_id);
	CAMERA.hview = camera_get_view_height(CAMERA.camera_id);

    if instance_exists(objPlayer)
    {
    cx = objPlayer.x-CAMERA.wview/2;
    cy = objPlayer.y-25-CAMERA.hview/2
    }  else {
    	cx = CAMERA.wview/2;
        cy = 25-CAMERA.hview/2
    }
    
    // clamp the values 
    cx = clamp(cx, 0 - SHAKE_MAGNITUDE, room_width - (CAMERA.wview)+SHAKE_MAGNITUDE);
    cy = clamp(cy, 0 - SHAKE_MAGNITUDE, room_height- (CAMERA.hview)+SHAKE_MAGNITUDE);
    
    
    camera_set_view_pos(CAMERA.camera_id, cx, cy);

}


//GlobalvarCheck
globalvar SHAKE_MAGNITUDE;

SHAKE_MAGNITUDE = 0;
shake_offset=0;// this value will be added in the limitations of views so that the shake function works normally even if the player is at the corner

shake_amplitude = 0;
shake_frequency = 0;
shake_friction = 0;
shake_direction = 0;
shake_timer = 1;

zoomout_timer = 0;

room_start_view_setup();