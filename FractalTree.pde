private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .5;  
public double plus = 3*Math.PI/2;
public void setup()  {
  size(800, 800);
}
public void draw()  {
  background(0);
  drawBranches(400, 400, 100, plus);
  drawBranches(400, 400, 100, plus+2*Math.PI/3);
  drawBranches(400, 400, 100, plus+4*Math.PI/3);
  plus+=0.15;
  branchAngle+=0.05;
}

public void drawBranches(int x,int y, double branchLength, double angle)  {
  stroke(3*(int)branchLength, 2*(int)branchLength, 4*(int)branchLength);
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  branchLength *= fractionLength;
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);
  if(branchLength > smallestBranch){
    drawBranches(endX1, endY1, branchLength, angle1);
    drawBranches(endX2, endY2, branchLength, angle2);
  }
}
