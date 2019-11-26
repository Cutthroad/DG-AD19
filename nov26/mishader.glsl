#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

varying vec4 vertTexCoord;
uniform sampler2D texture;
uniform float ancho;
uniform float alto;
uniform float mouseX [170];
uniform float mouseY[170];
uniform vec2 pos[170];
uniform float radio [170];
uniform float cr [170];
uniform float cg [170];
uniform float cb [170];
uniform vec3 colores [170];



vec3 circulo (vec2 XY, vec2 p, float radio, vec3 v){
    vec3 resultado;
    resultado.r = 0.0;
    resultado.g = 0.0;
    resultado.b = 0.0;
    
    float distancia = distance(vec2(XY.x*ancho/alto,XY.y),vec2(p.x*ancho/alto,(p.y)));
    if(distancia < radio){
        resultado.r += v.r*(radio-distancia)/radio;
        resultado.g += v.g*(radio-distancia)/radio;
        resultado.b += v.b*(radio-distancia)/radio;
    }
    return (resultado);
}

vec3 vert (vec2 XY, vec2 p, float radio, vec3 v){
    vec3 resultado;
    resultado.r = 0.0;
    resultado.g = 0.0;
    resultado.b = 0.0;
    
    float distancia = abs(XY.x - p.x);
    if(distancia < radio*0.05){
        resultado.r += v.r*(radio-distancia)/radio;
        resultado.g += v.g*(radio-distancia)/radio;
        resultado.b += v.b*(radio-distancia)/radio;
    }
    return (resultado);
}

vec3 hor (vec2 XY, vec2 p, float radio, vec3 v){
    vec3 resultado;
    resultado.r = 0.0;
    resultado.g = 0.0;
    resultado.b = 0.0;
    
    float distancia = abs(XY.y - p.y);
    if(distancia < radio*0.05){
        resultado.r += v.r*(radio-distancia)/radio;
        resultado.g += v.g*(radio-distancia)/radio;
        resultado.b += v.b*(radio-distancia)/radio;
    }
    return (resultado);
}
