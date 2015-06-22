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
		
	public function new() 
	{
		super ();
		
		trace ("level has been created");
		
		var levelcoll:Bitmap = new Bitmap (Assets.getBitmapData("img/level/collision.png"));
		var levelback:Bitmap = new Bitmap (Assets.getBitmapData("img/level/floorplan.png"));
		var levelwall:Bitmap = new Bitmap (Assets.getBitmapData("img/level/floorwalls.png"));
		
		addChild ( levelcoll );
		addChild ( levelback );
		addChild ( levelwall );
	}
	
}