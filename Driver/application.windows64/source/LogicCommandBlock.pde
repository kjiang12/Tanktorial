public abstract class LogicCommandBlock extends CommandBlock{
  
  LogicBlock conditionGroup, thenGroup, elseGroup;
  
  public LogicCommandBlock(ControlP5 cp5, ControlFont cf, Tank tank){
    super(cp5, tank);    
    this.h = 150;
    this.g.setOpen(true);
    this.g.getCaptionLabel().set("If").setFont(cf);
    this.g.setSize(this.w, this.h);
   
    this.conditionGroup = this.add(new LogicBlock(cp5, cf, tank, "Condition", 0, this.g));
    this.thenGroup = this.add(new LogicBlock(cp5, cf, tank, "Then", 1, this.g));
    this.elseGroup = this.add(new LogicBlock(cp5, cf, tank, "Else", 2, this.g));         
  
  }
  
  LogicBlock add(LogicBlock logic){
    control.add(logic);
    return logic;
  }
  
  void setVisible(Boolean bol){
    super.setVisible(bol);
    if(this.conditionGroup != null){
      this.conditionGroup.setVisible(bol);
    }
    this.thenGroup.setVisible(bol);
    this.elseGroup.setVisible(bol);
  }
  
  void move(float x, float y){
    super.move(x, y);
    if(this.conditionGroup != null){
      this.conditionGroup.connectionUpdate();
    }
    this.thenGroup.connectionUpdate();
    this.elseGroup.connectionUpdate();
  }
  
  abstract void execute();
}

class LogicBlock extends CommandBlock{
     public LogicBlock(ControlP5 cp5, ControlFont cf, Tank tank, String label, int pos, ControlGroup group){
       super(cp5, tank);
       this.g.setPosition(10, 50*(pos + 1));
       this.g.setBackgroundHeight(100);
       this.g.setSize(w,h);
       this.g.setBarHeight(40);
       this.g.setBackgroundColor(color(80,0,180));
       this.g.setFont(new ControlFont(createFont("Times",12)));
       this.g.setOpen(false);
       this.g.disableCollapse();
       this.g.setGroup(group);
       this.g.setVisible(false);
       this.g.setCaptionLabel(label);
     }
     
     public void setLabel(String s){
       this.g.setCaptionLabel(s);
     }
     
     int getX(){
       return (int) this.g.getAbsolutePosition()[0];
     }
  
     int getY(){
       return (int) this.g.getAbsolutePosition()[1] - 10;
     }
     
     void changeSize(int x, int y){
       this.g.setSize(x, y);
     }
     
     void changePosition(int x, int y){
       this.g.setPosition(x, y);
     }
    
    void changeX(int x){
      this.g.setPosition(x, this.g.getPosition()[1]);
    }
    
    int getRX(){
      return (int) this.g.getPosition()[0];
    }
     void execute(){
     }
   }
   
public class ForLoop extends LogicCommandBlock{
  int start, end, count = 0;
  
  public ForLoop(ControlP5 cp5, ControlFont cf, Tank tank){
    super(cp5, cf, tank);
    this.conditionGroup.g.remove();
    this.conditionGroup = null;
    
    this.g.getCaptionLabel().set("For").setFont(cf);
    this.thenGroup.setLabel("Do");
    this.elseGroup.setLabel("Next");
    
    cp5.addTextlabel("label " + this.id)
                    .setText("From ")
                    .setPosition(20,15)
                    .setFont(new ControlFont(createFont("Times", 20)))
                    .setGroup(this.g)
                    ;
                    
    cp5.addTextfield("input1 " + this.id)
     .setPosition(100,10)
     .setSize(60,40)
     .setFont(cf)
     .setGroup(this.g)
     .setColor(color(255,0,0))
     .setCaptionLabel("")
     .onChange(new CallbackListener(){
       public void controlEvent(CallbackEvent event) {
         start = (int) Float.parseFloat(event.getController().getStringValue());
      }
     });

     cp5.addTextlabel("label2 " + this.id)
                    .setText(" To ")
                    .setPosition(170, 15)
                    .setFont(new ControlFont(createFont("Times", 20)))
                    .setGroup(this.g)
                    ;
                    
    cp5.addTextfield("input2 " + this.id)
     .setPosition(220,10)
     .setSize(60,40)
     .setFont(cf)
     .setGroup(this.g)
     .setCaptionLabel("")
     .setColor(color(255,0,0))
     .onChange(new CallbackListener(){
       public void controlEvent(CallbackEvent event) {
         end = (int) Float.parseFloat(event.getController().getStringValue());
      }
     });

  }

  void execute() {
    if(end != 0 && this.thenGroup.next != null){
      count = start;
      if(count < end * 60){
        thenGroup.next.execute();
        count++;
      } else {
        if(this.elseGroup.next != null){
          elseGroup.next.execute();
        }
    }
  }
}
}

public class IfStatement extends LogicCommandBlock{
  public IfStatement(ControlP5 cp5, ControlFont cf, Tank tank){
    super(cp5, cf, tank);
    this.g.getCaptionLabel().set("If").setFont(cf);
  }

  void execute() {
    if(conditionGroup.next != null && thenGroup.next != null){
      if(((ConditionBlock)conditionGroup.next).calculate()){
        thenGroup.next.execute();
      } else {
        if(elseGroup.next != null){
          elseGroup.next.execute();
        }
    }
  }
}
}