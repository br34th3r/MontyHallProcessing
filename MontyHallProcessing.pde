int numberOfDoors = 7;
String[] doors = new String[numberOfDoors];
int[] revealedDoors = new int[0];
double wins = 0;
double losses = 0;
int choice;
int reveal;
int iterations = 0;

// Initialise Setup Function
void setup(){
  size(600, 600);
  frameRate(30);
}

// Initialise Draw Function
void draw(){
  revealedDoors = new int[numberOfDoors - 2];
  background(0);
  assignDoors();
  pick();
  for(int i = 0; i < numberOfDoors - 2; i++){
    revealGoat();
    swapPos();
  }
  winOrLose();
  if(iterations > 0){
    displayResults();
  }
  iterations = iterations + 1;
}

// Draw All The Doors by the Number of Doors Predefined Variable
void drawAllDoors(){
  int doorStart = 10;
  for(int i = 0; i < numberOfDoors; i++){
    drawDoor(doorStart);
    doorStart += width/6 + 20;
  }
}

// Assign Values to All the Doors in the Array
void assignDoors(){
  for(int i = 0; i < numberOfDoors; i++){
    doors[i] = "Goat";
  }
  int randInt = int(random(numberOfDoors));
  doors[randInt] = "Car";
}

// Get the User's Choice of Door
void pick(){
  choice = int(random(numberOfDoors));
}

// Reveal a Random Goat
void revealGoat(){
  int counter = 0;
  while(counter < numberOfDoors){
    if(doors[counter] != "Car" && counter != choice && !existsInArray(revealedDoors, counter)){
      revealedDoors = append(revealedDoors, counter);
      break;
    }
    counter++;
  }
}

// Swap the User Door
void swapPos(){
  int counter = 0;
  while(counter < numberOfDoors){
    if(counter != choice && !existsInArray(revealedDoors, counter)){
      choice = counter;
      break;
    }
    counter++;
  }
}

// Check if the User Won or Lost
void winOrLose(){
  if(doors[choice] == "Car"){
    wins++;
  } else{
    losses++;
  }
}

// Draw a Door
void drawDoor(int x){
  fill(#A0522D);
  rect(x, 10, width/6, height/4);
  fill(#D2691E);
  ellipse(x+width/6-20, height/7, 20, 20);
}

// Update the Display List
void displayResults(){
  text("Wins: " + wins, 10, 20);
  text("Losses: " + losses, 10, 50);
  text("Percentage: " + (wins/iterations)*100, 10, 80);
}

// Function to See if a Value Exists in an Integer Array
boolean existsInArray(int[] arr, int val){
  boolean exists = false;
  for(int arrVal : arr){
    if(arrVal == val){
      exists = true;
    }
  }
  return exists;
}
