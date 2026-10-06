// Inherit the parent event
event_inherited();


//// Change 'obj_radio' to your actual sound object name
//if (instance_exists(objPlayer)) {
    //// 1. Get the actual straight-line distance to the object
    //var dist = point_distance(objPlayer.x, objPlayer.y, x, y);
    //
    //// 2. Define your distances (in pixels)
    //var max_dist = 600; // Point where music becomes completely silent (0% volume)
    //var min_dist = 100; // Point where music reaches full blast (100% volume)
    //
    //// 3. Calculate volume mathematically between 0.0 and 1.0
    //var vol = 1 - ((dist - min_dist) / (max_dist - min_dist));
    //
    //// 4. Keep the volume clamped safely between 0% and 100%
    //vol = clamp(vol, 0, 1);
    //
    //// 5. Apply the volume directly to the running track
    //audio_sound_gain(sfxDGGuyDopler, vol, 0);
//} else {
    //// If the object is missing or destroyed, fade the music out
    //audio_sound_gain(sfxDGGuyDopler, 0, 0);
//}