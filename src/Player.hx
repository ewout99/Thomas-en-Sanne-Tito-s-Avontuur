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
	//var stageY:Int = Lib.current.stage.stageHeight;
	//var stageX:Int = Lib.current.stage.stageWidth;
	//public var activeKey:Int = 0;
	var animationtimer:Timer = new Timer (100);
	var lastpath:String = "front_";
	
	var character:Bitmap;
	var charType:Int = Main.getInstance().currentChar;
	var charType2:String = "none";
	
	public function new()
	{
		super();
		
		if (charType == 1)
		{
			charType2 = "thomas";
		}
		
		else if (charType == 2)
		{
			charType2 = "sanne";
		}
		
		updategraphic ("front_1");
	}
	
	public function animate ( path:String )
	{
		lastpath = path;
		
		var animationcounter = 1;
		
		animationtimer.run = function ()
		{
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
		var data:BitmapData = Assets.getBitmapData ("img/" + charType2 + "/" + path + ".png");
	 
		removeChild (character);
		character = new Bitmap (data);
		character.x = character.x - character.width / 2;
		character.y = character.y - character.height;
		addChild (character);
	}
}