static int count = 0;

public abstract class CommandBlock{
  protected ControlP5 cp5;
  protected Group g;
  
  public CommandBlock(ControlP5 cp5){
    this.cp5 = cp5;
    this.g = cp5.addGroup(count++ + "")
             .setPosition(100,100)
             .setBackgroundHeight(100)
             .setSize(300,100)
             .setBarHeight(20)
             .setBackgroundColor(color(255,80));
  }
  
  abstract void execute();
}