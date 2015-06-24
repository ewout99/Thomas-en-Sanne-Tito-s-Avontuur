package ;
//import haxe.io.Int32Array.Int32ArrayData;
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
	var itemarray = new Array<Objects> ();

	public function new() 
	{
		super();
		
		createlevel ();
		listenpress ();
		dirtyitemcreate ();
		createplayer ();
	}
	
	//Makes player sprite adjust to pressed keys
	function keypress (event:KeyboardEvent)
	{
		if (event.keyCode == 87)
		{
			listenrelease (event.keyCode);
		}
		
		else if (event.keyCode == 65)
		{
			listenrelease (event.keyCode);
		}
		
		else if (event.keyCode == 83)
		{
			listenrelease (event.keyCode);
		}
		
		else if (event.keyCode == 68)
		{
			listenrelease (event.keyCode);
		}
		
		else if (event.keyCode == 69)
		{
			var returnedobject = checkvalid ();
			
			if ( returnedobject.itemid != "none" )
			{
				trace (returnedobject.iteminteracttext);
			}
			
			else
			{
				trace ("no valid item in range");
			}
		}
	}
	
	function updatescene ()
	{
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
		
		level.x = -400;
		level.y = -600;
		level.width = level.width * 1.5;
		level.height = level.height * 1.5;
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
				
				for (item in itemarray)
				{
					item.x = item.x + 3 * dir;
				}
			}
			
			else if (axis == "Y")
			{
				level.y = level.y + 3 * dir;
				
				for (item in itemarray)
				{
					item.y = item.y + 3 * dir;
				}
			}
			
			if (activekey == 0)
			{
				scrollclock.stop ();
			}
		}
	}
	
	function checkvalid ()
	{
		var closest:Objects = new Objects ("none" , "none" , "none");
		var closdifftot:Int = -1;
		
		for (item in itemarray)
		{
			var diffx:Int = Math.floor ( player.x - item.x );
			var diffy:Int = Math.floor ( player.y - item.y );
			
			if ( diffx != 0 )
			{
				diffx = diffx * -1;
			}
			
			if ( diffy < 0 )
			{
				diffy = diffy * -1;
			}
			
			var difftot = Math.floor (Math.sqrt(Math.pow(diffx,2) + Math.pow(diffy,2)));
			
			if ( difftot < 50)
			{
				if ( closdifftot == -1 )
				{
					closest = item;
					closdifftot = difftot;
				}
				
				else if ( closdifftot > difftot )
				{
					closest = item;
					closdifftot = difftot;
				}
			}
		}
		
		return closest;
	}
	
	function checkcollision (dir:Int, axis:String)
	{
		
	}
	
	function dirtyitemcreate ()
	{
		//define items type with either FURNITURE, NPC, PLANT, ITEM or OBJECTIVE
		var item01:Objects = new Objects ("001" , "FURNITURE" , "Een redelijk normaal bureau.");
		item01.x = 870 * 1.5 - 400;
		item01.y = 430 * 1.5 - 600;
		itemarray.push ( item01 );
		
		var item02:Objects = new Objects ("002" , "FURNITURE" , "Een saaie tafel.");
		item02.x = 1025 * 1.5 - 400;
		item02.y = 310 * 1.5 - 600;
		itemarray.push ( item02 );
		
		var item03:Objects = new Objects ("003" , "FURNITURE" , "De stoel piept een beetje.");
		item03.x = 1150 * 1.5 - 400;
		item03.y = 475 * 1.5 - 600;
		itemarray.push ( item03 );
		
		var item04:Objects = new Objects ("004" , "FURNITURE" , "Allemaal lege laadjes.");
		item04.x = 715 * 1.5 - 400;
		item04.y = 485 * 1.5 - 600;
		itemarray.push ( item04 );
		
		var item05:Objects = new Objects ("005" , "FURNITURE" , "Een tafel, niet erg bijzonder.");
		item05.x = 1030 * 1.5 - 400;
		item05.y = 625 * 1.5 - 600;
		itemarray.push ( item05 );
		
		var item06:Objects = new Objects ("006" , "NPC" , "Bas bewaakt de ingang elke dag.");
		item06.x = 830 * 1.5 - 400;
		item06.y = 570 * 1.5 - 600;
		itemarray.push ( item06 );
		
		placeitems ();
	}
	
	function placeitems ()
	{
		for (item in itemarray)
		{
			addChild ( item );
		}
	}
}