import processing.video.*;

//variables del video
Movie video;
Movie selVideo;

PShader edge;
PShader emboss;
PShader deuter;
PShader prota;
PShader pixelate;
PShader invert;

boolean applyFilt = true, deut = true, deutFilt = true;
boolean prot = true, protFilt = true;

//FPS counter variables
int fcount, lastm;
float frate;
int fint = 1;

void setup() {
  size(1280,720, P3D);
  //cargar video
  video = new Movie(this,"videos/deadpool.mp4");
  
  edge = loadShader("shaders/edge.glsl");
  invert = loadShader("shaders/invert.glsl");
  pixelate = loadShader("shaders/pixelate.glsl");
  emboss = loadShader("shaders/emboss.glsl");
  deuter = loadShader("shaders/color1.glsl");
  prota = loadShader("shaders/color2.glsl");
  if (applyFilt){
      if(deut)
        deuter.set("deuteranopia", true);
      if(deutFilt)
        deuter.set("deuteranopiaFilter", true);
  }
  if (applyFilt){
      if(prot)
        prota.set("protanopia", true);
      if(protFilt)
        prota.set("protanopiaFilter", true);
  }
  filter(deuter);
  filter(prota);
  video.loop();
}

void draw(){
  background(0);
  video.read();
  //shader(toon);
  image(video,0,0);

  drawFPSCounter();
}

void keyPressed(){
  if (key == '0'){
   resetShader();
 }
 if (key == '1'){
    shader(edge);
 }
 if (key == '2'){
   shader(invert);
 }
 if (key == '3'){
   pixelate.set("pixels", 0.1 * mouseX, 0.1 * mouseY);
   shader(pixelate);
 }
  if (key == '4'){
    shader(emboss);
 }
 if (key == '5'){
   shader(deuter);
 }
 if (key == '6'){
   shader(prota);
 }
}
void drawFPSCounter(){
  fcount += 1;
  int m = millis();
  if (m - lastm > 1000 * fint) {
    frate = float(fcount) / fint;
    fcount = 0;
    lastm = m;
    println("fps: " + frate);
  }
  fill(0);
  text("fps: " + frate, 10, 20);
}