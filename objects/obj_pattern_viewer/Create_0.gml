/// @description Insert description here
// You can write your code in this editor
update = true;
cur_box = -1;
cur_window = 0;
max_box = 6;
c_flag = false;

enum em {
	still,
	circle,
	chase,
	length
}

cur_mov = em.still;
em_op[em.still] = array();
em_op[em.circle] = array(po.en_w, po.en_wa);
em_op[em.chase] = array(po.en_spd, po.en_a);
mov_names = array("Still", "Circular", "Chasing");

enum mp {
	linear,
	loop_const,
	loop_alt,
	length	
}

bt_mov = mp.linear;
mp_op[mp.linear] = array(po.bt_spd, po.bt_a);
mp_op[mp.loop_const] = array(po.x_ex, po.x_disp, po.y_ex, po.bt_tspd, po.bt_ta);
mp_op[mp.loop_alt] = array(po.x_ex, po.x_disp, po.y_ex, po.bt_tspd, po.bt_ta);
mp_names = array("Linear", "Loop (constant)", "Loop (alternating)");

enum sp {
	circular,
	circular_spray,
	arc_spread,
	line_spread,
	length
}

bt_spawn = sp.circular;
sp_op[sp.circular] = array(po.cd, po.sp_n, po.sp_theta, po.sp_r);
sp_op[sp.circular_spray] = array(po.cd, po.sp_dtheta, po.sp_theta, po.sp_r);
sp_op[sp.arc_spread] = array(po.sp_theta, po.cd, po.sp_n, po.sp_r);
sp_op[sp.line_spread] = array(po.cd, po.sp_n, po.sp_x1, po.sp_y1, po.sp_x2, po.sp_y2);
sp_names = array("Circular", "Circular (spray)", "Arc Spread", "Linear Spread");

enum po {
	cd, //cooldown
	sp_n, //spawn n amnt
	sp_theta, //spawn theta offset
	sp_dtheta, //spawn delta theta
	sp_r, //spawn radius
	sp_x1, //spawn x1 val
	sp_y1, //spawn y2 val
	sp_x2, //spawn x2 val
	sp_y2, //spawn y2 val
	x_ex, //move x exageration
	y_ex, //move y exageration
	x_disp, //move x displavement
	en_spd, //enemy speed
	en_a, //enemy acceleration
	en_r, //enemy radius
	en_w, //enemy rotational speed
	en_wa, //enemy rotational acceleration
	bt_spd, //bullet speed
	bt_a, //bullet acceleration
	bt_tspd, //bullet tick speed (multiplier)
	bt_ta, //bullet tick acceleration (multiplier)
	bt_life, //bullet life
	length
}

vars = 0;
for(var c = 0; c < po.length; c++) {
	vars[c] = 0;
}
var_names = array("Cooldown (sec): ", "Bullet Amount: ", "Offset (rads): ", "dTheta (rads): ", "Spawn Radius: ",
				"Draw x1: ", "Draw y1: ", "Draw x2: ", "Draw y2: ", "X Exaggeration: ", "Y Exaggeration: ",
				"Enemy Acceleration: ", "Enemy Radius: ", "Enemy Rotational Speed: ", "Enemy Rotational Acceleration: ",
				"Bullet Speed: ", "Bullet Acceleration: ", "Bullet tickspeed: ", "Bullet tickacceleration: ",
				"Bullet life (sec): ");

var_ops = array_add(em_op, array_add(sp_op, mp_op));

keyboard_string = "";