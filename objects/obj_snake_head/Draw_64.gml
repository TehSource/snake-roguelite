draw_set_font(fnt_main);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
var _text = "Control Mode: " + mode_names[control_mode];
draw_text(10, 10, _text);
