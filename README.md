# Shaders

### Integrantes: 
Iván Dario Rojas Flórez

### Objetivos: 

- Por medio del uso de Shaders, mostrar las diferentes modificaciones que se le pueden realizar a un archivo ya sea de tipo imagen o tipo video.
- Mostrar las diferentes formas de percepción de las personas que tienen la condición de defectos de visión dicromatica, mas exactamente deuteronimia, protanomia y titranopia. 

### Breve descripción: 

Inicialmente se plantea la modificación de imagenes con la ayuda de Shaders utilizando convoluciones y demas herramientas capaces de alterar las imagenes. 
Luego de haber solucionado el inconveniente con la libreria de Processing.video debido a los inconvenientes presentados por el uso del sistema operativo Windows 10, se inicia con la manipulación y pruba de videos de mayor tamaño. 
Para esto, se le aplica diferentes filtros capaces de transformar el video de acuerdo con la seleccíón de alguna de ellas en especifico. 
Se parte de la implementación de los filtros convencionales agregando ciertas modificaciones. 
Ademas de eso, se implementa la idea de vision con deuteranopia y Protanopia, el cual es un defecto moderadamente grave en el cual falta o padece una disfunción de uno de los tres mecanismos básicos del color.
Lo que se busca mostrar con estos ultimos dos efectos es la forma en como las personas que sufren este tipo de transtorno perciben los colores que les rodean, ademas de entender la situación y valorar la condición que presentan. 


 Tecla | Descripción 
 ------ | ------ 
 0 | Desactiva los shaders 
 1 | Activa "edge" 
 2 | Activa "invert" 
 3 | Activa "Pixelate" 
 4 | Activa "emboss"
 5 | Activa "deuter" 
 6 | Activa "prota"  
 7 | Activa "titra"  
 
Los primeros tres filtros agregados son implementados de "https://github.com/genekogan/Processing-Shader-Examples" en donde son mostrados de forma alternada. Y para los ultimos tres filtros trabajados hasta ahora, se plantea el efecto de visión de los diferentes problemas presentados en el daltonismo, mostrando la ausencia o disfunción de uno de los tres mecanismos basicos de color. Esta información fue tomada de "https://arxiv.org/pdf/1711.10662.pdf", en donde se pueden ver los valores propios de cada sintoma. 

 ### Video escogido: 
 Se escoge este video por el resalte de colores fundamentales para la demostración.
 "Pelea en la carretera" - Clip Doblado (HD) (+16) 20th Century Fox & Marvel Movie 2016: https://www.youtube.com/watch?v=ZWmfPzwgHNk

### Discusión de los resultados: 

![Alt Text](sketch/data/filtros.gif)

Al momento de ejecutar el programa, se puede obervar el video sin ningun filtro agregado. Se tienen teclas especificas para la observación de los 6 filtros (por el momento) como lo muestra la anterior tabla. 

Principalmente se puede observar como los diferentes efectos de daltonismo son mostrados, dando a conocer la forma en como las personas con esta discapacidad ven el mundo. Con estos resultados podemos entender y apropiarnos de la problematica a la cual se enfrentan, para poder plantear unas propuestas e ideas concernientes a la solución o mejoramiento de la visión en dichas personas. 

### Trabajo futuro: 
A corto plazo: 
- Terminar la implementación de Titranopia, debido a que los valores usados actualmente, no estan generando los valores oprimos para una correcta visualicación del defecto visual. 
- Mostrar los efectos usando la camara integrada del dispositivo a utilizar. Se propondra la opción de elección donde se pueda ver la imagen de la camara integrada usando estos efectos y ademas, utilizar el video que viene por defecto para realizar una comparación de estas opciones.
- Completar la implementación del filtro de terrenos el cual mapea el terreno y muestra una malla sobreponiendo las diferentes variaciones que presentan en la muestra. 

A largo plazo: 
- Realizar una aplicación integrando este tipo de filtros y agregando otros filtros con la misma tematica; el cual proponga una consientizacion de la alteración visual. 
 
###  referencias.

- https://github.com/codeanticode/pshader-tutorials
- https://processing.org/tutorials/pshader/
- https://github.com/genekogan/Processing-Shader-Examples
- https://arxiv.org/pdf/1711.10662.pdf
- https://thebookofshaders.com/06/

