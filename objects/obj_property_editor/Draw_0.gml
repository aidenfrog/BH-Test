/// @description Insert description here
// You can write your code in this editor
if(editingMode) {
	if(sprite_exists(screenshot)) draw_sprite_ext(screenshot,0, 0,0,room_width,room_height,0,c_white,1);
	
	draw_set_colour(c_black);
	draw_set_alpha(.2);
	draw_rectangle(0, 0, room_width, room_height, false);
	draw_set_alpha(1);
	
	draw_line_width_color(room_width/3, 10, room_width/3, room_height-10, 4, c_green, c_green);
	draw_line_width_color(2*room_width/3, 10, 2*room_width/3, room_height-10, 4, c_green, c_green);
	
	var arr;
	var patx;
	
	//Spawn Column - Handles how the bullet spawner generates bullets
	patx = 30
	draw_text_transformed_colour(30, 60, "Spawn", 1.5, 1.5, 0, c_white, c_white, c_white, c_white, 1);
	draw_text_transformed_colour(70, 60+yspace*1.5, spawn_op_name[cur_spawn], 1.25, 1.25, 0, c_white, c_white, c_white, c_white, 1);
	if(!position_meeting(50, 60+yspace*1.5, obj_arrow)) {
		var la = instance_create_depth(50, 60+yspace*1.5, 1, obj_arrow);
		la.column = editor_column_type.spawn;
		la.delta = -1;
		var ra = instance_create_depth(room_width/3-70, 60+yspace*1.5, 1, obj_arrow);
		ra.column = editor_column_type.spawn;
		ra.delta = 1;
	}
	
	arr = spawn_settings[cur_spawn];
	for(var c = 0; c < array_length_1d(arr); c++) {
		draw_text_transformed_colour(patx, 60+(c+3)*yspace, spawn_vars_name[arr[c]], 1, 1, 0, c_white, c_white, c_white, c_white, 1);
		if(!position_meeting(patx + room_width/6, 60+(c+3)*yspace, input_box)) {
			var ib = instance_create_depth(patx + room_width/6, 60+(c+3)*yspace, 0, input_box);
			ib.column = editor_column_type.spawn;
			ib.variable = arr[c];
			ib.value = editor_get_attribute(ib.column, ib.variable, curObj);
		}
	}

	//Properties Column - Handles how the bullets move after being generated
	patx = room_width/3+30;
	draw_text_transformed_color(patx-15, 60, "Bullet Properties", 1.5, 1.5, 0, c_white, c_white, c_white, c_white, 1);
	draw_text_transformed_colour(patx+70, 60+yspace*1.5, pattern_op_name[cur_pattern], 1.25, 1.25, 0, c_white, c_white, c_white, c_white, 1);
	
	arr = pattern_settings[cur_pattern];
	for(var c = 0; c < array_length_1d(arr); c++) {
		draw_text_transformed_colour(patx, 60+(c+3)*yspace, pattern_vars_name[arr[c]], 1, 1, 0, c_white, c_white, c_white, c_white, 1);
		if(!position_meeting(patx + room_width/6, 60+(c+3)*yspace, input_box)) {
			var ib = instance_create_depth(patx + room_width/6, 60+(c+3)*yspace, 0, input_box);
			ib.column = editor_column_type.pattern;
			ib.variable = arr[c];
			ib.value = editor_get_attribute(ib.column, ib.variable, curObj);
		}
	}
	
	if(!position_meeting(patx+50, 60+yspace*1.5, obj_arrow)) {
		var la = instance_create_depth(patx+50, 60+yspace*1.5, 1, obj_arrow);
		la.column = editor_column_type.pattern;
		la.delta = -1;
		var ra = instance_create_depth(2*room_width/3-70, 60+yspace*1.5, 1, obj_arrow);
		ra.column = editor_column_type.pattern;
		ra.delta = 1;
	}
	
	//Path Column - Handles the movement of the bullet spawner itself
	patx = 2*room_width/3+30;
	draw_text_transformed_color(2*room_width/3+30, 60, "Path", 1.5, 1.5, 0, c_white, c_white, c_white, c_white, 1);
	draw_text_transformed_colour(patx+70, 60+yspace*1.5, path_op_name[cur_path], 1.25, 1.25, 0, c_white, c_white, c_white, c_white, 1);
	
	arr = path_settings[cur_path];
	for(var c = 0; c < array_length_1d(arr); c++) {
		draw_text_transformed_colour(patx, 60+(c+3)*yspace, path_vars_name[arr[c]], 1, 1, 0, c_white, c_white, c_white, c_white, 1);
		if(!position_meeting(patx + room_width/6, 60+(c+3)*yspace, input_box)) {
			var ib = instance_create_depth(patx + room_width/6, 60+(c+3)*yspace, 0, input_box);
			ib.column = editor_column_type.path;
			ib.variable = arr[c];
			ib.value = editor_get_attribute(ib.column, ib.variable, curObj);
		}
	}
	
	if(!position_meeting(patx+50, 60+yspace*1.5, obj_arrow)) {
		var la = instance_create_depth(patx+50, 60+yspace*1.5, 1, obj_arrow);
		la.column = editor_column_type.path;
		la.delta = -1;
		var ra = instance_create_depth(room_width-70, 60+yspace*1.5, 1, obj_arrow);
		ra.column = editor_column_type.path;
		ra.delta = 1;
	}
	
}