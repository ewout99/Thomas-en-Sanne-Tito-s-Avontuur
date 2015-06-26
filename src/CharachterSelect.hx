package ;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.Lib;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.Assets;

/**
 * The Screen where you can choose between sanne en thomas
 * @author Ezzz
 */
class CharachterSelect extends Sprite
{
	// Button variables
	var charThomas:Button = new Button("Thomas", "img/middlebutton.png", "img/middlebuttonhover.png");
	var charSanne:Button = new Button("Sanne", "img/middlebutton.png", "img/middlebuttonhover.png");
	var returnButton:Button = new Button ("Main Menu", "img/middlebutton.png", "img/middlebuttonhover.png");
	
	// For some reason stage.*** won't work this was the solution
	var X:Int = Lib.current.stage.stageWidth;
	var Y:Int = Lib.current.stage.stageHeight;

	public function new() 
	{
		super ();
		drawstuff ();
		drawButtons ();
	}
	
	// Draws the background and the two characters
	function drawstuff ()
	{
        var background = new Bitmap(Assets.getBitmapData("img/Characterbackground.png"));
		var thomas = new Bitmap(Assets.getBitmapData("img/thomasicon.png"));
		var sanne = new Bitmap(Assets.getBitmapData("img/sanneicon.png"));
		
		thomas.width = thomas.width / 3;
		thomas.height = thomas.height / 3;
		thomas.x = X / 2 - 230 - thomas.width / 2;
		thomas.y = Y / 2.5;
		
		sanne.width = sanne.width / 3;
		sanne.height = sanne.height / 3;
		sanne.x = X / 2 + 235 - sanne.width / 2;
		sanne.y = Y / 2.5;
		
		addChildAt (background, 0);
		addChild (thomas);
		addChild (sanne);
    }
	
	// Draw Buttons 
	function drawButtons()
	{	
		charThomas.x = X / 3  - charThomas.width / 2;
		charThomas.y = 600;
		
		charSanne.x = X / 3 * 2 - charSanne.width / 2;
		charSanne.y = 600;
		addChild(charSanne);
		addChild(charThomas);
		charSanne.addEventListener(MouseEvent.CLICK, charSelect);
		charThomas.addEventListener(MouseEvent.CLICK, charSelect);
		
		returnButton.x = (X / 2 - returnButton.width /2 );
		returnButton.y = (Y - 50 );
		addChild(returnButton);
		returnButton.addEventListener(MouseEvent.CLICK, back);
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
	
	// Call back to the Main menu screen
	function back(e:MouseEvent)
	{
		Main.getInstance().switchScreen(Main.MAIN_MENU_SCREEN);
	}
}