///enemy_chase_player();

if((obj_player.x >= rx1) && (obj_player.x <= rx2) && (obj_player.y >= ry1) && (obj_player.y <= ry2)) {
	var theta = point_direction(x0, y0, obj_player.x, obj_player.y)*pi/180;
	if !(tilemap_get_at_pixel(tilemap, x0+dt*cos(theta)*fspd+r*cos(t+sdt*dt), bbox_top) != 0 
	|| tilemap_get_at_pixel(tilemap, x0+dt*cos(theta)*fspd+r*cos(t+sdt*dt), bbox_bottom) != 0)
		x0 += dt*cos(theta)*fspd;
	if!(tilemap_get_at_pixel(tilemap, bbox_left, y0-dt*sin(theta)*fspd+r*sin(t+sdt*dt)) != 0 
	|| tilemap_get_at_pixel(tilemap, bbox_right, y0-dt*sin(theta)*fspd+r*sin(t+sdt*dt)) != 0)
		y0 -= dt*sin(theta)*fspd;
}