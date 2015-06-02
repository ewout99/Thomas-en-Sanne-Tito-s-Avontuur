package;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.Lib;
import openfl.media.SoundChannel;
import openfl.media.SoundTransform;
import openfl.display.Sprite;
import openfl.Assets;
import openfl.Assets.loadSound;


/**
 * ...
 * @author Linnea
 * 
 * 
 */
class Sound extends Sprite 
{

	// Importing all assests
	
	var buttonclick = Assets.getSound("audio/Buttonclick.mp3");
	var clock = Assets.getSound("audio/Clock.mp3");
	var closedoor = Assets.getSound("audio/Closedoor.mp3");
	var closedrawer = Assets.getSound("audio/Closedrawer.mp3");
	var coin = Assets.getSound("audio/Coin.mp3");
	var click = Assets.getSound("audio/Click3.wav");
	var hintpopup = Assets.getSound("audio/Hintpopup.mp3");
	var huh = Assets.getSound("audio/Huh.mp3");
	var objectivecomplete = Assets.getSound("audio/Objectivecomplete.mp3");
	var objectfound = Assets.getSound("audio/Objectfound.mp3");
	var objectfound2 = Assets.getSound("audio/Objectfound.mp3");
	var opendoor = Assets.getSound("audio/Opendoor.mp3");
	var opendrawer = Assets.getSound("audio/Opendrawer.mp3");
	var papers = Assets.getSound("audio/Papers.mp3");

	
	// creating the needed variables, one volume, and 2 sepparate sound channels.
	
	var soundVolume: Float;
	var ambChannel:SoundChannel;
	var channel:SoundChannel;
	
	public function new() 
	{
		super();
		this.soundVolume = 1 ; // default sound volume
	}
	
	// Function that gets called with a string input, this will choose the sound it will play and activate functions acourdinly.
	// When there is only one sound it will play directly form this function.
	

	//public function testingSound ()
	//{
		//channel = beep.play( 0, 0, new SoundTransform(soundVolume ) );
	//}
	
	// function to adjust the volume in this class, gets the soundvolume float as a input.
	
	public function updateSoundVolume (input:Float)
	{
		this.soundVolume = input ;
	}

	

	
}