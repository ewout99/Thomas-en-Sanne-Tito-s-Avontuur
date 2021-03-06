package ;
import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.Lib;
import openfl.Assets;
/**
 * Options screen
 * Change volumes etc.
 * @author Ezzz
 */
class Options extends Sprite
{
	// Button variables
	private var returnButton:Button = new Button ("Hoofdmenu", "img/middlebutton.png", "img/middlebuttonhover.png");
	private var increaseSound:Button = new Button ("+ Geluid", "img/middlebutton.png", "img/middlebuttonhover.png");
	private var decreaseSound:Button = new Button ("- Geluid", "img/middlebutton.png", "img/middlebuttonhover.png");
	private var increaseMusic:Button = new Button ("+ Muziek", "img/middlebutton.png", "img/middlebuttonhover.png");
	private var decreaseMusic:Button = new Button ("- Muziek", "img/middlebutton.png", "img/middlebuttonhover.png");
	private var returnGame:Button = new Button ("Terug naar Spel", "img/middlebutton.png", "img/middlebuttonhover.png");
	// For some reason stage.*** won't work this was the solution
	var X:Int = Lib.current.stage.stageWidth;
	var Y:Int = Lib.current.stage.stageHeight;
	
	// Intiliazation of the options screen
	public function new() 
	{
		super();
		drawbackground();
		drawButton();
	}
	
	// Adds background to the options screen
	private	function drawbackground()
	{
		var background = new Bitmap(Assets.getBitmapData("img/Optionsbackground.png"));
		addChildAt (background, 0);
	}
	
	// Draws all buttons and adds eventlistner to make the buttons usefull
	function drawButton ()
	{
		// Sound Buttons
		increaseSound.x = X / 3 * 2 - increaseSound.width / 2;
		increaseSound.y = 250;
		increaseSound.addEventListener(MouseEvent.CLICK, editSound);
		addChild(increaseSound);
		
		decreaseSound.x = X / 3 - decreaseSound.width / 2;
		decreaseSound.y = 250;
		decreaseSound.addEventListener(MouseEvent.CLICK, editSound);
		addChild(decreaseSound);
		
		// Music Buttons
		increaseMusic.x = X / 3 * 2 - increaseMusic.width / 2;
		increaseMusic.y = 350;
		increaseMusic.addEventListener(MouseEvent.CLICK, editSound);
		addChild(increaseMusic);
		
		decreaseMusic.x = X / 3 - decreaseMusic.width / 2;
		decreaseMusic.y = 350;
		decreaseMusic.addEventListener(MouseEvent.CLICK, editSound);
		addChild(decreaseMusic);
		
		// Return Button
		returnButton.x = (X / 2 - returnButton.width /2 );
		returnButton.y = (Y * 3/ 4 - returnButton.height /2 );
		addChild(returnButton);
		returnButton.addEventListener(MouseEvent.CLICK, back);
		
		// Return to the current game
		// only starts if there is a current game
		if (Main.getInstance().currentGame != null)
		{
			returnGame.x = (X / 2 - returnButton.width / 2 );
			returnGame.y = (Y * (9 / 10) - returnButton.height / 2 );
			addChild(returnGame);
			returnGame.addEventListener(MouseEvent.CLICK, backgame);
		}
		
	}
	
	// Lets the buttons adjust the float in Main
	function editSound(e:MouseEvent)
	{
		if (e.currentTarget == increaseMusic)
		{
			Main.getInstance().music.updateMusicVolume (0.2, "up");
		}
		if (e.currentTarget == decreaseMusic)
		{
			Main.getInstance().music.updateMusicVolume (0.2,"down");
		}
		if (e.currentTarget == increaseSound)
		{
			Main.getInstance().sound.updateSoundVolume (0.2, "up");
		}
		if (e.currentTarget == decreaseSound)
		{
			Main.getInstance().sound.updateSoundVolume(0.2, "down");
		}
	}
	
	// Returns the to current game
	function backgame (e:MouseEvent)
	{
		Main.getInstance().switchScreen(Main.CURRENT_GAME);
	}
	
	// Return to the main menu
	function back(e:MouseEvent)
	{
		Main.getInstance().switchScreen(Main.MAIN_MENU_SCREEN);
	}
}