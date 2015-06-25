package ;
import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.Assets;

/**
 * Class that supports the background of the game
 * Placement of wall and floors doors etc.
 * @author Ezzz
 */

class Level extends Sprite
{
	var levelcoll:Bitmap = new Bitmap (Assets.getBitmapData("img/level/collision.png"));
	var levelback:Bitmap = new Bitmap (Assets.getBitmapData("img/level/floorplan.png"));
	var levelwall:Bitmap = new Bitmap (Assets.getBitmapData("img/level/floorwalls.png"));
	
	public function new() 
	{
		super ();
		
		addChild ( levelcoll );
		addChild ( levelback );
		addChild ( levelwall );
	}
	
	public function transparencycheck (x:Int, y:Int)
	{
		var checkvalid:Bool = false;
		
		var checkcol:Int = levelcoll.bitmapData.getPixel32 (x, y);
		
		//trace (x + "   " + y + "   " + checkcol);
		
		if (checkcol == -16777216)
		{
			checkvalid = true;
		}
		
		return checkvalid;
	}
}