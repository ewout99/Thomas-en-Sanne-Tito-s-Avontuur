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
	public var itemid:String = "000";
	public var itemtype:String = "NONE";
	public var iteminteracttext:String = "Er is hier weinig te vinden...";
	var markerid:Int = 0;

	public function new(id:String, type:String, text:String) 
	{
		super ();
		
		itemid = id;
		itemtype = type;
		iteminteracttext = text;
		
		namemarker ();
		
		if ( itemid != "none" )
		{
			var marker:Bitmap = new Bitmap (Assets.getBitmapData("img/marker_" + markerid + ".png"));
			
			marker.width = 25;
			marker.height = marker.width;
			marker.x = marker.x - marker.width / 2 ;
			marker.y = marker.y - marker.height / 2 ;
			
			addChild ( marker );
		}
	}
	
	function namemarker ()
	{
		if (itemtype == "FURNITURE")
		{
			markerid = 1;
		}
		
		else if (itemtype == "NPC")
		{
			markerid = 2;
		}
		
		else if (itemtype == "PLANT")
		{
			markerid = 3;
		}
		
		else if (itemtype == "ITEM")
		{
			markerid = 4;
		}
		
		else if (itemtype == "OBJECTIVE")
		{
			markerid = 5;
		}
		
		else
		{
			markerid = 0;
		}
	}
}