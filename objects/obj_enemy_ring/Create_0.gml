/// @description Insert description here
// You can write your code in this editor
event_inherited();

t = 0;

r = 75;

hp = 10;

following = false;

x0 = x;
y0 = y;

n = random(5) + 3;

sdt = 1;

tilemap=layer_tilemap_get_id("Borders");

tm = layer_tilemap_get_id("Tiles");

frad = 300;
fspd0 = 40;
fspd = fspd0;
fspda = 10;
fspdmax = 170;
defspd = 40;
for(var c = 0; c < 12; c++) {
	var ring = instance_create_depth(x, y, 0, obj_bullet_enemy_ring);
	ring.x0 = x;
	ring.y0 = y;
	ring.t = 2*pi*c/12;
	ring.r = r;
	ring.parent = id;
}