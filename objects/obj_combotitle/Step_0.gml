if image_xscale = 1 && image_yscale = 1 //:>
	with (create_blur_afterimage(x, y, sprite_index, image_index, image_xscale)) {
		image_alpha = 0.3
}
title_index += 0.35
if (title_index >= 2)
	title_index = frac(title_index)
image_index = ((title * 2) + title_index)
mvsp = ((1 - (vsp / -50)) * 4) + 0.2
vsp = Approach(vsp, -50, mvsp)




if (alpha > 0 )
	alpha -= 0.05
else
	instance_destroy()

switch type
{
	default:
		if alpha > 1 {
			image_xscale = Approach(image_xscale, 1, .1)
			image_yscale = Approach(image_yscale, 1, .1)
		} else {
			image_xscale = Approach(image_xscale, 5, .05)
			image_yscale = Approach(image_xscale, 5, .05)
		}
	break;
	case 0:
		if alpha > 1 {
			image_xscale = Approach(image_xscale, 1, .1)
			image_yscale = Approach(image_yscale, 1, .1)
		} else {
			image_xscale = alpha
			image_yscale = alpha	
		}
	break

	case 3:
	image_xscale = Approach(image_xscale, 1, .1)
	image_yscale = Approach(image_yscale, 1, .1)
	if image_angle != 360 {
		image_angle = Approach(image_angle, 360, 30)
		
	} 
	break;
}
