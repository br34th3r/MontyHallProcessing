int doorCount = 3;
Door[] doors;
DataText dataDisplay = new DataText();
DoorHandler doorHandler = new DoorHandler();
Graph graph = new Graph();
int doorWidth = 50;
int doorHeight = 80;
int doorStartX = 20;
int doorStartY = 500;
int iterations = 0;
float wins = 0;
float losses = 0;
float percentage = 0;
int userChoice;
boolean paused;

void setup(){
  size(400, 400);
  background(0);
  frameRate(60);
}

void draw(){
  if(!paused){
    background(0);
    doors = new Door[doorCount];
    doorHandler.displayDoorCount(doorCount);
    randomiseDoors();
    userChoice = int(random(doorCount));
    for(int j = 0; j < doorCount - 2; j++){
      for(int i = 0; i < doorCount; i++){
        if(!doors[i].revealed && i != userChoice && !doors[i].car){
          doors[i].revealed = true;
          break;
        }
      }
      for(int i = 0; i < doorCount; i++){
        if(!doors[i].revealed && i != userChoice){
          userChoice = i;
          break;
        }
      }
    }
    if(doors[userChoice].car){
      wins++;
    } else{
      losses++;
    }
    iterations++;
    percentage = (wins/iterations)*100;
    graph.update(iterations, wins, losses, percentage);
    dataDisplay.update(iterations, wins, losses, percentage);
  }
}

void randomiseDoors(){
  for(int i = 0; i < doorCount; i++){
    doors[i] = new Door(i + 1, false, false);
  }
  int randInt = int(random(doorCount));
  doors[randInt].setCar();
}

void mousePressed(){
  paused = true;
}

void mouseReleased(){
  paused = false;
}

void keyPressed(){
  if(key == CODED){
    if(keyCode == UP){
      doorCount = doorCount + 1;
    } else if(keyCode == DOWN){
      doorCount = doorCount - 1;
    }
    wins = 0;
    losses = 0;
    percentage = 0;
    iterations = 0;
  }
}
