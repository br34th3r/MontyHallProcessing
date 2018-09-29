public class Door{
  int doorNumber;
  boolean car;
  boolean revealed;
  int doorWidth = 100;
  int doorHeight = 250;
  
  Door(int doorNumber, boolean car, boolean revealed){
    this.doorNumber = doorNumber;
    this.car = car;
    this.revealed = revealed;
  }
  
  public void setCar(){
    this.car = true;
  }
}
