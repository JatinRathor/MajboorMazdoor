draw_self();

draw_set_color(c_red);

draw_line_width(
    x + ramp_x1,
    y + ramp_y1,
    x + ramp_x2,
    y + ramp_y2,
    3
);

draw_set_color(c_white);