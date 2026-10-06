if (heartReceived)
{
    show_debug_message(phase)
    switch (phase) {
        
        case 0: if InputPressed(INPUT_VERB.ACCEPT) && (fadeInAlpha>1.5) 
                {   
                    fadeInAlpha = 0;
                    phase = 1;
                }
                break;
        case 1: if InputPressed(INPUT_VERB.ACCEPT) && (fadeInAlpha>1.5) 
        {   
            fadeInAlpha = 0;
            phase = 2;
        }
        break;

        case 2: if InputPressed(INPUT_VERB.ACCEPT) && (fadeInAlpha>1.5) 
        {   
            fadeInAlpha = 0;
            phase = 3;
        }
        break;
    	
        case 3: if (fadeInAlpha>1.8) 
        {   
           show_debug_message("Moving to next room")
           with(objGameProgression) {
                GameProgress();
                JumpToNextPlayArea();
            }
        }
        break;
    }


}