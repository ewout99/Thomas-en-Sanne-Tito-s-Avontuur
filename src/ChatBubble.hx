package ;

import openfl.display.Bitmap;
import openfl.text.TextField;
import openfl.display.Sprite;
import openfl.events.MouseEvent;
import openfl.Assets;

/**
 * ...
 * @author Linnea
 */
class ChatBubble extends Sprite
{
    //Variables getting initialized when this class is created.
    private var bubbleImageLeft:Bitmap;
    private var bubbleImageRight:Bitmap;
    private var bubbleTextList:Array<String>;
    
    private var rightX:Float;
    private var rightY:Float;
    private var leftX:Float;
    private var leftY:Float;
    
    //Other variables.
    private var bubbleText:String;
    private var currentText:Int;
    
    public function new(bubbleTextList:Array<String>, bubbleImageLeft:String, bubbleImageRight:String) {
        super();
        
        //Initialize variables.
        this.bubbleTextList = bubbleTextList;
        this.bubbleText = "Empty";
        
        this.bubbleImageLeft = new Bitmap(Assets.getBitmapData(bubbleImageLeft));
        this.bubbleImageRight = new Bitmap(Assets.getBitmapData(bubbleImageRight));
        
        //Add children.
        addChild(this.bubbleImageLeft);
        addChild(this.bubbleImageRight);
        
        //Hide children.
        this.bubbleImageLeft.visible = false;
        this.bubbleImageRight.visible = false;
    }
    
    /*
    private function draw():Void {
        
    }
    */
    /**
    * Show the left text bubble.
    */
    public function showLeftBubble():Void {
        if (bubbleImageRight.visible)
            bubbleImageRight.visible = false;
        bubbleImageLeft.visible = true;
        
        //TODO: Update text index and position here!
    }
    
    /**
    * Show the right text bubble.
    */
    public function showRightBubble():Void {
        if (bubbleImageLeft.visible)
            bubbleImageLeft.visible = false;
        bubbleImageRight.visible = true;
        
        //TODO: Update text index and position here!
    }
    
    /**
    * Show the next text in the list.
    */
    public function nextText():Void {
        currentText++;
        //bubbleText.text = bubbleTextList[currentText];
    }
    
    /**
    * Set the bubble text!
    */
    public function setText(text:String):Void {
        //bubbleText.text = text;
    }
}
