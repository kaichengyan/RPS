int your;
int oppo;
int result; 
int yourScore = 0;
int oppoScore = 0;
void setup(){
  size(500,200);
  fill(0);
  background(255);
  textSize(36);
}

void draw(){

}

void keyReleased(){
    background(255);
    your = getYour(key);
    oppo = randomOppo();
    result = whowins(your, oppo);
    text("You: " + your, 50, 100);
    text("Oppo: " + oppo, 250, 100);
    if (result == 1){
      text("You win.", 50, 50);
      yourScore++; 
    }
    else if (result == 2){
      text("You lose.", 50, 50);
      oppoScore++; 
    }
    else if (result == 0)
      text("Tie.", 50, 50);
    else
      text("Error.", 50, 50); 
      
    text("Your score: " + yourScore +". Oppo score: " + oppoScore + ". ", 0,0);
}

int whowins(int your, int oppo){
  if (your == 5 && oppo == 0)
    return 1;
  if (your == 5 && oppo == 2)
    return 2;
  if (your == 5 && oppo == 5)
    return 0;  
  if (your == 2 && oppo == 5)
    return 1;
  if (your == 2 && oppo == 0)
    return 2;
  if (your == 2 && oppo == 2)
    return 0; 
  if (your == 0 && oppo == 2)
    return 1;
  if (your == 0 && oppo == 5)
    return 2;
  if (your == 0 && oppo == 0)
    return 0;  
  return -1;
}

int getYour(char key){
  if (key == '5')
    return 5;
  if (key == '2')
    return 2;
  if (key == '0')
    return 0;
  return -1;
}

int randomOppo(){
  int result = (int)random(0,3);
  if (result == 0)
    return 5;
  if (result == 1)
    return 2;
  if (result == 2)
    return 0;
  return -1;
}

int smarterOppo(){
  
}

