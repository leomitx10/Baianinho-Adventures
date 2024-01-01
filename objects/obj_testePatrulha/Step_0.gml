hspd = dir * spd;
vspd = vspd + grv;

if (hspd != 0) 
    image_xscale = sign(hspd);

// COLISAO HORIZONTAL
if (place_meeting(x+hspd, y, obj_wall))
{
    while (!place_meeting(x+sign(hspd), y, obj_wall))
    {
	   x = x + sign(hspd);
    }
	dir = dir* -1;
    hspd = 0;
	
}
x = x + hspd;

// COLISAO VERTICAL
if (place_meeting(x, y+vspd, obj_wall))
{
    while (!place_meeting(x, y+sign(vspd), obj_wall))
    {
        y = y + sign(vspd);
    }
    vspd = 0;
	if(nao_cai && !position_meeting(x+(sprite_width/2), y + (sprite_height/2)+7, obj_wall)){
		dir = dir * -1;
	}
}
y = y + vspd;


