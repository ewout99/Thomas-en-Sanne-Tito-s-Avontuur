package ;
import haxe.Timer;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.Assets;
import openfl.display.Sprite;
import openfl.display.Tilesheet;
import openfl.geom.Rectangle;
import openfl.Lib;

/**
 * Handles the movement of the character
 * @author Ezzz
 */

class Player extends Sprite
{
	var stageY:Int = Lib.current.stage.stageHeight;
	var stageX:Int = Lib.current.stage.stageWidth;
	var tilesheet:Tilesheet;
	var currentImg:Int = 0;
	var frameCount:Int;
	var charType:Int = Main.getInstance().currentChar;
	var character:Bitmap;
	public var activeKey:Int = 0;
	var animationtimer:Timer;
	var lastpath:String = "front_";
	
	public function new()
	{
		super();
		
		trace("player has been created");
		
		updategraphic ("front_1");
	}
	
	public function animate ( path:String )
	{
		trace ("Animate Function Called");
		
		animationtimer = new Timer (100);
		
		lastpath = path;
		
		var animationcounter = 1;
		
		animationtimer.run = function ()
		{
			trace ("animation cycling " + animationcounter);
			
			if (animationcounter == 5)
			{
				animationcounter = 1;
			}
			
			updategraphic (path + animationcounter);
			
			animationcounter ++;
		}
	}
	
	public function stopanimation ()
	{
		animationtimer.stop ();
		
		updategraphic ( lastpath + "1" );
	}
	
	function updategraphic (path:String)
	{
		var data:BitmapData = Assets.getBitmapData ("img/thomas/" + path + ".png");
	
		removeChild (character);
		character = new Bitmap (data);
		addChild (character);
	}
}