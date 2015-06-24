package;

import openfl.display.Sprite;
import openfl.events.Event;
import haxe.Timer;
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
	#if flash
	var buttonclick = Assets.getSound("audio/Buttonclick.mp3");
	var clock = Assets.getSound("audio/Clock.mp3");
	var closedoor = Assets.getSound("audio/Closedoor.mp3");
	var closedrawer = Assets.getSound("audio/Closedrawer.mp3");
	var coin = Assets.getSound("audio/Coin.mp3");
	var hintpopup = Assets.getSound("audio/Hintpopup.mp3");
	var huh = Assets.getSound("audio/Huh.mp3");
	var objectivecomplete = Assets.getSound("audio/Objectivecomplete.mp3");
	var objectfound = Assets.getSound("audio/Objectfound.mp3");
	var objectfound2 = Assets.getSound("audio/Objectfound.mp3");
	var opendoor = Assets.getSound("audio/Opendoor.mp3");
	var opendrawer = Assets.getSound("audio/Opendrawer.mp3");
	var papers = Assets.getSound("audio/Papers.mp3");
	#elseif html5
	var buttonclick = Assets.getSound("audio/Buttonclick.ogg");
	var clock = Assets.getSound("audio/Clock.ogg");
	var closedoor = Assets.getSound("audio/Closedoor.ogg");
	var closedrawer = Assets.getSound("audio/Closedrawer.ogg");
	var coin = Assets.getSound("audio/Coin.ogg");
	var hintpopup = Assets.getSound("audio/Hintpopup.ogg");
	var huh = Assets.getSound("audio/Huh.ogg");
	var objectivecomplete = Assets.getSound("audio/Objectivecomplete.ogg");
	var objectfound = Assets.getSound("audio/Objectfound.ogg");
	var objectfound2 = Assets.getSound("audio/Objectfound.ogg");
	var opendoor = Assets.getSound("audio/Opendoor.ogg");
	var opendrawer = Assets.getSound("audio/Opendrawer.ogg");
	var papers = Assets.getSound("audio/Papers.ogg");
	#end
	
	// creating the needed variables, one volume, and 2 sepparate sound channels.
	
	var soundVolume: Float;
	var ambChannel:SoundChannel;
	var channel:SoundChannel;
	
	public function new() 
	{
		super();
		this.soundVolume = 1 ; // default sound volume
		importSound();
	}
	
	// temp funciton used for debugging
	public function importSound()
	{
	
	}
	
	public function playSound(input:String)
	{
		switch(input)
		{
			case ("click"):
				channel = buttonclick.play();
				channel.soundTransform = new SoundTransform(soundVolume);
		}
	}
	
	//function to adjust the volume in this class, gets the soundvolume float as a input.
	
	public function updateSoundVolume (input:Float, inputDirection:String)
	{
		if (inputDirection == "up")
		{ 
			this.soundVolume += input ;
		}
		if ( inputDirection == "down")
		{
			this.soundVolume -= input ;
		}	
	}
	

	
}