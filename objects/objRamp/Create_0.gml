/// obj_ramp : Create Event

// --------------------------------------------------
// RAMP COLLISION POINTS
// Coordinates are LOCAL to the ramp object.
//
// Example:
// (0, 64)  = bottom-left
// (128, 0) = top-right
// --------------------------------------------------

ramp_x1 = 30;
ramp_y1 = 37;

ramp_x2 = 96;
ramp_y2 = 58;


// Get Y position on the ramp from an X position
get_surface_y = function(_world_x)
{
    var local_x = _world_x - x;

    var t = (local_x - ramp_x1) / (ramp_x2 - ramp_x1);

    t = clamp(t, 0, 1);

    return y + lerp(ramp_y1, ramp_y2, t);
};


// Check if X is inside the ramp
is_over_ramp = function(_world_x)
{
    var local_x = _world_x - x;

    return local_x >= min(ramp_x1, ramp_x2)
        && local_x <= max(ramp_x1, ramp_x2);
};