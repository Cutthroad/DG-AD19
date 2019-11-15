#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

varying vec4 vertTexCoord;
uniform sampler2D texture;
uniform sampler2D video;
uniform float deltax[3];
uniform float deltay[3];
uniform float freq[3];
uniform float amp[3];


void main(void)
{
  	vec2 p = vertTexCoord.xy;
    //float rojo  = sin(deltax[0]+p.x*freq[0])*amp[0] +0.5 + sin(deltay[0]+p.y*freq[0])*amp[0] +0.5;
    //float verde = sin(deltax[1]+p.x*freq[1])*amp[1] +0.5 + sin(deltay[1]+p.y*freq[1])*amp[1] +0.5;
    //float azul  = sin(deltax[2]+p.x*freq[2])*amp[2] +0.5 + sin(deltay[2]+p.y*freq[2])*amp[2] +0.5;
    //float alfa  = texture2D(texture,p).a;
    float rojo = texture2D(video,p).r + sin(deltax[0]+p.x*freq[0])*amp[0];
    float verde = texture2D(video,p).g + sin(deltay[1]+p.y*freq[1])*amp[1] ;
    float azul = texture2D(video,p).b +sin(deltax[2]+p.x*freq[2])*amp[2]  + sin(deltay[2]+p.y*freq[2])*amp[2] ;
    float alfa  = texture2D(texture,p).a;
    
	gl_FragColor = vec4(rojo,verde,azul,alfa);
}
