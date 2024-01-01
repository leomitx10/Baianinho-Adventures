#region CONTROLE
key_right = keyboard_check(vk_right);
key_left = keyboard_check(vk_left);
key_jump = keyboard_check_pressed(ord("X")); // Alterado para check_pressed
#endregion
subir = keyboard_check(vk_up);
descer = keyboard_check(vk_down);

// SUBINDO ESCADA
if (place_meeting(x, y, obj_escada)) {
    if (subir) {
        vspd = velocidade_subida;
    }else if(descer){
		grv = 0;
		vspd = -velocidade_subida;
	} else {
		grv = 0;
        vspd = 0;	
		// Se não estiver pressionando para cima, pare de subir
    }
} 

if (!place_meeting(x, y, obj_escada)) {
	grv = 0.4;
}


#region RAMPA
	if(place_meeting(x+sign(hspd),y,obj_wall)){
		if(!place_meeting(x+sign(hspd),y-1,obj_wall)){
			y -= 1;	
		}
	}else{
		if(!place_meeting(x+sign(hspd),y+1,obj_wall)){
			if(place_meeting(x+sign(hspd),y+2,obj_wall)){
				y += 1;
			}
		}
	}
#endregion

//COLISAO HORIZONTAL
	if (place_meeting(x+hspd, y, obj_wall))
	{
		while (!place_meeting(x+sign(hspd), y, obj_wall))
		{
			x = x + sign(hspd);
		}
		hspd = 0;

		}else{
			x = x + hspd;
		}

#region MOVIMENTO
var move = key_right - key_left;
hspd = move * spd;
vspd = vspd + grv;

if (hspd != 0) 
    image_xscale = sign(hspd);
	
/*
// COLISAO HORIZONTAL
if (place_meeting(x+hspd, y, obj_wall))
{
    while (!place_meeting(x+sign(hspd), y, obj_wall))
    {
        x = x + sign(hspd);
    }
    hspd = 0;
}
x = x + hspd;
*/

// COLISAO VERTICAL
if (place_meeting(x, y+vspd, obj_wall))
{
    while (!place_meeting(x, y+sign(vspd), obj_wall))
    {
        y = y + sign(vspd);
    }
    vspd = 0;
}
y = y + vspd;

// MORTE DO JOGADOR

if(place_meeting(x+1,y, obj_inimigo_rato) 
&& sprite_index != spr_player_fall){
	game_restart();
}

// JUMP
if (place_meeting(x, y+1, obj_wall) && key_jump)
{
    if (!pulou) // Verifica se não está pulando atualmente
    {
        vspd -= 8;
        pulou = true; // Define que está pulando
    }
}
else
{
    pulou = false; // Define que não está pulando
}
#endregion

#region TROCA OS SPRITES

if (!place_meeting(x, y+1, obj_wall))
{
    if (sign(vspd) > 0.5) 
		// Verifica se o jogador está pulando na cabeça do inimigo
		if (place_meeting(x, y + 1, obj_inimigo_rato)) {
			vspd = -recuo_pulo; 
			with (obj_inimigo_rato) {
				instance_destroy();
			}
		}else{
			sprite_index = spr_player_fall; //spr_player_fall
		}
    else 
        sprite_index = spr_player_JumpInicial;// spr_player_JumpInicial
}

if (hspd = 0)
{
    if (place_meeting(x, y+1, obj_wall))
    {
        sprite_index = spr_player_idle;
    }
}

if (hspd != 0)
{
    if (place_meeting(x, y+1, obj_wall))
    {
        sprite_index = spr_player_running;
    }
}

#endregion
