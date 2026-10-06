// Inherit the parent event
event_inherited();

xSpd = lerp(xSpd,0,0.05)
if place_meeting_3d(x+xSpd,y,z,objSolid)
{
    while(!place_meeting_3d(x+sign(xSpd),y,z,objSolid)) x += sign(xSpd)*1;
    xSpd = 0;
}



x+=xSpd