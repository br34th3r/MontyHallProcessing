// Doors Array to Hold What's Behind Each Door
String[] doors = new String[3];

// System Data for Number of Wins, Losses and Repetitions
float wins = 0;
float losses = 0;
float repeats = 10000000;

// Track Variable to Ensure That Events Occur Synchronously
boolean track = true;

// User Variables for the Current Choice and the Host-Opened Door
int choice;
int reveal;

// Initialise Setup Function
void setup(){
  // Initialise Counter for Current Repetition
  int counter = 0;
  
  // Start Loop of Repetitions
  while(counter < repeats){
    // Check if a loop isn't already running
    if(track){
      // Start new repetition
      assignDoors();
    }
    // Increment Repetition Number
    counter++;
  }
  // Output Wins, Loss and Average
  println("WINS: " + wins);
  println("LOSSES: " + losses);
  calculateTotal();
}

void assignDoors(){
  //Reassign Track Variables
  track = false;
  
  // Pre-Assign all doors to goats
  doors[0] = "Goat";
  doors[1] = "Goat";
  doors[2] = "Goat";
  
  // Select a random integer between 0 and 2 (inclusive)
  int randInt = int(random(3));
  
  // Use previously acquired random integer to assign a random car door
  doors[randInt] = "Car";
  
  // Continue to user choice
  pick();
}

void pick(){
  // Random Integer between 0 and 2 (inclusive) for user's door choice
  choice = int(random(3));
  
  // Continue to Reveal the Goat
  revealGoat();
}

void revealGoat(){
  // Loop through the doors array
  int counter = 0;
  while(counter < 3){
    // Check if a door is not the car door or the user's choice and reveal it
    if(doors[counter] != "Car" && counter != choice){
      reveal = counter;
    }
    // Move to next door for check
    counter++;
  }
  // Move to swapping choice
  swapPos();
}

void swapPos(){
  // Loop through doors array
  int counter = 0;
  while(counter < 3){
    // Check to see if the current door is neither the revealed door, nor the user's choice
    if(counter != choice && counter != reveal){
      // Switch to the other available door
      choice = counter;
    }
    // Move to next door for check
    counter++;
  }
  // Move to win or lose stage
  winOrLose();
}

void winOrLose(){
  // Check if the choice door has a car behind it
  if(doors[choice] == "Car"){
    // Increment wins variable
    wins++;
  } else{
    // Increment losses variable
    losses++;
  }
  // Reset track to allow another loop to occur
  track = true;
}

void calculateTotal(){
  println("TOTAL PERCENTAGE: " + ((wins/repeats)*100));
}
