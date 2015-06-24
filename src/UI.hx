package ;
import openfl.display.Sprite;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.Lib;

/**
 * Holds the userinterface 
 * Shows score, stars, mascot etc.
 * @author Ezzz
 */
class UI extends Sprite
{
	var UIx:Int = Lib.current.stage.stageWidth;
	var UIy:Int = Lib.current.stage.stageHeight;
	public var hint:Button = new Button("", "img/Hint.png", "img/Hinthover.png");
	public var progressInt:Int = 1;

	public function new() 
	{
		super();
		drawUI();
	}
	
	private function drawUI ()
	{
		var objectives = new Bitmap(Assets.getBitmapData("img/Objectives.png"));
		objectives.width = objectives.width / 1.2;
		objectives.height = objectives.height / 1.2;
		objectives.x = 10;
		objectives.y = (UIy / 2 - objectives.height /2) ;
		addChild(objectives);
		
		var progressie = new Bitmap (Assets.getBitmapData("img/Progressie.png"));
		progressie.width = progressie.width;
		progressie.height = progressie.height;
		progressie.x = (UIx / 2 ) - ( progressie.width / 2);
		progressie.y = 10;
		addChild(progressie);
		
		var option = new Bitmap(Assets.getBitmapData("img/optionbutton.png"));
		option.width = option.width / 1.5;
		option.height = option.height / 1.5;
		option.x = (UIx - option.width - 25);
		option.y = 25;
		addChild(option);
		option.addEventListener(MouseEvent.CLICK, backMenu); 
		
		hint.width = hint.width / 2;
		hint.height = hint.height / 2;
		hint.x = ( UIx - hint.width - 10);
		hint.y = ( UIy - hint.height - 10);
		addChild(hint);
		hint.addEventListener(MouseEvent.CLICK, giveHint);
		
		progressUpdate(progressInt);
		
	}
	
	public function progressUpdate (progress:Int)
	{
		for ( i in 0 ... progress)
		{
			/*var progressVisual = new Bitmap(Assets.getBitmapData("img/Progressbarpiece.png"));
			progressVisual.y = 20;
			progressVisual.x = 305 + i * 67;
			addChild(progressVisual);*/
		}
	}
	
	function giveHint (e:MouseEvent)
	{
		
	}
	
	function backMenu (e:MouseEvent)
	{
		Main.getInstance().switchScreen (Main.OPTIONS_SCREEN);
	}
}