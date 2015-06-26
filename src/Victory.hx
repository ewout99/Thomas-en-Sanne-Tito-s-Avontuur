package;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.Assets;
import openfl.events.MouseEvent;
import openfl.Lib;

/**
 * Vicotry class shown at the end of the game
 * @author Kjell Neumann
 */
class Victory extends Sprite
{
	// Fix for the stage width and height
	var X:Int = Lib.current.stage.stageWidth;
	var Y:Int = Lib.current.stage.stageHeight;

	// Initilaztion of the victory screen
	public function new() 
	{
		super ();
		
		var background:Bitmap = new Bitmap (Assets.getBitmapData ("img/Victorybackground.png"));
		addChild ( background );
		
		var backbutton:Button = new Button ("Terug", "img/middlebutton.png", "middlebuttonhover.png");
		backbutton.x = X / 2 - backbutton.width / 2;
		backbutton.y = Y / 4;
		addChild ( backbutton );
		backbutton.addEventListener (MouseEvent.CLICK, clicked);
	}
	
	// Call back to the menu screen
	function clicked (e:MouseEvent)
	{
		Main.getInstance().switchScreen(Main.MAIN_MENU_SCREEN);
	}
}