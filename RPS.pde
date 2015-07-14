/*@pjs preload="stone.bmp" */
/*@pjs preload="scissors.bmp" */
/*@pjs preload="paper.bmp" */
PImage IMAGE0,IMAGE2,IMAGE5;
int your;
int oppo;
int result; 
int yourScore = 0;
int oppoScore = 0;
int scissorsCount = 1, rockCount = 1, paperCount = 1;
void setup(){
  size(400,500);
  fill(0);
  background(255);
  textSize(36);
  IMAGE0 = loadImage ("stone.bmp");
  IMAGE2 = loadImage ("scissors.bmp");
  IMAGE5 = loadImage ("paper.bmp");
  text("Your score: 0. \nOppo score: 0. ", 50, 300); 
  textSize(12);
  text("Instructions: \n5 for Paper, \n2 for Scissors, \n0 for Rock.", 50, 400);
}

void draw(){
    
}

void keyReleased(){
    textSize(36);
    background(255);
    your = getYour(key);
    /* Learning Counting */
    if (your == 0)
      rockCount++;
    else if (your == 2)
      scissorsCount++;
    else 
      paperCount++;
    /****************/
    // oppo = 2;
    // oppo = randomGesture();
    oppo = learningOppo();
    result = whowins(your, oppo);
    // text("You: " + your, 50, 100);
    // text("Oppo: " + oppo, 250, 100);
    if (your == 0)
      image(IMAGE0, 50, 100, 100, 100);
    else if (your == 2)
      image(IMAGE2, 50, 100, 100, 100);
    else if (your == 5)
      image(IMAGE5, 50, 100, 100, 100);
    else 
      text("Error!", 50, 100);
      
    if (oppo == 0)
      image(IMAGE0, 250, 100, 100, 100);
    else if (oppo == 2)
      image(IMAGE2, 250, 100, 100, 100);
    else if (oppo == 5)
      image(IMAGE5, 250, 100, 100, 100);
    else 
      text("Error!", 50, 100);  
      
      
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
    text("Your score: " + yourScore +". \nOppo score: " + oppoScore + ". ", 50, 300);
    textSize(12);
    text("Instructions: \n5 for Paper, \n2 for Scissors, \n0 for Rock.", 50, 400);
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

int randomGesture(){
  int result = (int)random(0,3);
  if (result == 0)
    return 5;
  if (result == 1)
    return 2;
  if (result == 2)
    return 0;
  return -1;
}

int learningOppo(){
  int totalCount = scissorsCount + rockCount + paperCount;
  int temp = (int)random(totalCount);
  if (temp < scissorsCount)
    return 0;
  if (temp >= scissorsCount && temp < scissorsCount + rockCount)
    return 5;
  else
    return 2;
}
