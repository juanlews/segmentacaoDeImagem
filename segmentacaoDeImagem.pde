

PImage img, imgOut, imgMatrix;

boolean novoValor = true;
IntList frg, bkg;
int back = color(0), front = color(200,0,200);
void setup(){
  
  img = loadImage("catioro.jpg");
  imgOut = new PImage(img.width, img.height);

  frg = new IntList();
  bkg = new IntList();

  size(1280, 720);
}

void draw(){
  background(255);
  fill(0);
  text("fundo",  1135,   650);
  fill(back);
  ellipse( 1200,   650, 50, 50);
  fill(front);
  ellipse( 1100,   650, 50, 50);
  fill(0);
  text("plano", 1035,   650);
  
  if (img != null) {
      image(img, 0, 0, img.width/4, img.height/4);
      if(novoValor){
        img.loadPixels();
        imgOut.updatePixels();
        
        for(int i = 0; i < img.width*img.height; i++){
           if(abs((img.pixels[i]) - back) > abs((img.pixels[i]) - front )){
             //frg.append(i);
             imgOut.pixels[i] =  color(red(img.pixels[i]), green(img.pixels[i]), blue(img.pixels[i])); //color(random(r, 255), random(g, 255),random(b, 255));
  
           }
           else {
             imgOut.pixels[i] = color(0,0,0, 1); //color(random(r, 255), random(g, 255),random(b, 255));
  
           }
        }
        println(" "+(imgOut.width) + " " +(hex(img.pixels[0]))  +" Diferença: "+ abs((img.pixels[0]) - back) + " "+ abs((img.pixels[0]) - front ))  ;
        novoValor = false;
      }
      image(imgOut, 1280/2, 0, imgOut.width/4, imgOut.height/4);
   }
  
}

void mouseClicked(){
  println(get(mouseX, mouseY));
  if(mouseButton == RIGHT){
    back = color(get(mouseX, mouseY));
  }
  if(mouseButton == LEFT){
    front = color(get(mouseX, mouseY));
  }
  novoValor = true;
}
