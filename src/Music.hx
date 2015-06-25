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
	var GameMusic = Assets.getSound("music/gamemusic.mp3");
	var Menu = Assets.getSound("music/menumusic.mp3");
	var Winning = Assets.getSound("music/winningmusic.mp3");
	#elseif html5
	var GameMusic = Assets.getSound("music/gamemusic.ogg");
	var Menu = Assets.getSound("music/menumusic.ogg");
	var Winning = Assets.getSound("music/winningmusic.ogg");
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
		#if html
		soundChannel.stop();
		#elseif flash
		soundChannel.stop ();
		#end
	}
	
	// starts the ingame music (currently not implemented due to not having statisfactory music)
	
	public function gameMusic ()
	
	{
		#if html
		soundChannel = GameMusic.play();
		soundChannel.soundTransform = new SoundTransform(musicVolume);
		soundChannel.addEventListener(Event.SOUND_COMPLETE, gameMusicRepeat );
		#end
	}
	
	// repeats the ingame song
	
	function gameMusicRepeat (event:Event)
	{
		#if html
		soundChannel = GameMusic.play();
		soundChannel.soundTransform = new SoundTransform(musicVolume);
		soundChannel.addEventListener(Event.SOUND_COMPLETE, gameMusicRepeat );
		#end
	}
	
	// starts the menu music
	
	public function mainMenuMusic ()
	
	{
		#if html
		trace("playing music");
		soundChannel = Menu.play();
		soundChannel.soundTransform = new SoundTransform(musicVolume);
		soundChannel.addEventListener(Event.SOUND_COMPLETE, mainMenuMusicRepeat );
		#end
	}
	
	// repeats the menu music
	
	function mainMenuMusicRepeat (event:Event)
	{
		#if html
		soundChannel = Menu.play();
		soundChannel.soundTransform = new SoundTransform(musicVolume);
		soundChannel.addEventListener(Event.SOUND_COMPLETE, gameMusicRepeat );
		#end
	}
}