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
	var ui:UI;
	var levelx:Int = Lib.current.stage.stageWidth;
	var levely:Int = Lib.current.stage.stageHeight;
	var activestage = Lib.current.stage;
	var itemarray = new Array<Objects> ();
	var missiontarget:Int = 0;
	var updatetimer:Timer;
	
	//keystates
	var key_w:Bool = false;
	var key_a:Bool = false;
	var key_s:Bool = false;
	var key_d:Bool = false;
	var key_e:Bool = false;
	var key_esc:Bool = false;
	var key_space:Bool = false;

	public function new() 
	{
		super();
		
		init ();
		
		createlevel ();
		dirtyitemcreate ();
		createplayer ();
		createUI();
	}
	
	//====================================================================//
	//                                                                    //
	//                             Key Presses                            //
	//                                                                    //
	//====================================================================//
	
	//Makes player sprite adjust to pressed keys
	
	function keypress (event:KeyboardEvent)
	{
		switch ( event.keyCode)
		{
			case 87: key_w = true;
			case 65: key_a = true;
			case 83: key_s = true;
			case 68: key_d = true;
			case 69: interact();
		}
	}
	
	function keyrelease (event:KeyboardEvent)
	{
		switch ( event.keyCode )
		{
			case 87: key_w = false;
			case 65: key_a = false;
			case 83: key_s = false;
			case 68: key_d = false;
		}
		
		player.stopanimation ();
	}
	
	function interact ()
	{
		var returnedobject = checkvalid ();
		
		if ( returnedobject.itemid != 0 )
		{
			trace (returnedobject.iteminteracttext);
		}
		
		else
		{
			trace ("no valid item in range");
		}
	}

	//====================================================================//
	//                                                                    //
	//                         Initializing Stuff                         //
	//                                                                    //
	//====================================================================//
	
	function init ()
	{
		updatetimer = new Timer (40);
		updatetimer.run = function ()
		{
			update ();
		}
		
		//Listen for keypresses, set keypress states for update function
		
		Lib.current.stage.addEventListener ( KeyboardEvent.KEY_DOWN, keypress );
		
		Lib.current.stage.addEventListener ( KeyboardEvent.KEY_UP, keyrelease );
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
	
	// Adds UI to the game
	function createUI ()
	{
		ui = new UI();
		
		addChild(ui);
	}

	//====================================================================//
	//                                                                    //
	//                         Technical Functions                        //
	//                                                                    //
	//====================================================================//
	
	function update ()
	{
		var truex:Int = Std.int(level.x * -1) + 608;
		var truey:Int = Std.int(level.y * -1) + 328;
		
		if ( key_w == true )
		{
			var w_truey:Int = truey - 5;
			var blocked = level.transparencycheck ( truex, w_truey );
			
			if ( blocked == false && key_s == false )
			{
				if ( key_a == true || key_d == true )
				{
					movelevel ( "y", -2 );
				}
				
				else
				{
					movelevel ( "y", -3 );
				}
			}
		}
		
		if ( key_a == true )
		{
			var a_truex:Int = truex - 5;
			var blocked = level.transparencycheck ( a_truex, truey );
			
			if ( blocked == false && key_d == false )
			{
				if ( key_w == true || key_s == true )
				{
					movelevel ( "x", -2 );
				}
				
				else
				{
					movelevel ( "x", -3 );
				}
			}
		}
		
		if ( key_s == true )
		{
			var s_truey:Int = truey + 5;
			var blocked = level.transparencycheck ( truex, s_truey );
			
			if ( blocked == false && key_w == false )
			{
				if ( key_a == true || key_d == true )
				{
					movelevel ( "y", 2 );
				}
				
				else
				{
					movelevel ( "y", 3 );
				}
			}
		}
		
		if ( key_d == true )
		{
			var d_truex:Int = truex + 5;
			var blocked = level.transparencycheck ( d_truex, truey );
			
			if ( blocked == false && key_a == false )
			{
				if ( key_w == true || key_s == true )
				{
					movelevel ( "x", 2 );
				}
				
				else
				{
					movelevel ( "x", 3 );
				}
			}
		}
	}
	
	function movelevel (axis:String, speed:Int)
	{
		if (axis == "x")
		{
			level.x = level.x - speed;
		
			for (item in itemarray)
			{
				item.x = item.x - speed;
			}
		}
		
		if ( axis == "y" )
		{
			level.y = level.y - speed;
			
			for (item in itemarray)
			{
				item.y = item.y - speed;
			}
		}
	}
	
	function checkvalid ()
	{
		var closest:Objects = new Objects (0 , "none" , "none");
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

	//====================================================================//
	//                                                                    //
	//                           Adding Items                             //
	//                                                                    //
	//====================================================================//
	
	function dirtyitemcreate ()
	{
		//define items type with either FURNITURE, NPC, PLANT, ITEM or OBJECTIVE
		var item01:Objects = new Objects (1 , "FURNITURE" , "Een redelijk normaal bureau.");
		item01.x = 870 * 1.5 - 400;
		item01.y = 430 * 1.5 - 600;
		itemarray.push ( item01 );
		
		var item02:Objects = new Objects (2 , "FURNITURE" , "Een saaie tafel.");
		item02.x = 1025 * 1.5 - 400;
		item02.y = 310 * 1.5 - 600;
		itemarray.push ( item02 );
		
		var item03:Objects = new Objects (3 , "FURNITURE" , "De stoel piept een beetje.");
		item03.x = 1150 * 1.5 - 400;
		item03.y = 475 * 1.5 - 600;
		itemarray.push ( item03 );
		
		var item04:Objects = new Objects (4 , "FURNITURE" , "Allemaal lege laadjes.");
		item04.x = 715 * 1.5 - 400;
		item04.y = 485 * 1.5 - 600;
		itemarray.push ( item04 );
		
		var item05:Objects = new Objects (5 , "FURNITURE" , "Een tafel, niet erg bijzonder.");
		item05.x = 1030 * 1.5 - 400;
		item05.y = 625 * 1.5 - 600;
		itemarray.push ( item05 );
		
		var item06:Objects = new Objects (6 , "NPC" , "Bas bewaakt de ingang elke dag.");
		item06.x = 830 * 1.5 - 400;
		item06.y = 570 * 1.5 - 600;
		itemarray.push ( item06 );
		
		placeitems ();
	}
	
	function createmission ()
	{
		var mission01:Mission = new Mission (1, "test", "test 2");
		var mission02:Mission = new Mission (2, "testit", "testit 2");
	}
	
	function placeitems ()
	{
		for (item in itemarray)
		{
			addChild ( item );
		}
	}
	
	//====================================================================//
	//                                                                    //
	//            Mission Stuff. Kjell is a really cool guy.              //
	//                                                                    //
	//====================================================================//
	
	function displaymission ()
	{
		
	}
}