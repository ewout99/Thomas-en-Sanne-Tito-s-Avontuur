package ;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.display.Bitmap;
import openfl.Lib;
import openfl.Assets;

/**
 * A page containing all the informtion of the KRJW
 * @author Ezzz
 */
class Contact extends Sprite
{
	var returnButton:Button = new Button ("Main Menu", "img/middlebutton.png", "img/middlebuttonhover.png");
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
		returnButton.x = (X / 2 - returnButton.width /2 );
		returnButton.y = (Y * 3/ 4 - returnButton.height /2 );
		addChild(returnButton);
		returnButton.addEventListener(MouseEvent.CLICK, back);
	}
	function back(e:MouseEvent)
	{
		Main.getInstance().switchScreen(Main.MAIN_MENU_SCREEN);
	}
	
}