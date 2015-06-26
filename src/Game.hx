package ;
//import haxe.io.Int32Array.Int32ArrayData;
import openfl.display.Sprite;
import openfl.ui.Keyboard;
import openfl.events.KeyboardEvent;
import openfl.events.MouseEvent;
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
	
	//missionstates
	var miss1:Bool = false;
	var miss2:Bool = false;
	var miss3:Bool = false;
	var miss4:Bool = false;
	var miss5:Bool = false;
	var miss6:Bool = false;
	var activemiss:Int = 1;
	
	//keystates
	var key_w:Bool = false;
	var key_a:Bool = false;
	var key_s:Bool = false;
	var key_d:Bool = false;
	var key_e:Bool = false;
	public var activekey:String = "none";

	public function new() 
	{
		super();
		
		createlevel ();
		dirtyitemcreate ();
		createplayer ();
		createUI();
		
		init ();
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
		
		if (key_w == false && key_a == false && key_s == false && key_d == false)
		{
			activekey = "none";
		}
		
		//trace ("level.x= " + level.x + " player.x= " + player.x);
	}
	
	function interact ()
	{
		var returnedobject = checkvalid ();
		
		if ( returnedobject.itemid != 0 )
		{
			trace (returnedobject.iteminteracttext);
			
			ui.notify (returnedobject.iteminteracttext);
			
			missionhandler (returnedobject.itemid);
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
		player.y = levely / 1.5 - player.height / 2;
		
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
	
	//updates the level by looking at which keys are active and what speeds should be applied in what directions
	function update ()
	{
		var truex:Int = Std.int(level.x * -1 + player.x);
		var truey:Int = Std.int(level.y * -1 + player.y);
		//trace (truex + "   " + truey);
		
		if ( key_w == true )
		{
			var w_truey:Int = truey - 9;
			var blocked1 = level.transparencycheck ( truex, w_truey );
			var w_truey:Int = truey - 6;
			var blocked2 = level.transparencycheck ( truex, w_truey );
			var w_truey:Int = truey - 3;
			var blocked3 = level.transparencycheck ( truex, w_truey );
			
			var blocked:Bool = false;
			
			if ( blocked1 == true || blocked2 == true || blocked3 == true )
			{
				blocked = true;
			}
			
			if ( blocked == false && key_s == false )
			{
				activekey = "w";
				
				if ( key_a == true || key_d == true )
				{
					movelevel ( "y", -3 );
				}
				
				else
				{
					movelevel ( "y", -5 );
				}
			}
		}
		
		if ( key_a == true )
		{
			var a_truex:Int = truex - 9;
			var blocked1 = level.transparencycheck ( a_truex, truey );
			var a_truex:Int = truex - 6;
			var blocked2 = level.transparencycheck ( a_truex, truey );
			var a_truex:Int = truex - 3;
			var blocked3 = level.transparencycheck ( a_truex, truey );
			
			var blocked:Bool = false;
			
			if ( blocked1 == true || blocked2 == true || blocked3 == true )
			{
				blocked = true;
			}
			
			if ( blocked == false && key_d == false )
			{
				activekey = "a";
				
				if ( key_w == true || key_s == true )
				{
					movelevel ( "x", -3 );
				}
				
				else
				{
					movelevel ( "x", -5 );
				}
			}
		}
		
		if ( key_s == true )
		{
			var s_truey:Int = truey + 9;
			var blocked1 = level.transparencycheck ( truex, s_truey );
			var s_truey:Int = truey + 6;
			var blocked2 = level.transparencycheck ( truex, s_truey );
			var s_truey:Int = truey + 3;
			var blocked3 = level.transparencycheck ( truex, s_truey );
			
			var blocked:Bool = false;
			
			if ( blocked1 == true || blocked2 == true || blocked3 == true )
			{
				blocked = true;
			}
			
			if ( blocked == false && key_w == false )
			{
				activekey = "s";
				
				if ( key_a == true || key_d == true )
				{
					movelevel ( "y", 3 );
				}
				
				else
				{
					movelevel ( "y", 5 );
				}
			}
		}
		
		if ( key_d == true )
		{
			var d_truex:Int = truex + 9;
			var blocked1 = level.transparencycheck ( d_truex, truey );
			var d_truex:Int = truex + 6;
			var blocked2 = level.transparencycheck ( d_truex, truey );
			var d_truex:Int = truex + 3;
			var blocked3 = level.transparencycheck ( d_truex, truey );
			
			var blocked:Bool = false;
			
			if ( blocked1 == true || blocked2 == true || blocked3 == true )
			{
				blocked = true;
			}
			
			if ( blocked == false && key_a == false )
			{
				activekey = "d";
				
				if ( key_w == true || key_s == true )
				{
					movelevel ( "x", 3 );
				}
				
				else
				{
					movelevel ( "x", 5 );
				}
			}
		}
		
		player.updateplayer (activekey);
	}
	
	// actually moves the level around
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
	
	//Checks if an object can be interacted with and returns the closest of those valid targets
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
	
	//creates hardcoded item markers in a quick and dirty way
	function dirtyitemcreate ()
	{
		//define items types with either FURNITURE, NPC, PLANT, ITEM or OBJECTIVE
		var item01:Objects = new Objects (1 , "NPC" , "Karin, de secretaresse, kijkt je behulpzaam aan.");
		item01.x = 1180 - 400;
		item01.y = 725 - 600;
		itemarray.push ( item01 );
		
		var item02:Objects = new Objects (2 , "FURNITURE" , "Een bruine tafel met flyers over scheidingspapieren.");
		item02.x = 980 - 400;
		item02.y = 800 - 600;
		itemarray.push ( item02 );
		
		var item03:Objects = new Objects (3 , "FURNITURE" , "De stoel piept een beetje.");
		item03.x = 1075 - 400;
		item03.y = 675 - 600;
		itemarray.push ( item03 );
		
		var item04:Objects = new Objects (4 , "PLANT" , "De plant mag wel wat water krijgen.");
		item04.x = 960 - 400;
		item04.y = 715 - 600;
		itemarray.push ( item04 );
		
		var item05:Objects = new Objects (5 , "FURNITURE" , "Deze archiefkast ziet er interessant uit!");
		item05.x = 2330 - 400;
		item05.y = 520 - 600;
		itemarray.push ( item05 );
		
		var item06:Objects = new Objects (6 , "NPC" , "De archivist heeft een lange baard en kijkt bezorgd naar zijn bureau.");
		item06.x = 2600 - 400;
		item06.y = 600 - 600;
		itemarray.push ( item06 );
		
		var item07:Objects = new Objects (7 , "FURNITURE" , "De automaat heeft allemaal soorten drankjes.");
		item07.x = 2400 - 400;
		item07.y = 700 - 600;
		itemarray.push ( item07 );
		
		var item08:Objects = new Objects (8 , "NPC" , "De concierge staat al de hele ochtend te werken.");
		item08.x = 1630 - 400;
		item08.y = 960 - 600;
		itemarray.push ( item08 );
		
		var item06:Objects = new Objects (9 , "NPC" , "Deze plant beweegt!");
		item06.x = 950 - 400;
		item06.y = 425 - 600;
		itemarray.push ( item06 );
		
		placeitems ();
	}
	
	//Goes through the itemarray and adds all available item markers to stage
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
	
	function missionhandler (itemid:Int)
	{
		if (miss1 == false)
		{
			if (itemid == 1) //TODO
			{
				miss1 = true;
				ui.modobj1 ("end");
				ui.modobj2 ("start");
				
				ui.notify ("OPDRACHT: Karin zegt dat je het beter aan de archivaris kan vragen, als je hem een folder kan brengen die hij is verloren.");
			}
		}
		
		else if (miss2 == false)
		{
			if (itemid == 5) //TODO
			{
				miss2 = true;
				ui.modobj2 ("end");
				ui.modobj3 ("start");
				
				ui.notify ("OPDRACHT: Je hebt de folder gevonden! Breng hem naar de archivaris toe.");
			}
		}
		
		else if (miss3 == false)
		{
			if (itemid == 6) //TODO
			{
				miss3 = true;
				ui.modobj3 ("end");
				ui.modobj4 ("start");
				
				ui.notify ("OPDRACHT: De archivist zegt dat de concierge het misschien weet in ruil voor een blikje fris.");
			}
		}
		
		else if (miss4 == false)
		{
			if (itemid == 7) //TODO
			{
				miss4 = true;
				ui.modobj4 ("end");
				ui.modobj5 ("start");
				
				ui.notify ("OPDRACHT: Je hebt een blikje fris gevonden! Breng het naar de concierge toe.");
			}
		}
		
		else if (miss5 == false)
		{
			if (itemid == 8) //TODO
			{
				miss5 = true;
				ui.modobj5 ("end");
				ui.modobj6 ("start");
				
				ui.notify ("OPDRACHT: De concierge heeft Tito gezien! Hij verstopt zich in een van de planten!");
			}
		}
		
		else if (miss6 == false)
		{
			if (itemid == 9) //TODO
			{
				Main.getInstance().switchScreen(Main.VICTORY_SCREEN);
			}
		}
	}
}