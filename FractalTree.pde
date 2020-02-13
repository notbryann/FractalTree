private double fractionLength = .5; 
private int smallestBranch = 10; 
private double branchAngle = .5;  
public void setup() 
{   
  size(640,480);    
} 
public void draw() 
{   
  background(0);   
  stroke(225,225,225);   
  line(320,480,320,380);   
  drawBranches(320,380,100,3*Math.PI/2); 
  fractionLength+=0.0007;
  branchAngle+=.0002;
  noLoop();
}
public void mousePressed()
{
  fractionLength+=0.030;
  branchAngle+=.01;
  redraw();
}
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  int endX1, endX2, endY1, endY2;
  branchLength *= fractionLength;
  endX1 = (int)(branchLength*Math.cos(angle1) + x);
  endY1 = (int)(branchLength*Math.sin(angle1) + y);
  endX2= (int)(branchLength*Math.cos(angle2) + x);
  endY2 = (int)(branchLength*Math.sin(angle2) + y);
  line(x,y,endX1,endY1);
  line(x,y,endX2,endY2);
  if (branchLength > smallestBranch)
  {
    drawBranches(endX1, endY1, branchLength, angle1);
    drawBranches(endX2, endY2, branchLength, angle2);  
  } 
} 