  import java.util.LinkedList;
  import java.util.ListIterator;
  import controlP5.*;

  ControlP5 cp5;
  ControlFont cf;
  CommandBlock draggedObject;
  float initX;
  float initY;
  Tank tank;
  ArrayList<Obstacles> obstacles;
  CommandController control;
  
 void setup (){
    size(1260, 720);
    noStroke();
    rectMode(CENTER);
    cp5 = new ControlP5(this);
    cf = new ControlFont(createFont("Times",16));

    
    obstacles = new ArrayList<Obstacles>();
    generateObstacles(10);
    control = new CommandController();
    tank = new Tank(100, 50, 50, 60, 50, new Sprite(this,"../TankBase.png",0), new Sprite(this,"../TankHead.png",0));
    control.add(new MoveBackward(cp5, cf, tank));
    control.add(new MoveForward(cp5, cf, tank));
    control.execute(); //replaces parse();
  }


 void draw(){
    background(255.0);
    
    tank.brake();
    tank.turnLeft();
    tank.turnTurretRight();
    tank.update();
    tank.draw();
    /*tank.getBaseSprite().setX(tank.getPos()[0]);
    tank.getBaseSprite().setY(tank.getPos()[1]);
    tank.getBaseSprite().setRot(tank.getTankAngle());
    tank.getHeadSprite().setX(tank.getPos()[0]);
    tank.getHeadSprite().setY(tank.getPos()[1]);
    tank.getHeadSprite().setRot(tank.getTurrAngle());
    tank.getBaseSprite().draw();
    tank.getHeadSprite().draw();*/
    
    for(Obstacles obstacle: obstacles){
      obstacle.getSprite().draw();
    }
  }
  
  void mousePressed(){
    if(cp5.getWindow().getMouseOverList().size() > 0){
      try{
        draggedObject = control.getCommand((ControlGroup) cp5.getWindow().getMouseOverList().get(0).bringToFront());
        initX = mouseX;
        initY = mouseY;
      } catch(Exception e){
      }
    }
   }

void mouseReleased(){
  draggedObject = null;
}

void mouseDragged(){
  if(draggedObject != null && mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height){
    draggedObject.move(mouseX - initX, mouseY - initY);
    initX = mouseX;
    initY = mouseY;
  }
}

void generateObstacles(int numberOfObstacles){
  boolean overlap = false;
  for(int i = 0; i < numberOfObstacles / 2; i++){
    Crate crate = new Crate(((int) (Math.random() * 1000)),((int) (Math.random() * 700)),new Sprite(this,"../Crate.png",0));
    crate.getSprite().setX(crate.getX());
    crate.getSprite().setY(crate.getY());
    for (Obstacles obstacle: obstacles){
     if(obstacle.getSprite().cc_collision(crate.getSprite())){
       i--;
       overlap = true;
       break;
     }
    }
    if (!overlap) {
      obstacles.add(crate);
    }
  }
  overlap = false;
  for(int i = 0; i < numberOfObstacles / 2; i++){
    Barrel barrel = new Barrel(((int) (Math.random() * 1000)),((int) (Math.random() * 700)),new Sprite(this,"../Barrel.png",0));
    barrel.getSprite().setX(barrel.getX());
    barrel.getSprite().setY(barrel.getY());
    for (Obstacles obstacle: obstacles){
     if(obstacle.getSprite().cc_collision(barrel.getSprite())){
       i--;
       overlap = true;
       break;
     }
    }
    if (!overlap) {
      obstacles.add(barrel);
    }
  }
}
  