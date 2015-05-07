package ;

import openfl.display.Bitmap;
import openfl.Assets;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.Lib;
import openfl.display.StageDisplayState;

/**
 * Class that hold the menu.
 * @author Ezzz
 */
class MainMenu extends Sprite
{
	var levelSelect:Button = new Button("img/MenuButtonStart.png", "img/MenuButtonStartHover.png");
	var options:Button= new Button("img/MenuButtonStart.png", "img/MenuButtonStartHover.png");
	var contact:Button = new Button("img/MenuButtonStart.png", "img/MenuButtonStartHover.png");
	var X:Int = Lib.current.stage.stageWidth;
	var Y:Int = Lib.current.stage.stageHeight;
	public function new()  
	{
		super ();
		drawbackground();
		drawmenu ();
	}
	
	function drawbackground()
	{
		var background = new Bitmap(Assets.getBitmapData("img/Background.png"));
		addChildAt (background, 0);
	}
	function drawmenu() 
	{
		addChild(levelSelect);
		addChild(options);
		
		levelSelect.x = (X / 2);
		levelSelect.y = (Y / 2);

		//options.x = (stage.stageWidth - options.width) / 2;
		//options.y = (stage.stageHeight - options.height) / 2 + 25;

		
		//startbutton.addEventListener(MouseEvent.CLICK, startGame);
		//exitbutton.addEventListener(MouseEvent.CLICK, exit);
		
	}
	
}
	