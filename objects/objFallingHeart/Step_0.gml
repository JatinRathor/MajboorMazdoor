
depth = -bbox_bottom 

switch (fallPhase) {

    case 0: fallPhase = 1;
           
            break; 

    case 1: xspd = 3;  
            yspd = -8;
            fallPhase = 2;          
            break; 

    case 2: yspd += 0.5;
            
            var _fallDown = function(){fallPhase = -1}
            call_later(0.5, time_source_units_seconds, _fallDown, false);
            break; 

    case -1:yspd =0;
            if (picked) 
            {
                x = objPlayer.x;
                y = objPlayer.y + objPlayer.z - 64;
            }

            break;
    
}



xspd = lerp(xspd,0,0.04);

x += xspd;
y += yspd;

    
