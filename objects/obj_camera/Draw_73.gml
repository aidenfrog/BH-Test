/// @description Insert description here
// You can write your code in this editor
if(cur_frame < 2) {
	if(cur_frame == 1) {
		frame0_image = sprite_create_from_surface(application_surface,0,0,surface_get_width(application_surface),surface_get_height(application_surface),0,0,0,0);
		instance_activate_object(obj_player);
	}
}
else if(pan) {
	var hratio = def_height/surface_get_height(application_surface);
	var wratio = def_width/surface_get_width(application_surface);
	surface_set_target(pan_surf);
	draw_sprite_ext(pan_image, 0, 0, 0, wratio, hratio, 0, c_white, 1);
	surface_reset_target();
	draw_surface(pan_surf, pan_x, pan_y);
	draw_sprite_ext(frame0_image, 0, 
						pan_x + (pan_dir == trans_dir.west ? -def_width : (pan_dir == trans_dir.east ? def_width : 0)), 
						pan_y + (pan_dir == trans_dir.north ? -def_height : (pan_dir == trans_dir.south ? def_height : 0)), 
						wratio, hratio, 0, c_white, 1);
	switch(pan_dir) {
		case trans_dir.north:
			pan_y += pan_yv*dt;
			pan_py += pan_pyv*dt;
			break;
		case trans_dir.south:
			pan_y -= pan_yv*dt;
			pan_py -= pan_pyv*dt;
			break;
		case trans_dir.east:
			pan_x -= pan_xv*dt;
			pan_px -= pan_pxv*dt;
			break;
		case trans_dir.west:
			pan_x += pan_xv*dt;
			pan_px += pan_pxv*dt;
			break;
	}
	draw_sprite_ext(obj_player.sprite_index, obj_player.image_index, pan_px, pan_py, obj_player.image_xscale, obj_player.image_yscale, 0, c_white, 1);
	if(t >= pan_time) {
		surface_free(pan_surf);
		sprite_delete(pan_image);
		sprite_delete(frame0_image);
		pan = false;
		camera_set_view_target(playerCamera, self);
		t = 0;
	}
}