package ;

/**
 * Handles the movement of the character
 * @author Ezzz
 */

class Player
{
	var stageY:Int = stage.getheight;

	public function new() 
	{
		super();
		
		var bitmapData:BitmapData = Assets.getBitmapData ( "assets/tom_tilesheet.png" ) ;
		var character = new Bitmap ( bitmapData ) ;
		character.height = ( stageY / 10 ) ;
		character.width = character. ;
		
		addChild (character) ;
	}

}