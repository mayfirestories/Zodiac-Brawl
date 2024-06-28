
draw_self();
//
var cam = view_camera[0];
var cam_height = camera_get_view_height(cam);
var cam_width = camera_get_view_width(cam);
//Estoy poniendo estos en variables para cuando cambiemos los nombres de los objetos
var P1 = ariesObject;
var P1_xpos = ariesObject.x;
var P1_ypos = ariesObject.y;

var P2 = cancerObject;
var P2_xpos = cancerObject.x;
var P2_ypos = cancerObject.y;

//player 1 en rojo
draw_set_color(c_red);
draw_set_font(fnt_PlayerTag);
draw_text(P1_xpos, P1_ypos-P1.sprite_height,"P1");

//player 2 en blue
draw_set_color(c_blue);
draw_set_font(fnt_PlayerTag);
draw_text(P2_xpos, P2_ypos-P1.sprite_height,"P2");

// Reset los colores to white pq despues cambia los colores de todo el juego a rojo
draw_set_color(c_white);
