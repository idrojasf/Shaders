#ifdef GL_ES
precision highp float;
#endif

#define PROCESSING_TEXTURE_SHADER

// Texture shaders require these standard uniforms. The filter() function in the sketch 
// will pass everything that has been drawn on the screen via the 'texture' uniform. 
uniform sampler2D texture;
uniform vec2 texOffset;

varying vec4 vertColor;
varying vec4 vertTexCoord;

// Parameters


uniform bool protanopia;
uniform bool protanopiaFilter;


vec3 setLMS(vec3 color){
	vec3 LMS;
	LMS.x = 17.8824*color.x + 43.5161*color.y + 4.11935*color.z;
	LMS.y = 3.45565*color.x + 27.1554*color.y + 3.86714*color.z;
	LMS.z = 0.0299566*color.x + 0.184309*color.y + 1.46709*color.z;
	return LMS;
}

vec3 setNewRGB(vec3 lms){
	vec3 RGB;
	RGB.x = 0.080944*lms.x - 0.130504*lms.y + 0.116721*lms.z; 
	RGB.y = - 0.0102485*lms.x + 0.0540194*lms.y - 0.113615*lms.z;
	RGB.z = - 0.000365294*lms.x - 0.00412163*lms.y + 0.693513*lms.z;
	return RGB;
}

vec3 setProtanopia(vec3 color){
	vec3 newColor;
	newColor.x = 2.02344*color.y - 2.52581*color.z;
	newColor.y = color.y;
	newColor.z = color.z;

	return newColor;
}

vec3 correctProtanopia(vec3 lms, vec3 deut){
	vec3 lmsc, e, emod, final;
	//Matriz de Error
	lmsc.x = lms.x - deut.x ;
	lmsc.y = lms.y - deut.y ;
	lmsc.z = lms.z - deut.z ;

	//Se añade el error a los valores de la imagen original
	e.x = lms.x + lmsc.x;
	e.y = lms.y + lmsc.y;
	e.z = lms.z + lmsc.z;

	//Matriz de Error Modificado 
	/*
	[0 0 0] [r]
	[0.7 1 0] [g]
	[0.7 0 1] [b]
	*/
	emod.x = 0;
	emod.y = 0.7*lmsc.x + lmsc.y;
	emod.z = 0.7*lmsc.x + lmsc.z; 
	

	//La anterior matriz se agrega a la imagen original
	final.x = lms.x + emod.x;
	final.y = lms.y + emod.y;
	final.z = lms.z + emod.z;
	return final;
}

void main(void)
{
	vec2 coord = vertTexCoord.st;

    // Get the color of the pixel at our fragment's coordinates
    vec4 pixel = texture2D( texture, coord );
	vec3 pixelColor = pixel.rgb;
	vec3 color;

	vec3 lms = setLMS(pixelColor);

	if(protanopia){
		color = setProtanopia(lms);
		color = correctProtanopia(lms, color);
	}
	
	if(protanopiaFilter){
		color = setProtanopia(lms);
	}

	color = setNewRGB(color);
	float alpha = 1;
	
	gl_FragColor= vec4( color, alpha );
}