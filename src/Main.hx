package ;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.Lib;
import openfl.system.System;

/**
 * ...
 * @author Ezzz
 */

class Main extends Sprite 
{
	var inited:Bool;
	// Varbiables for msic and sound calls
	public var music:Music = new Music();
	public var sound:Sound = new Sound();
	
	// Variables for Screen switching
	public static inline var MAIN_MENU_SCREEN:String = "main menu screen";
	public static inline var CHAR_SELECT_SCREEN:String = "char select screen";
	public static inline var CONTACT_SCREEN:String = "contact screen";
	public static inline var LEVEL_SELECT_SCREEN:String = "level select screen";
	public static inline var OPTIONS_SCREEN:String = "options screen";
	public static inline var GAME_SCREEN:String = "game screen";
	public static inline var VICTORY_SCREEN:String = "victory screen";
	public static inline var CURRENT_GAME:String = "current game";
	var currentScreen:Sprite;
	
	// Variables for the currentgame
	public var currentChar:Int = 0;
	public var currentLevel:Int = 0;
	
	// Variable to switch back to the menu and the game
	public var currentGame:Game;
	
	// Singelton stuff
	public static var instance:Main;
	
	
	function resize(e) 
	{
		if (!inited) init();
		// else (resize or orientation change)
	}
	
	function init() 
	{
		if (inited) return;
		inited = true;
		instance = this;
		switchScreen (Main.MAIN_MENU_SCREEN);
		addChild (sound);
		addChild (music);
	}
	
	/**
	 * 
	 * Singleton design pattern.
	 */
	
	public static function getInstance():Main
	{
		return instance;
	}
	
	/**
	 * Remove current screen
	 * Switch to requested screen
	 */
	
	public function switchScreen (toScreen:String)
	{
		if ( currentScreen != null )
		{
			removeChild (currentScreen);
			
			music.stopMusic ();
		}
		
		switch ( toScreen)
		{
			case Main.MAIN_MENU_SCREEN:
				currentScreen = new MainMenu();
			case Main.CONTACT_SCREEN:
				currentScreen = new Contact();
			case Main.CHAR_SELECT_SCREEN:
				currentScreen = new CharachterSelect();
			case Main.LEVEL_SELECT_SCREEN:
				currentScreen = new LevelSelect();
			case Main.OPTIONS_SCREEN:
				currentScreen = new Options();
			case Main.GAME_SCREEN:
				currentScreen = new Game();
			case Main.VICTORY_SCREEN:
				currentScreen = new Victory();
			case Main.CURRENT_GAME:
				currentScreen = currentGame;
		}
		addChild (currentScreen);
	}
	
	
	
	public function new() 
	{
		super();	
		addEventListener(Event.ADDED_TO_STAGE, added);
	}

	
	function added(e) 
	{
		removeEventListener(Event.ADDED_TO_STAGE, added);
		stage.addEventListener(Event.RESIZE, resize);
		#if ios
		haxe.Timer.delay(init, 100); // iOS 6
		#else
		init();
		#end
	}
	
	public static function main() 
	{
		// static entry point
		Lib.current.stage.align = flash.display.StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = flash.display.StageScaleMode.EXACT_FIT;
		Lib.current.addChild(new Main());
	}
	
	// Exit fuction for the game
	public function exit()
	{
		System.exit(0);
	}
}
