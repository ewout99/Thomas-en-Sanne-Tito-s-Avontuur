package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Preloader;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.text.Font;
import lime.utils.ByteArray;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if flash
		
		path.set ("img/Background.png", "img/Background.png");
		type.set ("img/Background.png", AssetType.IMAGE);
		path.set ("img/Background_2.png", "img/Background_2.png");
		type.set ("img/Background_2.png", AssetType.IMAGE);
		path.set ("img/bottombutton.png", "img/bottombutton.png");
		type.set ("img/bottombutton.png", AssetType.IMAGE);
		path.set ("img/bottombuttonhover.png", "img/bottombuttonhover.png");
		type.set ("img/bottombuttonhover.png", AssetType.IMAGE);
		path.set ("img/Button.png", "img/Button.png");
		type.set ("img/Button.png", AssetType.IMAGE);
		path.set ("img/ButtonHover.png", "img/ButtonHover.png");
		type.set ("img/ButtonHover.png", AssetType.IMAGE);
		path.set ("img/Characterbackground.png", "img/Characterbackground.png");
		type.set ("img/Characterbackground.png", AssetType.IMAGE);
		path.set ("img/Contactbackground.png", "img/Contactbackground.png");
		type.set ("img/Contactbackground.png", AssetType.IMAGE);
		path.set ("img/Hint.png", "img/Hint.png");
		type.set ("img/Hint.png", AssetType.IMAGE);
		path.set ("img/Hinthover.png", "img/Hinthover.png");
		type.set ("img/Hinthover.png", AssetType.IMAGE);
		path.set ("img/level/backups_old/collision - Copy.png", "img/level/backups_old/collision - Copy.png");
		type.set ("img/level/backups_old/collision - Copy.png", AssetType.IMAGE);
		path.set ("img/level/backups_old/floorplan - Copy.png", "img/level/backups_old/floorplan - Copy.png");
		type.set ("img/level/backups_old/floorplan - Copy.png", AssetType.IMAGE);
		path.set ("img/level/backups_old/floorplan2.png", "img/level/backups_old/floorplan2.png");
		type.set ("img/level/backups_old/floorplan2.png", AssetType.IMAGE);
		path.set ("img/level/backups_old/floorwalls - Copy.png", "img/level/backups_old/floorwalls - Copy.png");
		type.set ("img/level/backups_old/floorwalls - Copy.png", AssetType.IMAGE);
		path.set ("img/level/backups_old/floorwalls2.png", "img/level/backups_old/floorwalls2.png");
		type.set ("img/level/backups_old/floorwalls2.png", AssetType.IMAGE);
		path.set ("img/level/collision.png", "img/level/collision.png");
		type.set ("img/level/collision.png", AssetType.IMAGE);
		path.set ("img/level/floorplan.png", "img/level/floorplan.png");
		type.set ("img/level/floorplan.png", AssetType.IMAGE);
		path.set ("img/level/floorwalls.png", "img/level/floorwalls.png");
		type.set ("img/level/floorwalls.png", AssetType.IMAGE);
		path.set ("img/Levelkiezen.png", "img/Levelkiezen.png");
		type.set ("img/Levelkiezen.png", AssetType.IMAGE);
		path.set ("img/marker_1.png", "img/marker_1.png");
		type.set ("img/marker_1.png", AssetType.IMAGE);
		path.set ("img/marker_2.png", "img/marker_2.png");
		type.set ("img/marker_2.png", AssetType.IMAGE);
		path.set ("img/marker_3.png", "img/marker_3.png");
		type.set ("img/marker_3.png", AssetType.IMAGE);
		path.set ("img/marker_4.png", "img/marker_4.png");
		type.set ("img/marker_4.png", AssetType.IMAGE);
		path.set ("img/marker_5.png", "img/marker_5.png");
		type.set ("img/marker_5.png", AssetType.IMAGE);
		path.set ("img/Menubackground.png", "img/Menubackground.png");
		type.set ("img/Menubackground.png", AssetType.IMAGE);
		path.set ("img/middlebutton.png", "img/middlebutton.png");
		type.set ("img/middlebutton.png", AssetType.IMAGE);
		path.set ("img/middlebuttonhover.png", "img/middlebuttonhover.png");
		type.set ("img/middlebuttonhover.png", AssetType.IMAGE);
		path.set ("img/objectives/objective_1.png", "img/objectives/objective_1.png");
		type.set ("img/objectives/objective_1.png", AssetType.IMAGE);
		path.set ("img/objectives/objective_1_alt.png", "img/objectives/objective_1_alt.png");
		type.set ("img/objectives/objective_1_alt.png", AssetType.IMAGE);
		path.set ("img/objectives/objective_2.png", "img/objectives/objective_2.png");
		type.set ("img/objectives/objective_2.png", AssetType.IMAGE);
		path.set ("img/objectives/objective_2_alt.png", "img/objectives/objective_2_alt.png");
		type.set ("img/objectives/objective_2_alt.png", AssetType.IMAGE);
		path.set ("img/objectives/objective_3.png", "img/objectives/objective_3.png");
		type.set ("img/objectives/objective_3.png", AssetType.IMAGE);
		path.set ("img/objectives/objective_3_alt.png", "img/objectives/objective_3_alt.png");
		type.set ("img/objectives/objective_3_alt.png", AssetType.IMAGE);
		path.set ("img/objectives/objective_4.png", "img/objectives/objective_4.png");
		type.set ("img/objectives/objective_4.png", AssetType.IMAGE);
		path.set ("img/objectives/objective_4_alt.png", "img/objectives/objective_4_alt.png");
		type.set ("img/objectives/objective_4_alt.png", AssetType.IMAGE);
		path.set ("img/objectives/objective_5.png", "img/objectives/objective_5.png");
		type.set ("img/objectives/objective_5.png", AssetType.IMAGE);
		path.set ("img/objectives/objective_5_alt.png", "img/objectives/objective_5_alt.png");
		type.set ("img/objectives/objective_5_alt.png", AssetType.IMAGE);
		path.set ("img/objectives/objective_6.png", "img/objectives/objective_6.png");
		type.set ("img/objectives/objective_6.png", AssetType.IMAGE);
		path.set ("img/objectives/objective_6_alt.png", "img/objectives/objective_6_alt.png");
		type.set ("img/objectives/objective_6_alt.png", AssetType.IMAGE);
		path.set ("img/Objectives.png", "img/Objectives.png");
		type.set ("img/Objectives.png", AssetType.IMAGE);
		path.set ("img/optionbutton.png", "img/optionbutton.png");
		type.set ("img/optionbutton.png", AssetType.IMAGE);
		path.set ("img/optionbutton_alt.png", "img/optionbutton_alt.png");
		type.set ("img/optionbutton_alt.png", AssetType.IMAGE);
		path.set ("img/Optionsbackground.png", "img/Optionsbackground.png");
		type.set ("img/Optionsbackground.png", AssetType.IMAGE);
		path.set ("img/Progressbarpiece.png", "img/Progressbarpiece.png");
		type.set ("img/Progressbarpiece.png", AssetType.IMAGE);
		path.set ("img/Progressie.png", "img/Progressie.png");
		type.set ("img/Progressie.png", AssetType.IMAGE);
		path.set ("img/Progressie_2.png", "img/Progressie_2.png");
		type.set ("img/Progressie_2.png", AssetType.IMAGE);
		path.set ("img/sanne/back_1.png", "img/sanne/back_1.png");
		type.set ("img/sanne/back_1.png", AssetType.IMAGE);
		path.set ("img/sanne/back_2.png", "img/sanne/back_2.png");
		type.set ("img/sanne/back_2.png", AssetType.IMAGE);
		path.set ("img/sanne/back_3.png", "img/sanne/back_3.png");
		type.set ("img/sanne/back_3.png", AssetType.IMAGE);
		path.set ("img/sanne/back_4.png", "img/sanne/back_4.png");
		type.set ("img/sanne/back_4.png", AssetType.IMAGE);
		path.set ("img/sanne/front_1.png", "img/sanne/front_1.png");
		type.set ("img/sanne/front_1.png", AssetType.IMAGE);
		path.set ("img/sanne/front_2.png", "img/sanne/front_2.png");
		type.set ("img/sanne/front_2.png", AssetType.IMAGE);
		path.set ("img/sanne/front_3.png", "img/sanne/front_3.png");
		type.set ("img/sanne/front_3.png", AssetType.IMAGE);
		path.set ("img/sanne/front_4.png", "img/sanne/front_4.png");
		type.set ("img/sanne/front_4.png", AssetType.IMAGE);
		path.set ("img/sanne/left_1.png", "img/sanne/left_1.png");
		type.set ("img/sanne/left_1.png", AssetType.IMAGE);
		path.set ("img/sanne/left_2.png", "img/sanne/left_2.png");
		type.set ("img/sanne/left_2.png", AssetType.IMAGE);
		path.set ("img/sanne/left_3.png", "img/sanne/left_3.png");
		type.set ("img/sanne/left_3.png", AssetType.IMAGE);
		path.set ("img/sanne/left_4.png", "img/sanne/left_4.png");
		type.set ("img/sanne/left_4.png", AssetType.IMAGE);
		path.set ("img/sanne/right_1.png", "img/sanne/right_1.png");
		type.set ("img/sanne/right_1.png", AssetType.IMAGE);
		path.set ("img/sanne/right_2.png", "img/sanne/right_2.png");
		type.set ("img/sanne/right_2.png", AssetType.IMAGE);
		path.set ("img/sanne/right_3.png", "img/sanne/right_3.png");
		type.set ("img/sanne/right_3.png", AssetType.IMAGE);
		path.set ("img/sanne/right_4.png", "img/sanne/right_4.png");
		type.set ("img/sanne/right_4.png", AssetType.IMAGE);
		path.set ("img/sanneicon.png", "img/sanneicon.png");
		type.set ("img/sanneicon.png", AssetType.IMAGE);
		path.set ("img/speech bubble big left.png", "img/speech bubble big left.png");
		type.set ("img/speech bubble big left.png", AssetType.IMAGE);
		path.set ("img/speech bubble big right.png", "img/speech bubble big right.png");
		type.set ("img/speech bubble big right.png", AssetType.IMAGE);
		path.set ("img/speech bubble small left.png", "img/speech bubble small left.png");
		type.set ("img/speech bubble small left.png", AssetType.IMAGE);
		path.set ("img/Speech bubble small right.png", "img/Speech bubble small right.png");
		type.set ("img/Speech bubble small right.png", AssetType.IMAGE);
		path.set ("img/thomas/back_1.png", "img/thomas/back_1.png");
		type.set ("img/thomas/back_1.png", AssetType.IMAGE);
		path.set ("img/thomas/back_2.png", "img/thomas/back_2.png");
		type.set ("img/thomas/back_2.png", AssetType.IMAGE);
		path.set ("img/thomas/back_3.png", "img/thomas/back_3.png");
		type.set ("img/thomas/back_3.png", AssetType.IMAGE);
		path.set ("img/thomas/back_4.png", "img/thomas/back_4.png");
		type.set ("img/thomas/back_4.png", AssetType.IMAGE);
		path.set ("img/thomas/front_1.png", "img/thomas/front_1.png");
		type.set ("img/thomas/front_1.png", AssetType.IMAGE);
		path.set ("img/thomas/front_2.png", "img/thomas/front_2.png");
		type.set ("img/thomas/front_2.png", AssetType.IMAGE);
		path.set ("img/thomas/front_3.png", "img/thomas/front_3.png");
		type.set ("img/thomas/front_3.png", AssetType.IMAGE);
		path.set ("img/thomas/front_4.png", "img/thomas/front_4.png");
		type.set ("img/thomas/front_4.png", AssetType.IMAGE);
		path.set ("img/thomas/left_1.png", "img/thomas/left_1.png");
		type.set ("img/thomas/left_1.png", AssetType.IMAGE);
		path.set ("img/thomas/left_2.png", "img/thomas/left_2.png");
		type.set ("img/thomas/left_2.png", AssetType.IMAGE);
		path.set ("img/thomas/left_3.png", "img/thomas/left_3.png");
		type.set ("img/thomas/left_3.png", AssetType.IMAGE);
		path.set ("img/thomas/left_4.png", "img/thomas/left_4.png");
		type.set ("img/thomas/left_4.png", AssetType.IMAGE);
		path.set ("img/thomas/old-extra/back walking.png", "img/thomas/old-extra/back walking.png");
		type.set ("img/thomas/old-extra/back walking.png", AssetType.IMAGE);
		path.set ("img/thomas/old-extra/back.png", "img/thomas/old-extra/back.png");
		type.set ("img/thomas/old-extra/back.png", AssetType.IMAGE);
		path.set ("img/thomas/old-extra/front walking.png", "img/thomas/old-extra/front walking.png");
		type.set ("img/thomas/old-extra/front walking.png", AssetType.IMAGE);
		path.set ("img/thomas/old-extra/front.png", "img/thomas/old-extra/front.png");
		type.set ("img/thomas/old-extra/front.png", AssetType.IMAGE);
		path.set ("img/thomas/old-extra/left side walking.png", "img/thomas/old-extra/left side walking.png");
		type.set ("img/thomas/old-extra/left side walking.png", AssetType.IMAGE);
		path.set ("img/thomas/old-extra/leftback.png", "img/thomas/old-extra/leftback.png");
		type.set ("img/thomas/old-extra/leftback.png", AssetType.IMAGE);
		path.set ("img/thomas/old-extra/leftfront.png", "img/thomas/old-extra/leftfront.png");
		type.set ("img/thomas/old-extra/leftfront.png", AssetType.IMAGE);
		path.set ("img/thomas/old-extra/rightback.png", "img/thomas/old-extra/rightback.png");
		type.set ("img/thomas/old-extra/rightback.png", AssetType.IMAGE);
		path.set ("img/thomas/old-extra/rightfront.png", "img/thomas/old-extra/rightfront.png");
		type.set ("img/thomas/old-extra/rightfront.png", AssetType.IMAGE);
		path.set ("img/thomas/old-extra/side right walking.png", "img/thomas/old-extra/side right walking.png");
		type.set ("img/thomas/old-extra/side right walking.png", AssetType.IMAGE);
		path.set ("img/thomas/old-extra/sideleft.png", "img/thomas/old-extra/sideleft.png");
		type.set ("img/thomas/old-extra/sideleft.png", AssetType.IMAGE);
		path.set ("img/thomas/old-extra/sideright.png", "img/thomas/old-extra/sideright.png");
		type.set ("img/thomas/old-extra/sideright.png", AssetType.IMAGE);
		path.set ("img/thomas/old-extra/tiles.png", "img/thomas/old-extra/tiles.png");
		type.set ("img/thomas/old-extra/tiles.png", AssetType.IMAGE);
		path.set ("img/thomas/right_1.png", "img/thomas/right_1.png");
		type.set ("img/thomas/right_1.png", AssetType.IMAGE);
		path.set ("img/thomas/right_2.png", "img/thomas/right_2.png");
		type.set ("img/thomas/right_2.png", AssetType.IMAGE);
		path.set ("img/thomas/right_3.png", "img/thomas/right_3.png");
		type.set ("img/thomas/right_3.png", AssetType.IMAGE);
		path.set ("img/thomas/right_4.png", "img/thomas/right_4.png");
		type.set ("img/thomas/right_4.png", AssetType.IMAGE);
		path.set ("img/thomasicon.png", "img/thomasicon.png");
		type.set ("img/thomasicon.png", AssetType.IMAGE);
		path.set ("img/topbutton.png", "img/topbutton.png");
		type.set ("img/topbutton.png", AssetType.IMAGE);
		path.set ("img/topbuttonhover.png", "img/topbuttonhover.png");
		type.set ("img/topbuttonhover.png", AssetType.IMAGE);
		path.set ("img/Victorybackground.png", "img/Victorybackground.png");
		type.set ("img/Victorybackground.png", AssetType.IMAGE);
		path.set ("audio/Buttonclick.mp3", "audio/Buttonclick.mp3");
		type.set ("audio/Buttonclick.mp3", AssetType.MUSIC);
		path.set ("audio/Buttonclick.ogg", "audio/Buttonclick.ogg");
		type.set ("audio/Buttonclick.ogg", AssetType.SOUND);
		path.set ("audio/Clock.mp3", "audio/Clock.mp3");
		type.set ("audio/Clock.mp3", AssetType.MUSIC);
		path.set ("audio/Clock.ogg", "audio/Clock.ogg");
		type.set ("audio/Clock.ogg", AssetType.SOUND);
		path.set ("audio/Closedoor.mp3", "audio/Closedoor.mp3");
		type.set ("audio/Closedoor.mp3", AssetType.MUSIC);
		path.set ("audio/Closedoor.ogg", "audio/Closedoor.ogg");
		type.set ("audio/Closedoor.ogg", AssetType.SOUND);
		path.set ("audio/Closedrawer.mp3", "audio/Closedrawer.mp3");
		type.set ("audio/Closedrawer.mp3", AssetType.MUSIC);
		path.set ("audio/Closedrawer.ogg", "audio/Closedrawer.ogg");
		type.set ("audio/Closedrawer.ogg", AssetType.SOUND);
		path.set ("audio/Coin.mp3", "audio/Coin.mp3");
		type.set ("audio/Coin.mp3", AssetType.MUSIC);
		path.set ("audio/Coin.ogg", "audio/Coin.ogg");
		type.set ("audio/Coin.ogg", AssetType.SOUND);
		path.set ("audio/Hintpopup.mp3", "audio/Hintpopup.mp3");
		type.set ("audio/Hintpopup.mp3", AssetType.MUSIC);
		path.set ("audio/Hintpopup.ogg", "audio/Hintpopup.ogg");
		type.set ("audio/Hintpopup.ogg", AssetType.SOUND);
		path.set ("audio/Huh.mp3", "audio/Huh.mp3");
		type.set ("audio/Huh.mp3", AssetType.MUSIC);
		path.set ("audio/Huh.ogg", "audio/Huh.ogg");
		type.set ("audio/Huh.ogg", AssetType.SOUND);
		path.set ("audio/Menu.ogg", "audio/Menu.ogg");
		type.set ("audio/Menu.ogg", AssetType.SOUND);
		path.set ("audio/Objectfound.mp3", "audio/Objectfound.mp3");
		type.set ("audio/Objectfound.mp3", AssetType.MUSIC);
		path.set ("audio/Objectfound.ogg", "audio/Objectfound.ogg");
		type.set ("audio/Objectfound.ogg", AssetType.SOUND);
		path.set ("audio/Objectfound2.mp3", "audio/Objectfound2.mp3");
		type.set ("audio/Objectfound2.mp3", AssetType.MUSIC);
		path.set ("audio/Objectfound2.ogg", "audio/Objectfound2.ogg");
		type.set ("audio/Objectfound2.ogg", AssetType.SOUND);
		path.set ("audio/Objectivecomplete.mp3", "audio/Objectivecomplete.mp3");
		type.set ("audio/Objectivecomplete.mp3", AssetType.MUSIC);
		path.set ("audio/Objectivecomplete.ogg", "audio/Objectivecomplete.ogg");
		type.set ("audio/Objectivecomplete.ogg", AssetType.SOUND);
		path.set ("audio/Opendoor.mp3", "audio/Opendoor.mp3");
		type.set ("audio/Opendoor.mp3", AssetType.MUSIC);
		path.set ("audio/Opendoor.ogg", "audio/Opendoor.ogg");
		type.set ("audio/Opendoor.ogg", AssetType.SOUND);
		path.set ("audio/Opendrawer.mp3", "audio/Opendrawer.mp3");
		type.set ("audio/Opendrawer.mp3", AssetType.MUSIC);
		path.set ("audio/Opendrawer.ogg", "audio/Opendrawer.ogg");
		type.set ("audio/Opendrawer.ogg", AssetType.SOUND);
		path.set ("audio/Papers.mp3", "audio/Papers.mp3");
		type.set ("audio/Papers.mp3", AssetType.MUSIC);
		path.set ("audio/Papers.ogg", "audio/Papers.ogg");
		type.set ("audio/Papers.ogg", AssetType.SOUND);
		path.set ("music/gamemusic.mp3", "music/gamemusic.mp3");
		type.set ("music/gamemusic.mp3", AssetType.MUSIC);
		path.set ("music/gamemusic.ogg", "music/gamemusic.ogg");
		type.set ("music/gamemusic.ogg", AssetType.MUSIC);
		path.set ("music/menumusic.mp3", "music/menumusic.mp3");
		type.set ("music/menumusic.mp3", AssetType.MUSIC);
		path.set ("music/menumusic.ogg", "music/menumusic.ogg");
		type.set ("music/menumusic.ogg", AssetType.SOUND);
		path.set ("music/Old/GameMusic.mp3", "music/Old/GameMusic.mp3");
		type.set ("music/Old/GameMusic.mp3", AssetType.MUSIC);
		path.set ("music/Old/GameMusic.ogg", "music/Old/GameMusic.ogg");
		type.set ("music/Old/GameMusic.ogg", AssetType.SOUND);
		path.set ("music/Old/Menu.mp3", "music/Old/Menu.mp3");
		type.set ("music/Old/Menu.mp3", AssetType.MUSIC);
		path.set ("music/Old/Menu.ogg", "music/Old/Menu.ogg");
		type.set ("music/Old/Menu.ogg", AssetType.SOUND);
		path.set ("music/Old/Winning.mp3", "music/Old/Winning.mp3");
		type.set ("music/Old/Winning.mp3", AssetType.MUSIC);
		path.set ("music/winningmusic.mp3", "music/winningmusic.mp3");
		type.set ("music/winningmusic.mp3", AssetType.MUSIC);
		path.set ("music/winningmusic.ogg", "music/winningmusic.ogg");
		type.set ("music/winningmusic.ogg", AssetType.MUSIC);
		
		
		#elseif html5
		
		var id;
		id = "img/Background.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Background_2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/bottombutton.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/bottombuttonhover.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Button.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/ButtonHover.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Characterbackground.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Contactbackground.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Hint.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Hinthover.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/level/backups_old/collision - Copy.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/level/backups_old/floorplan - Copy.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/level/backups_old/floorplan2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/level/backups_old/floorwalls - Copy.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/level/backups_old/floorwalls2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/level/collision.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/level/floorplan.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/level/floorwalls.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Levelkiezen.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/marker_1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/marker_2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/marker_3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/marker_4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/marker_5.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Menubackground.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/middlebutton.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/middlebuttonhover.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/objectives/objective_1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/objectives/objective_1_alt.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/objectives/objective_2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/objectives/objective_2_alt.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/objectives/objective_3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/objectives/objective_3_alt.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/objectives/objective_4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/objectives/objective_4_alt.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/objectives/objective_5.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/objectives/objective_5_alt.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/objectives/objective_6.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/objectives/objective_6_alt.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Objectives.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/optionbutton.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/optionbutton_alt.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Optionsbackground.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Progressbarpiece.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Progressie.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Progressie_2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/sanne/back_1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/sanne/back_2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/sanne/back_3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/sanne/back_4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/sanne/front_1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/sanne/front_2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/sanne/front_3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/sanne/front_4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/sanne/left_1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/sanne/left_2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/sanne/left_3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/sanne/left_4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/sanne/right_1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/sanne/right_2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/sanne/right_3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/sanne/right_4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/sanneicon.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/speech bubble big left.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/speech bubble big right.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/speech bubble small left.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Speech bubble small right.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/thomas/back_1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/thomas/back_2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/thomas/back_3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/thomas/back_4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/thomas/front_1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/thomas/front_2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/thomas/front_3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/thomas/front_4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/thomas/left_1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/thomas/left_2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/thomas/left_3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/thomas/left_4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/thomas/old-extra/back walking.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/thomas/old-extra/back.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/thomas/old-extra/front walking.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/thomas/old-extra/front.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/thomas/old-extra/left side walking.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/thomas/old-extra/leftback.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/thomas/old-extra/leftfront.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/thomas/old-extra/rightback.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/thomas/old-extra/rightfront.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/thomas/old-extra/side right walking.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/thomas/old-extra/sideleft.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/thomas/old-extra/sideright.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/thomas/old-extra/tiles.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/thomas/right_1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/thomas/right_2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/thomas/right_3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/thomas/right_4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/thomasicon.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/topbutton.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/topbuttonhover.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/Victorybackground.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "audio/Buttonclick.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "audio/Buttonclick.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "audio/Clock.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "audio/Clock.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "audio/Closedoor.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "audio/Closedoor.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "audio/Closedrawer.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "audio/Closedrawer.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "audio/Coin.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "audio/Coin.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "audio/Hintpopup.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "audio/Hintpopup.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "audio/Huh.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "audio/Huh.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "audio/Menu.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "audio/Objectfound.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "audio/Objectfound.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "audio/Objectfound2.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "audio/Objectfound2.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "audio/Objectivecomplete.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "audio/Objectivecomplete.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "audio/Opendoor.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "audio/Opendoor.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "audio/Opendrawer.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "audio/Opendrawer.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "audio/Papers.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "audio/Papers.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "music/gamemusic.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "music/gamemusic.ogg";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "music/menumusic.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "music/menumusic.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "music/Old/GameMusic.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "music/Old/GameMusic.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "music/Old/Menu.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "music/Old/Menu.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "music/Old/Winning.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "music/winningmusic.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "music/winningmusic.ogg";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		
		
		var assetsPrefix = ApplicationMain.config.assetsPrefix;
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if openfl
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		#end
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						if (eventCallback != null) {
							
							eventCallback (this, "change");
							
						}
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), ByteArray));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return cast (Type.createInstance (className.get (id), []), ByteArray);
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return bitmapData.getPixels (bitmapData.rect);
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif html5
		
		var bytes:ByteArray = null;
		var data = Preloader.loaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		else return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var bytes:ByteArray = null;
		var data = Preloader.loaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String, handler:AudioBuffer -> Void):Void {
		
		#if (flash)
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				handler (audioBuffer);
				
			});
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			handler (getAudioBuffer (id));
			
		}
		#else
		handler (getAudioBuffer (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				handler (bytes);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		handler (getBytes (id));
		
		#end
		
	}
	
	
	public override function loadImage (id:String, handler:Image -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				handler (Image.fromBitmapData (bitmapData));
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getImage (id));
			
		}
		
		#else
		
		handler (getImage (id));
		
		#end
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = ByteArray.readFile ("../Resources/manifest");
			#elseif ios
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if ios
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	/*public override function loadMusic (id:String, handler:Dynamic -> Void):Void {
		
		#if (flash || html5)
		
		//if (path.exists (id)) {
			
		//	var loader = new Loader ();
		//	loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
		//		handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
		//	});
		//	loader.load (new URLRequest (path.get (id)));
			
		//} else {
			
			handler (getMusic (id));
			
		//}
		
		#else
		
		handler (getMusic (id));
		
		#end
		
	}*/
	
	
	public override function loadText (id:String, handler:String -> Void):Void {
		
		//#if html5
		
		/*if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (event.currentTarget.data);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getText (id));
			
		}*/
		
		//#else
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
		//#end
		
	}
	
	
}


#if !display
#if flash













































































































































#elseif html5













































































































































#else



#if (windows || mac || linux)





#end

#if openfl

#end

#end
#end

