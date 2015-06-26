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
	// Variables for the different bitmaps that make up the level
	var levelcoll:Bitmap = new Bitmap (Assets.getBitmapData("img/level/collision.png"));
	var levelback:Bitmap = new Bitmap (Assets.getBitmapData("img/level/floorplan.png"));
	var levelwall:Bitmap = new Bitmap (Assets.getBitmapData("img/level/floorwalls.png"));
	
	// Initialzation of the level
	// Adds all the 
	public function new() 
	{
		super ();
		
		addChild ( levelcoll );
		addChild ( levelback );
		addChild ( levelwall );
	}
	
	// Checks if the transparcy for colsion
	// Returns a bool
	public function transparencycheck (x:Int, y:Int):Bool
	{
		var checkvalid:Bool = false;
		
		var checkcol:Int = levelcoll.bitmapData.getPixel32 (x, y);
		
		if (checkcol == -16777216)
		{
			checkvalid = true;
		}
		
		return checkvalid;
	}
}