package ;

import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.Assets;

/**
 * Class that wil contain all the objects for the games
 * @author Ezzz
 */
class Objects extends Sprite
{
	//Initializes the variables with same basic values
	public var itemid:Int = 0;
	public var itemtype:String = "NONE";
	public var iteminteracttext:String = "Er is hier weinig te vinden...";
	var markerid:Int = 0;

	//Sets up the object with an marker to indicate its usability
	public function new(id:Int, type:String, text:String) 
	{
		super ();
		
		itemid = id;
		itemtype = type;
		iteminteracttext = text;
		
		namemarker ();
		
		if ( itemid != 0 )
		{
			//loads image with markerid provided below
			var marker:Bitmap = new Bitmap (Assets.getBitmapData("img/marker_" + markerid + ".png"));
			
			marker.width = 25;
			marker.height = marker.width;
			marker.x = marker.x - marker.width / 2 ;
			marker.y = marker.y - marker.height / 2 ;
			
			addChild ( marker );
		}
	}
	
	//Changes the easily addable item type string into a usable id for the image asset loader.
	function namemarker ()
	{
		switch ( itemtype )
		{
			case "FURNITURE" : markerid = 1;
			case "NPC" : markerid = 2;
			case "PLANT" : markerid = 3;
			case "ITEM" : markerid = 4;
			case "OBJECTIVE" : markerid = 5;
			case "NONE" : markerid = 0;
		}
	}
}