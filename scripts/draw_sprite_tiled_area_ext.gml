/// draw_sprite_tiled_area_ext(sprite,subimg,x,y,x1,y1,x2,y2,color,alpha)
//
//  Draws a repeated sprite image, tiled to fill a given region and with
//  a given offset. 
//
//      sprite      sprite to draw, real
//      subimg      sprite subimage to draw, real
//      x,y         origin offset, real
//      x1,y1       top-left corner of tiled area, real
//      x2,y2       bottom-right corner of tiled area, real
//      color       color blending, real
//      alpha       alpha blending, real
//
/// GMLscripts.com/license

var sprite,subimg,xx,yy,x1,y1,x2,y2;
sprite = argument0;
subimg = argument1;
xx = argument2;
yy = argument3;
x1 = argument4;
y1 = argument5;
x2 = argument6;
y2 = argument7;

var sw,sh,i,j,jj,left,top,width,height,X,Y;
sw = sprite_get_width(sprite);
sh = sprite_get_height(sprite);

i = x1 - ((x1 mod sw)-(xx mod sw)) - sw*((x1 mod sw)<(xx mod sw));
j = y1 - ((y1 mod sh)-(yy mod sh)) - sh*((y1 mod sh)<(yy mod sh)); 
jj = j;

for (i=i; i<=x2; i+=sw) {

    for (j=j ;j<=y2; j+=sh) {

        if(i <= x1) left = x1-i;
        else left = 0;
        X = i+left;

        if(j <= y1)top = y1-j;
        else top = 0;
        Y = j+top;

        if(x2 <= i+sw) width = ((sw)-(i+sw-x2)+1)-left;
        else width = sw-left;

        if(y2 <= j+sh) height = ((sh)-(j+sh-y2)+1)-top;
        else height = sh-top;

        draw_sprite_part_ext(sprite,subimg,left,top,width,height,X,Y,1,1,argument8,argument9);
    }
    j = jj;
}
return 0;
