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
 * music class for the game
 * will repeat a song until public function ends it
 */
class Music extends Sprite 
{
	// Importing all songs
	#if flash
	public var gameMusic1 = Assets.getSound("music/gameMusic.mp3");
	public var menuMusic1 = Assets.getSound("music/menuMusic.mp3");
	public var winning1 = Assets.getSound("music/winningMusic.mp3");
	#elseif html5
	public var gameMusic1 = Assets.getSound("music/gameMusic.ogg");
	public var menuMusic1 = Assets.getSound("music/menuMusic.ogg");
	public var Winning1 = Assets.getSound("music/winningMusic.ogg");
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
		#if html5
		soundChannel.stop();
		#elseif flash
		soundChannel.stop ();
		#end
	}
	
	// starts the ingame music (currently not implemented due to not having statisfactory music)
	public function gameMusic ()
	{
		#if html5
		soundChannel = gameMusic1.play();
		soundChannel.soundTransform = new SoundTransform(musicVolume);
		soundChannel.addEventListener(Event.SOUND_COMPLETE, gameMusicRepeat );
		#elseif flash
		soundChannel = gameMusic1.play();
		soundChannel.soundTransform = new SoundTransform(musicVolume);
		soundChannel.addEventListener(Event.SOUND_COMPLETE, gameMusicRepeat );
		#end
	}
	
	// repeats the ingame song
	
	function gameMusicRepeat (event:Event)
	{
		#if html5
		soundChannel = gameMusic1.play();
		soundChannel.soundTransform = new SoundTransform(musicVolume);
		soundChannel.addEventListener(Event.SOUND_COMPLETE, gameMusicRepeat );
		#elseif flash
		soundChannel = gameMusic1.play();
		soundChannel.soundTransform = new SoundTransform(musicVolume);
		soundChannel.addEventListener(Event.SOUND_COMPLETE, gameMusicRepeat );
		#end
	}
	
	// starts the menuMusic music
	public function mainMenuMusic ()
	{
		#if html5
		soundChannel = menuMusic1.play();
		soundChannel.soundTransform = new SoundTransform(musicVolume);
		soundChannel.addEventListener(Event.SOUND_COMPLETE, mainMenuMusicRepeat );
		#elseif flash
		soundChannel = menuMusic1.play();
		soundChannel.soundTransform = new SoundTransform(musicVolume);
		soundChannel.addEventListener(Event.SOUND_COMPLETE, mainMenuMusicRepeat );
		#end
	}
	
	// repeats the menuMusic music
	function mainMenuMusicRepeat (event:Event)
	{
		#if html5
		soundChannel = menuMusic1.play();
		soundChannel.soundTransform = new SoundTransform(musicVolume);
		soundChannel.addEventListener(Event.SOUND_COMPLETE, gameMusicRepeat );
		#elseif flash
		soundChannel = menuMusic1.play();
		soundChannel.soundTransform = new SoundTransform(musicVolume);
		soundChannel.addEventListener(Event.SOUND_COMPLETE, gameMusicRepeat );
		#end
	}
}