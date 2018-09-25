String[] doors = new String[3];

float wins = 0;
float losses = 0;
float repeats = 1000;

int choice;
int reveal;

void setup(){
  int counter = 0;
  while(counter < repeats){
    assignDoors();
    counter++;
  }
  println("WINS: " + wins);
  println("LOSSES: " + losses);
  calculateTotal();
}

void assignDoors(){
  doors[0] = "Goat";
  doors[1] = "Goat";
  doors[2] = "Goat";
  int randInt = int(random(3));
  doors[randInt] = "Car";
  pick();
}

void pick(){
  choice = int(random(3));
  revealGoat();
}

void revealGoat(){
  int counter = 0;
  while(counter < 3){
    if(doors[counter] != "Car" && counter != choice){
      reveal = counter;
    }
    counter++;
  }
  swapPos();
}

void swapPos(){
  int counter = 0;
  while(counter < 3){
    if(counter != choice && counter != reveal){
      choice = counter;
    }
    counter++;
  }
  winOrLose();
}

void winOrLose(){
  if(doors[choice] == "Car"){
    wins++;
  } else{
    losses++;
  }
}

void calculateTotal(){
  println("TOTAL PERCENTAGE: " + ((wins/repeats)*100));
}
