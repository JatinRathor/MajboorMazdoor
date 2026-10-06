

switch (fallPhase) {

    case 0:     fallPhase = 1;
                var _fallDown = function(){fallPhase = 2}
                call_later(1, time_source_units_seconds, _fallDown, false);
            break; 

    case 1: x = origin_x + irandom_range(-1,1);  
            break; 

    case 2: y += 4;
            if (y>190) fallPhase = -1;
            break; 

    case -1:
            if (picked) 
            {
                x = objPlayer.x;
                y = objPlayer.y + objPlayer.z - 64;
            }

            break;
    
}

    
