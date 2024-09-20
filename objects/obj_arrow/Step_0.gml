if(from_enemy and place_meeting(x,y,obj_player)){
	if(!obj_player.is_invencible){
		audio_play_sound(obj_player.hitted_sound,1,false);
		obj_player.health_points -= damage;
	}
	instance_destroy();
} else if(!from_enemy and place_meeting(x,y,obj_mob)){
	if(place_meeting(x,y,obj_mob)){
		var _mob_attacked_id = instance_place(x, y, obj_mob);
		with (_mob_attacked_id) {
			if(!is_hitted){
				audio_play_sound(hitted_sound,1,false);
				health_points--;
				is_hitted = true;
			}
			if (health_points <= 0) {
				instance_create_depth(x,y,-1,obj_death);
				instance_destroy();
			}
		}
	}
	instance_destroy();
}