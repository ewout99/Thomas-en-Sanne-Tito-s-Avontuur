package ;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.Lib;

/**
 * The Screen where you can choose between sanne en thomas
 * @author Ezzz
 */
class CharachterSelect extends Sprite
{
	public var currentChar:Int = 0;
	var charThomas:Button = new Button("Thomas", "img/middlebutton.png", "img/middlebuttonhover.png");
	var charSanne:Button = new Button("Sanne", "img/middlebutton.png", "img/middlebuttonhover.png");
		

	public function new() 
	{
		super ();
		trace ("loading char select");
		drawButtons();
	}
	
	function drawButtons()
	{	
		charThomas.x = 200;
		charThomas.y = 600; //(1 / 3 * stage.stageWidth);
		
		charSanne.x = 700;
		charSanne.y = 600; //(2 / 3 * stage.stageWidth);
		addChild(charSanne);
		addChild(charThomas);
		charSanne.addEventListener(MouseEvent.CLICK, charSelect);
		charThomas.addEventListener(MouseEvent.CLICK, charSelect);
		
	}
	function charSelect(e:MouseEvent)
	{
		if (e.currentTarget == charThomas)
		{
			currentChar = 1;
			trace (currentChar);
			// add spawn game here
			this.removeChildren;
			charSanne.removeEventListener;
			charThomas.removeEventListener;
		}
		if (e.currentTarget == charSanne)
		{
			currentChar = 2;
			trace (currentChar);
			// add spawn game here
			this.removeChildren;
			charSanne.removeEventListener;
			charThomas.removeEventListener;
		}
	}
	
	
}