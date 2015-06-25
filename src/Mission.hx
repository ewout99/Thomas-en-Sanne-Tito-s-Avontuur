package;
import openfl.display.Bitmap;
import openfl.display.Sprite;

/**
 * ...
 * @author Kjell Neumann
 */
class Mission extends Sprite
{
	public var missionid:Int = 0;
	public var missiontext:String = "ER IS HIER GEEN TEKST";
	public var missiontarget:String = "000";
	public var missiongraphic:Bitmap;
	public var missiongraphicdone:Bitmap;
	
	public function new(id:Int, text:String, target:String) 
	{
		super ();
	}
	
}