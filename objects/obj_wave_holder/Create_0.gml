/// @description Initializing Variables

waves[0, 0] = 0;
cur_wave = 0;
cur_room = 0;
bars = 0;

rx1 = 0; rx2 = 0; ry1 = 0; ry2 = 0;

lid = layer_get_id("Borders");
tm = layer_tilemap_get_id(lid);