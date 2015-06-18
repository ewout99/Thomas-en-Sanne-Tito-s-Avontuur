package;

import openfl.display.Sprite;
import openfl.events.Event;
import haxe.Timer;
import openfl.Lib;
import openfl.media.SoundChannel;
import openfl.media.SoundTransform;
import openfl.Assets;
import openfl.Assets.loadSound;

/**
 * ...
 * @author Linnea
 * 
 * music class for the game
 * will repeat a song until public function ends it
 * 
 * 
 */
class Music extends Sprite 
{

	// Importing all songs
	#if flash
	var GameMusic = Assets.getSound("music/GameMusic.mp3");
	var Menu = Assets.getSound("music/Menu.mp3");
	var Winning = Assets.getSound("music/Winning.mp3");
	#elseif html5
	var GameMusic = Assets.getSound("music/GameMusic.ogg");
	var Menu = Assets.getSound("music/Menu.ogg");
	var Winning = Assets.getSound("music/Winning.ogg");
	#end

	// variables for music volume and a soundchannel
	
	var musicVolume:Float;
	var soundChannel:SoundChannel;
	
	public function new() 
	{
		super();
		this.musicVolume = 1 ; // default volume
	}
	
	// function to adjust the volume in this class, gets the musicvolume float as a input.
	
	public function updateMusicVolume (input:Float, inputDirection:String)
	{
		if (inputDirection == "up")
		{ 
			this.musicVolume += input ;
			stopMusic();
			mainMenuMusic();
		}
		if ( inputDirection == "down")
		{
			this.musicVolume -= input ;
			stopMusic();
			mainMenuMusic();
		}	
	}
	
	// function to stop all music
	
	public function stopMusic ()
	{
		soundChannel.stop();
	}
	
	// starts the ingame music (currently not implemented due to not having statisfactory music)
	
	public function gameMusic ()
	
	{
		soundChannel = GameMusic.play();
		soundChannel.soundTransform = new SoundTransform(musicVolume);
		soundChannel.addEventListener(Event.SOUND_COMPLETE, gameMusicRepeat );
	}
	
	// repeats the ingame song
	
	function gameMusicRepeat (event:Event)
	{
		soundChannel = GameMusic.play();
		soundChannel.soundTransform = new SoundTransform(musicVolume);
		soundChannel.addEventListener(Event.SOUND_COMPLETE, gameMusicRepeat );
	}
	
	// starts the menu music
	
	public function mainMenuMusic ()
	
	{
		trace("playing music");
		soundChannel = Menu.play();
		soundChannel.soundTransform = new SoundTransform(musicVolume);
		soundChannel.addEventListener(Event.SOUND_COMPLETE, mainMenuMusicRepeat );
	}
	
	// repeats the menu music
	
	function mainMenuMusicRepeat (event:Event)
	{
		soundChannel = Menu.play();
		soundChannel.soundTransform = new SoundTransform(musicVolume);
		soundChannel.addEventListener(Event.SOUND_COMPLETE, gameMusicRepeat );
		
	}
}