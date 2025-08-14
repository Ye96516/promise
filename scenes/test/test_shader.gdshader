shader_type canvas_item;

void fragment() {
	vec2 uv=UV;
	uv-=.5;
	uv.x*=float(textureSize(TEXTURE,0).x)/float(textureSize(TEXTURE,0).y);
	
	vec3 co=vec3(0.,0.,3.);
	vec3 ro=vec3(0.);
	vec3 rd=vec3(uv.x,uv.y,1.)-ro;
	
	float t=dot(co-ro,rd);
	vec3 p=ro+rd*t;
}

