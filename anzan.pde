//global variables
PFont font;
int k = 1;
float framerate = 24;
int lastMillis = millis();
int anzanCurrentIndex = 0;
//anzan configuration variables
int c_totalNumbers = 12;
int c_interval = 3500;
int c_randomLow=1;
int c_randomHigh=10;
int[] c_randomCollection = new int[c_totalNumbers];
boolean readyForNewRound = false;


void setup() {

    size(1200, 500);
    frameRate(framerate); 
    font = loadFont("FFScala.ttf");
    textFont(font, 500);
    fill(200, 102, 153);
    initialize_random_numbers();
}

void draw(){
    if ((millis()-lastMillis) > c_interval) 
        if (anzanCurrentIndex < c_totalNumbers){
            background(#FFFFEE);
            alternateColour(anzanCurrentIndex);
            text(str(c_randomCollection[anzanCurrentIndex++]), 490, 390);
            lastMillis = millis();
        } else {
            if(mousePressed)
                printSum();
        }
}

void printSum(){
    int sum = 0;
    for(int i = 0 ; i < c_totalNumbers ; i++){
        sum += c_randomCollection[i];
    }
    background(#FFFFEE);
    fill(10, 175, 10);
    textFont(font, 500);
    text(str(sum),350,390);
}

void  initialize_random_numbers (){
    for(int i = 0 ; i < c_totalNumbers ; i++){
        c_randomCollection[i] = int( random (c_randomLow, c_randomHigh));
    }
}

void alternateColour(int k){
    if(k % 2 == 1)
        fill(55, 55, 253);
    else
        fill(200, 55, 53);
    
}



/*
  void setup() {
  size(200, 200);
  background(100);
  stroke(255);
  ellipse(50, 50, 25, 25);
  
  
  println("Hello dba!");
}
*/
