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
	private var levelSelect:Button = new Button("Level Select", "img/middlebutton.png", "img/middlebuttonhover.png");
	private var options:Button= new Button("Options", "img/middlebutton.png", "img/middlebuttonhover.png");
	private var contact:Button = new Button("Contact", "img/middlebutton.png", "img/middlebuttonhover.png");
	private var exit:Button = new Button ("Exit game", "img/bottombutton.png", "img/bottombuttonhover.png");
	private var start:Button = new Button ("Start game", "img/topbutton.png", "img/topbuttonhover.png");
	var X:Int = Lib.current.stage.stageWidth;
	var Y:Int = Lib.current.stage.stageHeight;
	var instance:Main;
	
	public function new()  
	{
		super ();
		addEventListener ( Event.ADDED_TO_STAGE, init);
	}
	
	function init (event:Event)
	{
		removeEventListener ( Event.ADDED_TO_STAGE, init);
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
		addChild(start);
		addChild(levelSelect);
		addChild(options);
		addChild(contact);
		addChild(exit);
		
		
		start.x = ( X / 2 - start.width / 2);
		start.y = 150;
		levelSelect.x = ( X / 2 - levelSelect.width / 2);
		levelSelect.y = 250;
		options.x = (X / 2 - options.width / 2);
		options.y = 350;
		contact.x = (X / 2 - contact.width / 2);
		contact.y =	450;
		exit.x = ( X / 2 - exit.width / 2);
		exit.y = 550;

		
		start.addEventListener(MouseEvent.CLICK, click);
		levelSelect.addEventListener(MouseEvent.CLICK, click);
		options.addEventListener(MouseEvent.CLICK, click);
		contact.addEventListener(MouseEvent.CLICK, click);
		exit.addEventListener(MouseEvent.CLICK, click);
		
	}
	// Ask Manno for help
	// How to get this to check for which button it's on.
	public function click (event:MouseEvent)
	{
		if (event.currentTarget == start)
			{
				trace ("Starting game");
				Main.getInstance ().switchScreen (Main.CHAR_SELECT_SCREEN);
				// removeChildren();
			}
			
		if (event.currentTarget == levelSelect)
			{
				Main.getInstance().switchScreen (Main.LEVEL_SELECT_SCREEN);
				trace ("working");
				// removeChildren();
				
			}		
		if (event.currentTarget == options)
			{
				Main.getInstance().switchScreen (Main.OPTIONS_SCREEN);
				trace ("Mabye working");
				//removeChildren();				
			}
		if (event.currentTarget == contact)
			{
				Main.getInstance().switchScreen (Main.CONTACT_SCREEN);
				trace ("Contact");
				// removeChilderen();
			}
		if (event.currentTarget == exit)
			{
				trace ("Exit");	
				
			}
		
	
	}
	
}

