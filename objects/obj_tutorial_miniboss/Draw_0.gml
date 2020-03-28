/// @description Insert description here
// You can write your code in this editor
if(phase mod 2 == 0) {
	surface_set_target(spell_surf);
	draw_sprite_ext(spr_galaxy_back, 0, 0, 0, surface_get_width(spell_surf)/sprite_get_width(spr_galaxy_back),
					surface_get_height(spell_surf)/sprite_get_height(spr_galaxy_back),
					0, c_white, 1);
	for(var c = -coff; c < surface_get_width(spell_surf); c+= sprite_get_width(spr_card_suits)) {
		for(var z = -coff; z < surface_get_height(spell_surf); z += sprite_get_height(spr_card_suits)) {
			draw_sprite_ext(spr_card_suits, 0, c, z, 1, 1, 0, c_white, .1);
		}
	}
	coff = (coff + cspd*dt) mod min(sprite_get_width(spr_card_suits), sprite_get_height(spr_card_suits));
	surface_reset_target();
	draw_surface(spell_surf, 64, 64);
}

draw_self();