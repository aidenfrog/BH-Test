///split_room(size)

var size = argument0; //x of top left corner

for(var xpos = 0; xpos < floor((room_width/64)/size); xpos++) {
	for(var ypos = 0; ypos < floor((room_height/64)/size); ypos++) {
		rx1[rn] = size*(xpos);
		rx2[rn] = size*(xpos+1);
		ry1[rn] = size*ypos;
		ry2[rn] = size*(ypos+1);
		rn++;
	}
}
	