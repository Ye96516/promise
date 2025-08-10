shader_type canvas_item;

void fragment() {
	vec2 uv=UV-.5;
	uv.x*=float(textureSize(TEXTURE,0).x)/float(textureSize(TEXTURE,0).y);
	//极坐标
	vec2 st=vec2(atan(uv.x,uv.y),length(uv));

	uv=vec2(st.x/PI+.5+st.y+TIME/6.,st.y);

	float x=uv.x*5.;
	//0.->0. | .1->.1 | .2->.2 | .3->.3 | .4->.4 | .5->.5 | .6->.4 |
	float m=min(fract(x),fract(1.-x));
	float c=smoothstep(0.,.01,m-uv.y);

	COLOR=vec4(vec3(c),1.);
}
