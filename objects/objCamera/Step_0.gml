/// @description  smooth transition of views

// TODO make these things capital and initialize 
CAMERA.xview = camera_get_view_x(CAMERA.camera_id);
CAMERA.yview = camera_get_view_y(CAMERA.camera_id);
CAMERA.wview = camera_get_view_width(CAMERA.camera_id);
CAMERA.hview = camera_get_view_height(CAMERA.camera_id);

//show_debug_message(CAMERA.camera_id);
//Trail effect
//var mdir = point_direction(target.x, target.y, mouse_x,mouse_y);

var _actual_cx, _actual_cy,_shake_with_firmness = SHAKE_MAGNITUDE ;

if instance_exists(objPlayer)
{
    if (objPlayer.surferMode)
    {_actual_cx = (objPlayer.x+125-CAMERA.wview/2)}
    else
    {_actual_cx = (objPlayer.x-CAMERA.wview/2)}

_actual_cy = (objPlayer.y-25-CAMERA.hview/2)
} else {
	
    	_actual_cx = CAMERA.wview/2;
        _actual_cy = 25-CAMERA.hview/2
}

cx += (_actual_cx-cx)*.4;
cy += (_actual_cy-cy)*.4;

// clamp the values 
cx = clamp(cx, 0 - SHAKE_MAGNITUDE, room_width - (CAMERA.wview)+SHAKE_MAGNITUDE);
cy = clamp(cy, 0 - SHAKE_MAGNITUDE, room_height- (CAMERA.hview)+SHAKE_MAGNITUDE);

// shake dem values
//show_debug_message(SHAKE_MAGNITUDE);
if (SHAKE_MAGNITUDE > 0){
	
	cx += random_range(-SHAKE_MAGNITUDE, SHAKE_MAGNITUDE);
	cy += random_range(-SHAKE_MAGNITUDE, SHAKE_MAGNITUDE);
	
	//shake_offset = SHAKE_MAGNITUDE;
	SHAKE_MAGNITUDE += (-SHAKE_MAGNITUDE)*.1;
	
} 
/*
if (shake_amplitude > 0){
	shake_timer += shake_frequency;
	shake_amplitude -= shake_friction;
	
	var _shake_amt = sin(shake_timer) * shake_amplitude;
	
	shake_offset = _shake_amt;
	
	cx += lengthdir_x(_shake_amt, shake_direction);
	cy += lengthdir_y(_shake_amt, shake_direction);
}
*/
camera_set_view_pos(CAMERA.camera_id, cx, cy);


