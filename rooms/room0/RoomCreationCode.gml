global.c =  min(display_get_height()/720, display_get_width()/1280);
var c = global.c;
c*=7/8;
surface_resize(application_surface, c*1280, c*720);
window_set_size(c*1280, c*720);

window_set_position((display_get_width()-c*1280)/2, (display_get_height()-c*720)/2); 

global.save_data = ds_map_create();

room_goto(room_tutorial1_sprint);
//room_goto(room_testing);
//room_goto(room_electric_test)

enum shape { //collision shapes
	circle,
	rectangle,
	length
}