package ;
import openfl.display.Sprite;
import openfl.ui.Keyboard;
import openfl.events.KeyboardEvent;
import openfl.Lib;
import haxe.Timer;

/**
 * main class that runs the update
 * Hold all the vital funtions for the game
 * @author Ezzz
 */
class Game extends Sprite
{
	var level:Level;
	var player:Player;
	var levelx:Int = Lib.current.stage.stageWidth;
	var levely:Int = Lib.current.stage.stageHeight;
	var activekey:Int = 0;
	var activestage = Lib.current.stage;
	var itemArray:Array<Objects>;

	public function new() 
	{
		super();
		
		createlevel ();
		createplayer ();
		listenpress ();
	}

	//Makes player sprite adjust to pressed keys
	function keypress (event:KeyboardEvent)
	{
		if (event.keyCode == 87)
		{
			//player.updateGraphic ("up");
			
			listenrelease (event.keyCode);
		}
		
		else if (event.keyCode == 65)
		{
			//player.updateGraphic ("left");
			
			listenrelease (event.keyCode);
		}
		
		else if (event.keyCode == 83)
		{
			//player.updateGraphic ("down");
			
			listenrelease (event.keyCode);
		}
		
		else if (event.keyCode == 68)
		{
			//player.updateGraphic ("right");
			
			listenrelease (event.keyCode);
		}
	}
	
	//Adds eventlistener to stage
	function listenpress ()
	{
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, keypress);
	}
	
	//Removes keypress listener and adds key release listener
	function listenrelease (keyCode:Int)
	{
		Lib.current.stage.removeEventListener(KeyboardEvent.KEY_DOWN, keypress);
		
		activekey = keyCode;
		
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, keyrelease);
		
		updatescene ();
		
		//Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, keyrelease);
	}
	
	//Removes key release listener and resets the active key
	function keyrelease (event:KeyboardEvent)
	{
		if (activekey == event.keyCode)
		{
			Lib.current.stage.removeEventListener(KeyboardEvent.KEY_UP, keyrelease);
			
			activekey = 0;
			
			player.stopanimation();
			
			listenpress ();
		}
	}
	
	//Adds the character to the stage and positions him
	function createplayer ()
	{
		player = new Player();
		
		addChild (player);
		
		player.x = levelx / 2 - player.width / 2;
		player.y = levely / 2 - player.height / 2;
		
		player.width = player.width * 1.5;
		player.height = player.height * 1.5;
	}
	
	//Adds level to the stage and positions it
	function createlevel ()
	{
		level = new Level();
		
		addChild (level);
		
		level.x = 0;
		level.y = 0;
		level.width = level.width * 1.5;
		level.height = level.height * 1.5;
	}
	
	function updatescene ()
	{
		trace ("Level moved, key:" + activekey);
		
		if (activekey == 87)
		{
			scroll (1, "Y");
			
			player.animate ("back_");
		}
		
		else if (activekey == 65)
		{
			scroll (1, "X");
			
			player.animate ("left_");
		}
		
		else if (activekey == 83)
		{
			scroll (-1, "Y");
			
			player.animate ("front_");
		}
		
		else if (activekey == 68)
		{
			scroll (-1, "X");
			
			player.animate ("right_");
		}
	}
	
	function scroll (dir:Int, axis:String)
	{
		var scrollclock:Timer = new Timer (30);
		
		scrollclock.run = function ()
		{
			checkcollision (dir, axis);
			
			if (axis == "X")
			{
				level.x = level.x + 3 * dir;
			}
			
			else if (axis == "Y")
			{
				level.y = level.y + 3 * dir;
			}
			
			if (activekey == 0)
			{
				scrollclock.stop ();
			}
		}
	}
	
	function checkvalid ()
	{
		var closestitem:String = "none";
		
		for (object in itemArray)
		{
			
		}
		
		return closestitem;
	}
	
	function checkcollision (dir:Int, axis:String)
	{
		
	}
}