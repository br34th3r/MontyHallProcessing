class DoorHandler{
  public void displayDoorCount(int doorCount){
    textSize(18);
    text("Door Count: ", width - width / 3, height - height / 3);
    textSize(60);
    text(str(doorCount), width - width / 3, height - height / 8);
  }
}
