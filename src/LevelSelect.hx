package ;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.display.Bitmap;
import openfl.Lib;
import openfl.Assets;

/**
 * Abilit to start any level
 * @author Ezzz
 */
class LevelSelect extends Sprite
{

	var returnButton:Button = new Button ("Main Menu", "img/middlebutton.png", "img/middlebuttonhover.png");
	var levelOne:Button = new Button ("Level 1", "img/middlebutton.png", "img/middlebuttonhover.png");
	var levelTwo:Button = new Button ("Level 2 ", "img/middlebutton.png", "img/middlebuttonhover.png");
	var X:Int = Lib.current.stage.stageWidth;
	var Y:Int = Lib.current.stage.stageHeight;
	
	public function new() 
	{
		super();
		drawbackground();
		drawButton();
	}
		
	private	function drawbackground()
	{
		var background = new Bitmap(Assets.getBitmapData("img/Contactbackground.png"));
		addChildAt (background, 0);
	}
	
	function drawButton ()
	{
		
		levelOne.x = (X / 2 - levelOne.width /2 );
		levelOne.y = (Y * 1/ 4 - levelOne.height /2 );
		addChild(levelOne);
		levelOne.addEventListener(MouseEvent.CLICK, back);
		
		levelTwo.x = (X / 2 - levelTwo.width /2 );
		levelTwo.y = (Y * 2/ 4 - levelTwo.height /2 );
		addChild(levelTwo);
		levelTwo.addEventListener(MouseEvent.CLICK, back);
	
		returnButton.x =(X / 2 - returnButton.width /2 );
		returnButton.y = (Y * 3/ 4 - returnButton.height /2 );
		addChild(returnButton);
		returnButton.addEventListener(MouseEvent.CLICK, back);
	}
	function back(e:MouseEvent)
	{
		if (e.currentTarget == levelOne)
			{
				Main.getInstance ().currentLevel = 1;
				trace ( Main.getInstance ().currentLevel);
				Main.getInstance ().switchScreen (Main.MAIN_MENU_SCREEN);
			}
			
		if (e.currentTarget == levelTwo)
			{
				Main.getInstance ().currentLevel = 2;
				trace ( Main.getInstance ().currentLevel);
				Main.getInstance().switchScreen (Main.MAIN_MENU_SCREEN);
			}		
		if (e.currentTarget == returnButton)
			{
				Main.getInstance().switchScreen (Main.MAIN_MENU_SCREEN);		
			}
	}
}