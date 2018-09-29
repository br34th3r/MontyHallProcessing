class Graph{
  float wins;
  float losses;
  float percentage;
  int iterations;
  
  public void update(int iterations, float wins, float losses, float percentage){
    this.wins = wins;
    this.losses = losses;
    this.percentage = percentage;
    this.iterations = iterations;
    textSize(18);
    stroke(255);
    line(20, 150, 20, height-20);
    line(20, 150, 250, 150);
    text("100%", 30, height-20);
    fill(#00FF00);
    rect(50, 150, 80, getRectHeight(this.percentage));
    fill(#FF0000);
    rect(150, 150, 80, getRectHeight((this.losses/this.iterations)*100));
  }
  
  public float getRectHeight(float value){
    float val = map(value, 0, 100, 0, height-180);
    return val;
  }
}
