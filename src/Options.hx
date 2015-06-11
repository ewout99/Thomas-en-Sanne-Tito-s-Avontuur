package ;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.Lib;
/**
 * Options screen
 * Change volumes etc.
 * @author Ezzz
 */
class Options extends Sprite
{
	// Button variables
	private var returnButton:Button = new Button ("Main Menu", "img/middlebutton.png", "img/middlebuttonhover.png");
	private var increaseSound:Button = new Button ("+ Sound", "img/middlebutton.png", "img/middlebuttonhover.png");
	private var decreaseSound:Button = new Button ("- Sound", "img/middlebutton.png", "img/middlebuttonhover.png");
	private var increaseMusic:Button = new Button ("+ Music", "img/middlebutton.png", "img/middlebuttonhover.png");
	private var decreaseMusic:Button = new Button ("- Music", "img/middlebutton.png", "img/middlebuttonhover.png");
	// For some reason stage.*** won't work this was the solution
	var X:Int = Lib.current.stage.stageWidth;
	var Y:Int = Lib.current.stage.stageHeight;
	
	public function new() 
	{
		super();
		drawButton();
	}
	
	// Draws all buttons and adds eventlistner to make the buttons usefull
	function drawButton ()
	{
		// Sound Buttons
		increaseSound.x = 600;
		increaseSound.y = 50;
		increaseSound.addEventListener(MouseEvent.CLICK, editSound);
		addChild(increaseSound);
		
		decreaseSound.x = 100;
		decreaseSound.y = 50;
		decreaseSound.addEventListener(MouseEvent.CLICK, editSound);
		addChild(decreaseSound);
		// Music Buttons
		increaseMusic.x = 600;
		increaseMusic.y = 300;
		increaseMusic.addEventListener(MouseEvent.CLICK, editSound);
		addChild(increaseMusic);
		
		decreaseMusic.x = 100;
		decreaseMusic.y = 300;
		decreaseMusic.addEventListener(MouseEvent.CLICK, editSound);
		addChild(decreaseMusic);
		// Return Button
		returnButton.x = (X / 2 - returnButton.width /2 );
		returnButton.y = (Y * 3/ 4 - returnButton.height /2 );
		addChild(returnButton);
		returnButton.addEventListener(MouseEvent.CLICK, back);
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
	
	// Return to the main menu
	function back(e:MouseEvent)
	{
		Main.getInstance().switchScreen(Main.MAIN_MENU_SCREEN);
	}
}