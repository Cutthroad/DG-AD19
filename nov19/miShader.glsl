#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

varying vec4 vertTexCoord;
uniform sampler2D texture;
uniform float ancho;
uniform float alto;
uniform float mouseX;
uniform float mouseY;
uniform float radio;
uniform float cr;
uniform float cg;
uniform float cb;


void main(void)
{
  	vec2 p = vertTexCoord.xy;
    float rojo = texture2D(texture,p).r ;
    float verde = texture2D(texture,p).g ;
    float azul = texture2D(texture,p).b ;
    float alfa  = texture2D(texture,p).a;
    
    float distancia = distance(vec2(mouseX*3.0*0.5,mouseY),vec2(p.x*3.0*0.5,(p.y)));
    
    if(distancia < radio){
        rojo += cr*(radio-distancia)*3;
        verde += cg*(radio-distancia)*3;
        azul += cb*(radio-distancia)*3;
    }
    
    
	gl_FragColor = vec4(rojo,verde,azul,alfa);
}
