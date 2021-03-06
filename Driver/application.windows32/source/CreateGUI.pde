import controlP5.*;

class DropDownMenu {
  ControlP5 cp5;
  DropdownList d1, d2, d3, d4, d5;
  String choice;
  String[] math = {"Sin", "Cos", "Tan"};
  String[] movement = {"Move Forward", "Brake", "Turn Left", "Turn Right", "Stop Turning"};
  String[] combat = {"Turn Turret Left", "Turn Turret Right", "Stop Turning Turret", "Fire"};
  String[] get = {"Get My Angular Velocity", "Get Enemy Angular Velocity", "Get My Angle", "Get Enemy Angle", "Get My Velocity", "Get Enemy Velocity", "Get My Position", "Get Enemy Position", "Get My Reloading Time",
                  "Get Enemy Reloading Time", "Get My Turret Angular Velocity", "Get Enemy Turret Angular Velocity"};
 String[] ctrl = {"If", "For"}; 
  boolean onOff1, onOff2, onOff3, onOff4, onOff5;
  
  public DropDownMenu(ControlP5 cp5) {
    this.cp5 = cp5; 
    onOff1 = false;
    onOff2 = false;
    onOff3 = false;
    onOff4 = false;
    onOff5 = false;
    d1 = cp5.addDropdownList("Math")
          .setPosition(100, 0)
          .setFont(new ControlFont(createFont("Times",12)))
          .onClick(new CallbackListener(){
           public void controlEvent(CallbackEvent event) {
             if (!onOff1) {
               onOff1 = true;
               onOff2 = false;
               onOff3 = false;
               onOff4 = false;
               onOff5 = false;
               d2.setOpen(false);
               d3.setOpen(false);
               d4.setOpen(false);
               d5.setOpen(false);
             } else if (onOff1) {
               addControl(event.getController().getLabel());
               d1.setCaptionLabel("Math");
               onOff1 = false; 
             }
           }
     });
          ;   
          
     d2 = cp5.addDropdownList("Movement")
           .setPosition(300, 0)
           .setFont(new ControlFont(createFont("Times",12)))
           .onClick(new CallbackListener(){
            public void controlEvent(CallbackEvent event) {
              if (!onOff2) {
                onOff1 = false;
                onOff2 = true;
                onOff3 = false;
                onOff4 = false;
                onOff5 = false;
                d1.setOpen(false);
                d3.setOpen(false);
                d4.setOpen(false);
                d5.setOpen(false);
              } else if (onOff2) {
                addControl(event.getController().getLabel());
                d2.setCaptionLabel("Movement");
                onOff2 = false; 
              }
           }
     });
          ;   
          
    d3 = cp5.addDropdownList("Combat")
          .setPosition(500, 0)
          .setFont(new ControlFont(createFont("Times",12)))
          .onClick(new CallbackListener(){
           public void controlEvent(CallbackEvent event) {
             if (!onOff3) {
               onOff1 = false;
               onOff2 = false;
               onOff3 = true;
               onOff4 = false;
               onOff5 = false;
               d1.setOpen(false);
               d2.setOpen(false);
               d4.setOpen(false);
               d5.setOpen(false);
             } else if (onOff3) {
               addControl(event.getController().getLabel());
               d3.setCaptionLabel("Combat");
               onOff3 = false; 
             }
           }
     });
          ;   
          
    d4 = cp5.addDropdownList("Get")
          .setPosition(700, 0)
          .setFont(new ControlFont(createFont("Times",12)))
          .onClick(new CallbackListener(){
           public void controlEvent(CallbackEvent event) {
             if (!onOff4) {
               onOff1 = false;
               onOff2 = false;
               onOff3 = false;
               onOff4 = true;
               onOff5 = false;
               d1.setOpen(false);
               d2.setOpen(false);
               d3.setOpen(false);
               d5.setOpen(false);
             } else if (onOff4) {
               addControl(event.getController().getLabel());
               d4.setCaptionLabel("Get");
               onOff4 = false; 
             }
           }
     });
          ;   
          
    d5 = cp5.addDropdownList("Control")
          .setPosition(900, 0)
          .setFont(new ControlFont(createFont("Times",12)))
          .onClick(new CallbackListener(){
           public void controlEvent(CallbackEvent event) {
             if (!onOff5) {
               onOff1 = false;
               onOff2 = false;
               onOff3 = false;
               onOff4 = false;
               onOff5 = true;
               d1.setOpen(false);
               d2.setOpen(false);
               d3.setOpen(false);
               d4.setOpen(false);
             } else if (onOff5) {
               addControl(event.getController().getLabel());
               d5.setCaptionLabel("Control");
               onOff5 = false; 
             }
           }
     });
          ;   
          
    customize(d1, math);
    customize(d2, movement);
    customize(d3, combat);
    customize(d4, get);
    customize(d5, ctrl);
  }
  
  void customize(DropdownList ddl, String[] options) {
    ddl.setBackgroundColor(color(190));
    ddl.setItemHeight(60);
    ddl.setBarHeight(40);
    ddl.setHeight(400);
    ddl.setWidth(200);
    ddl.addItems(options);
    ddl.setColorBackground(color(60));
    ddl.setColorActive(color(255, 128));
    ddl.setOpen(false);
    ddl.setVisible(false);
  }
  
  void setVisible(boolean isVisible) {
    d1.setVisible(isVisible);
    d2.setVisible(isVisible);
    d3.setVisible(isVisible);
    d4.setVisible(isVisible);
    d5.setVisible(isVisible);
  }
  
  void mousePress(int x, int y) {
    onOff1 = (x > 100 && x < 300) && (y < 220); 
    onOff2 = (x > 300 && x < 500) && (y < 340); 
    onOff3 = (x > 500 && x < 700) && (y < 280); 
    onOff4 = (x > 700 && x < 900) && (y < 400); 
    onOff5 = (x > 900 && x < 1100) && (y < 160);
    
    if (!onOff1) {
      d1.setOpen(onOff1);
      d1.setCaptionLabel("Math");
    }
    
    if (!onOff2) {
      d2.setOpen(onOff2);
      d2.setCaptionLabel("Movement");
    }
    
    if (!onOff3) {
      d3.setOpen(onOff3);
      d3.setCaptionLabel("Combat");
    }
    
    if (!onOff4) {
      d4.setOpen(onOff4);
      d4.setCaptionLabel("Get");
    }
    
    if (!onOff5) {
      d5.setOpen(onOff5);
      d5.setCaptionLabel("Control");
    }
  }
  
  void addControl(String label) {
    println(label);
    if (label.equals("If")) {  
      control.add(new IfStatement(cp5, cf, stageLists.getTankList().get(0)));    
    } else if (label.equals("Sin")) {
      control.add(new Sin(cp5, cf, stageLists.getTankList().get(0))); 
    } else if (label.equals("Cos")) {
      control.add(new Cos(cp5, cf, stageLists.getTankList().get(0))); 
    } else if (label.equals("Tan")) {
      control.add(new Tan(cp5, cf, stageLists.getTankList().get(0))); 
    } else if (label.equals("Move Forward")) {
      control.add(new MoveForward(cp5, cf, stageLists.getTankList().get(0))); 
    } else if (label.equals("Brake")) {
      control.add(new Brake(cp5, cf, stageLists.getTankList().get(0))); 
    } else if (label.equals("Turn Left")) {
      control.add(new TurnLeft(cp5, cf, stageLists.getTankList().get(0))); 
    } else if (label.equals("Turn Right")) {
      control.add(new TurnRight(cp5, cf, stageLists.getTankList().get(0))); 
    } else if (label.equals("Stop Turning")) {
      control.add(new StopTurning(cp5, cf, stageLists.getTankList().get(0))); 
    } else if (label.equals("Turn Turret Left")) {
      control.add(new TurnTurretLeft(cp5, cf, stageLists.getTankList().get(0))); 
    } else if (label.equals("Turn Turret Right")) {
      control.add(new TurnTurretRight(cp5, cf, stageLists.getTankList().get(0))); 
    } else if (label.equals("Stop Turning Turret")) {
      control.add(new StopTurningTurret(cp5, cf, stageLists.getTankList().get(0))); 
    } else if (label.equals("Fire")) {
      control.add(new Fire(cp5, cf, stageLists.getTankList().get(0)));
    } else if (label.equals("For")) {
      control.add(new ForLoop(cp5, cf, stageLists.getTankList().get(0)));
    } else if (label.equals("Get My Angular Velocity")) {
      control.add(new GetMyAngVel(cp5, cf, stageLists.getTankList().get(0), stageLists.getTankList().get(1))); 
    } else if (label.equals("Get Enemy Angular Velocity")) {
      control.add(new GetEnemyAngVel(cp5, cf, stageLists.getTankList().get(0), stageLists.getTankList().get(1))); 
    } else if (label.equals("Get My Angle")) {
      control.add(new GetMyAngle(cp5, cf, stageLists.getTankList().get(0), stageLists.getTankList().get(1))); 
    } else if (label.equals("Get Enemy Angle")) {
      control.add(new GetEnemyAngle(cp5, cf, stageLists.getTankList().get(0), stageLists.getTankList().get(1))); 
    } else if (label.equals("Get My Velocity")) {
      control.add(new GetMyVel(cp5, cf, stageLists.getTankList().get(0), stageLists.getTankList().get(1))); 
    } else if (label.equals("Get Enemy Velocity")) {
      control.add(new GetEnemyVel(cp5, cf, stageLists.getTankList().get(0), stageLists.getTankList().get(1))); 
    } else if (label.equals("Get My Position")) {
      control.add(new GetMyPos(cp5, cf, stageLists.getTankList().get(0), stageLists.getTankList().get(1))); 
    } else if (label.equals("Get Enemy Position")) {
      control.add(new GetEnemyPos(cp5, cf, stageLists.getTankList().get(0), stageLists.getTankList().get(1))); 
    } else if (label.equals("Get My Reloading Time")) {
      control.add(new GetMyReloadingTime(cp5, cf, stageLists.getTankList().get(0), stageLists.getTankList().get(1))); 
    } else if (label.equals("Get Enemy Reloading Time")) {
      control.add(new GetEnemyReloadingTime(cp5, cf, stageLists.getTankList().get(0), stageLists.getTankList().get(1))); 
    } else if (label.equals("Get My Turret Angular Velocity")) {
      control.add(new GetMyTurrAngVel(cp5, cf, stageLists.getTankList().get(0), stageLists.getTankList().get(1))); 
    } else if (label.equals("Get Enemy Turret Angular Velocity")) {
      control.add(new GetEnemyTurrAngVel(cp5, cf, stageLists.getTankList().get(0), stageLists.getTankList().get(1)));  
    }
    control.setVisible(true);
  }
}