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
	// Button variables
	var charThomas:Button = new Button("Thomas", "img/middlebutton.png", "img/middlebuttonhover.png");
	var charSanne:Button = new Button("Sanne", "img/middlebutton.png", "img/middlebuttonhover.png");
	// For some reason stage.*** won't work this was the solution
	var X:Int = Lib.current.stage.stageWidth;
	var Y:Int = Lib.current.stage.stageHeight;

	public function new() 
	{
		super ();
		drawButtons();
	}
	
	// Draw Buttons 
	function drawButtons()
	{	
		charThomas.x = 200;
		charThomas.y = 600;
		
		charSanne.x = 700;
		charSanne.y = 600;
		addChild(charSanne);
		addChild(charThomas);
		charSanne.addEventListener(MouseEvent.CLICK, charSelect);
		charThomas.addEventListener(MouseEvent.CLICK, charSelect);
		
	}
	
	// Listing class for the char select
	// Also results in the game starting for now needs to be changed later
	function charSelect(e:MouseEvent)
	{
		if (e.currentTarget == charThomas)
		{
			// Set Character 1
			Main.getInstance().currentChar = 1;
			trace (Main.getInstance().currentChar);
			Main.getInstance().switchScreen(Main.GAME_SCREEN);
			
			trace ("Thomas selected");
			
		}
		if (e.currentTarget == charSanne)
		{
			// Set Character 2
			Main.getInstance().currentChar = 2;
			trace (Main.getInstance().currentChar);
			Main.getInstance().switchScreen(Main.GAME_SCREEN);
			
			trace ("Sanne selected");
		}
	}
	
	
}