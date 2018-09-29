class DataText{
  int iterations;
  float wins;
  float losses;
  double percentage;
  int x = 20;
  int y = 20;
  
  public void update(int iterations, float wins, float losses, double percentage){
    this.iterations = iterations;
    this.wins = wins;
    this.losses = losses;
    this.percentage = percentage;
    textSize(18);
    fill(#FFFFFF);
    text("ITERATIONS: " + this.iterations, this.x, this.y);
    fill(#00FF00);
    text("WINS: " + this.wins, this.x, this.y + 20);
    fill(#FF0000);
    text("LOSSES: " + this.losses, this.x, this.y + 40);
    fill(#FFFFFF);
    text("PERCENTAGE: " + this.percentage, this.x, this.y + 60);
  }
}
