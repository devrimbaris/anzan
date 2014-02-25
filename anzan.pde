//copyright devrim baris acardddd
//global variables
PFont font;

int lastMillis = 0;
int anzanCurrentIndex = 0;

//anzan configuration variables

int c_interval = 3000;
int[] c_randomCollection;


int totalNumbers = 10;
  
float framerate = 24;
int fontSizeLarge = 450;
int fontSizeResult = 350;
int fontSizeSmall = 20;
int screenSizeX =700;
int screenSizeY =500;


void setup() {c
  noLoop();
  size(screenSizeX , screenSizeY);
  frameRate(framerate); 
  font = loadFont("FFScala.ttf");
  fontResult = loadFont("FFScala.ttf Italic"); 
  textFont(font, fontSizeLarge);
  fill(200, 102, 153);
       
}

void startAnzan(int minNumber, int maxNumber, int total, int interval){

  anzanCurrentIndex = 0;
  totalNumbers = total;
  c_interval = interval;
  c_randomCollection = new int[totalNumbers];
  initialize_random_numbers(minNumber, maxNumber);
  lastMillis = millis() - interval; 
  loop();
  
}

/*void mousePressed(){
  printResult();
}
*/

void draw(){
           
  if ((millis()-lastMillis) > c_interval) 
    if (anzanCurrentIndex < totalNumbers){
      background(#FFFFFF);
      alternateColour(anzanCurrentIndex);
      textFont(font, fontSizeLarge);
      int numberShown = c_randomCollection[anzanCurrentIndex++];
      int xPos = screenSizeX/2 - 120 - getXOffset(anzanCurrentIndex);
      if(numberShown > 9){
        xPos = xPos - 130;
      }
      text(str(numberShown), xPos, 390);
      /* // DISPLAY CURRENT INDEX
        textFont(font, fontSizeSmall);
      text(str(anzanCurrentIndex), 20*anzanCurrentIndex, 20);
      */
      lastMillis = millis();
    } else {
      noLoop();
    }
    
}

void showResult(){
  int sum = 0;
  for(int i = 0 ; i < totalNumbers ; i++){
    sum += c_randomCollection[i];
  }
  background(#FFFFFF);
  fill(10, 175, 10);
  textFont(fontResult,fontSizeResult );
  int sumCoordinateX =  screenSizeX/2 - 300;
  text(str(sum),sumCoordinateX,390);
}

void initialize_random_numbers (int randomLow, int randomHigh ){

  c_randomCollection = new int[200];
  newrandHigh = randomHigh + 1; //workaround olarka kondu , random fonksiyuonu istedigim gibi calismadi

  for(int i = 0 ; i < totalNumbers ; i++){
    
    float fl = random (1,newrandHigh);
    int mrnd = int(fl);
    while( mrnd < randomLow || mrnd > randomHigh){
      fl = random (1,newrandHigh);
      mrnd = int(fl);
    }
    
    c_randomCollection[i] = mrnd;
 
  }

}


void alternateColour(int k){
  if(k == (totalNumbers - 1))
     fill(155, 55, 253);
  else if(k % 2 == 1)
    fill(55, 55, 253);
  else
    fill(200, 55, 53);
    
}


int getXOffset (int k){
  if(k % 2 == 1)
    return 60;
  return 0;
    
}


