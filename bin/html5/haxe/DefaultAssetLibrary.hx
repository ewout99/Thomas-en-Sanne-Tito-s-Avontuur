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
		
		className.set ("img/Background.png", __ASSET__img_background_png);
		type.set ("img/Background.png", AssetType.IMAGE);
		className.set ("img/Background_2.png", __ASSET__img_background_2_png);
		type.set ("img/Background_2.png", AssetType.IMAGE);
		className.set ("img/bottombutton.png", __ASSET__img_bottombutton_png);
		type.set ("img/bottombutton.png", AssetType.IMAGE);
		className.set ("img/bottombuttonhover.png", __ASSET__img_bottombuttonhover_png);
		type.set ("img/bottombuttonhover.png", AssetType.IMAGE);
		className.set ("img/Button.png", __ASSET__img_button_png);
		type.set ("img/Button.png", AssetType.IMAGE);
		className.set ("img/ButtonHover.png", __ASSET__img_buttonhover_png);
		type.set ("img/ButtonHover.png", AssetType.IMAGE);
		className.set ("img/Contactbackground.png", __ASSET__img_contactbackground_png);
		type.set ("img/Contactbackground.png", AssetType.IMAGE);
		className.set ("img/level/collision.png", __ASSET__img_level_collision_png);
		type.set ("img/level/collision.png", AssetType.IMAGE);
		className.set ("img/level/floorplan.png", __ASSET__img_level_floorplan_png);
		type.set ("img/level/floorplan.png", AssetType.IMAGE);
		className.set ("img/level/floorplan2.png", __ASSET__img_level_floorplan2_png);
		type.set ("img/level/floorplan2.png", AssetType.IMAGE);
		className.set ("img/level/floorwalls.png", __ASSET__img_level_floorwalls_png);
		type.set ("img/level/floorwalls.png", AssetType.IMAGE);
		className.set ("img/level/floorwalls2.png", __ASSET__img_level_floorwalls2_png);
		type.set ("img/level/floorwalls2.png", AssetType.IMAGE);
		className.set ("img/Levelkiezen.png", __ASSET__img_levelkiezen_png);
		type.set ("img/Levelkiezen.png", AssetType.IMAGE);
		className.set ("img/marker_1.png", __ASSET__img_marker_1_png);
		type.set ("img/marker_1.png", AssetType.IMAGE);
		className.set ("img/marker_2.png", __ASSET__img_marker_2_png);
		type.set ("img/marker_2.png", AssetType.IMAGE);
		className.set ("img/marker_3.png", __ASSET__img_marker_3_png);
		type.set ("img/marker_3.png", AssetType.IMAGE);
		className.set ("img/marker_4.png", __ASSET__img_marker_4_png);
		type.set ("img/marker_4.png", AssetType.IMAGE);
		className.set ("img/marker_5.png", __ASSET__img_marker_5_png);
		type.set ("img/marker_5.png", AssetType.IMAGE);
		className.set ("img/Menubackground.png", __ASSET__img_menubackground_png);
		type.set ("img/Menubackground.png", AssetType.IMAGE);
		className.set ("img/middlebutton.png", __ASSET__img_middlebutton_png);
		type.set ("img/middlebutton.png", AssetType.IMAGE);
		className.set ("img/middlebuttonhover.png", __ASSET__img_middlebuttonhover_png);
		type.set ("img/middlebuttonhover.png", AssetType.IMAGE);
		className.set ("img/Optionsbackground.png", __ASSET__img_optionsbackground_png);
		type.set ("img/Optionsbackground.png", AssetType.IMAGE);
		className.set ("img/speech bubble big left.png", __ASSET__img_speech_bubble_big_left_png);
		type.set ("img/speech bubble big left.png", AssetType.IMAGE);
		className.set ("img/speech bubble big right.png", __ASSET__img_speech_bubble_big_right_png);
		type.set ("img/speech bubble big right.png", AssetType.IMAGE);
		className.set ("img/speech bubble small left.png", __ASSET__img_speech_bubble_small_left_png);
		type.set ("img/speech bubble small left.png", AssetType.IMAGE);
		className.set ("img/Speech bubble small right.png", __ASSET__img_speech_bubble_small_right_png);
		type.set ("img/Speech bubble small right.png", AssetType.IMAGE);
		className.set ("img/thomas/back_1.png", __ASSET__img_thomas_back_1_png);
		type.set ("img/thomas/back_1.png", AssetType.IMAGE);
		className.set ("img/thomas/back_2.png", __ASSET__img_thomas_back_2_png);
		type.set ("img/thomas/back_2.png", AssetType.IMAGE);
		className.set ("img/thomas/back_3.png", __ASSET__img_thomas_back_3_png);
		type.set ("img/thomas/back_3.png", AssetType.IMAGE);
		className.set ("img/thomas/back_4.png", __ASSET__img_thomas_back_4_png);
		type.set ("img/thomas/back_4.png", AssetType.IMAGE);
		className.set ("img/thomas/front_1.png", __ASSET__img_thomas_front_1_png);
		type.set ("img/thomas/front_1.png", AssetType.IMAGE);
		className.set ("img/thomas/front_2.png", __ASSET__img_thomas_front_2_png);
		type.set ("img/thomas/front_2.png", AssetType.IMAGE);
		className.set ("img/thomas/front_3.png", __ASSET__img_thomas_front_3_png);
		type.set ("img/thomas/front_3.png", AssetType.IMAGE);
		className.set ("img/thomas/front_4.png", __ASSET__img_thomas_front_4_png);
		type.set ("img/thomas/front_4.png", AssetType.IMAGE);
		className.set ("img/thomas/left_1.png", __ASSET__img_thomas_left_1_png);
		type.set ("img/thomas/left_1.png", AssetType.IMAGE);
		className.set ("img/thomas/left_2.png", __ASSET__img_thomas_left_2_png);
		type.set ("img/thomas/left_2.png", AssetType.IMAGE);
		className.set ("img/thomas/left_3.png", __ASSET__img_thomas_left_3_png);
		type.set ("img/thomas/left_3.png", AssetType.IMAGE);
		className.set ("img/thomas/left_4.png", __ASSET__img_thomas_left_4_png);
		type.set ("img/thomas/left_4.png", AssetType.IMAGE);
		className.set ("img/thomas/old-extra/back walking.png", __ASSET__img_thomas_old_extra_back_walking_png);
		type.set ("img/thomas/old-extra/back walking.png", AssetType.IMAGE);
		className.set ("img/thomas/old-extra/back.png", __ASSET__img_thomas_old_extra_back_png);
		type.set ("img/thomas/old-extra/back.png", AssetType.IMAGE);
		className.set ("img/thomas/old-extra/front walking.png", __ASSET__img_thomas_old_extra_front_walking_png);
		type.set ("img/thomas/old-extra/front walking.png", AssetType.IMAGE);
		className.set ("img/thomas/old-extra/front.png", __ASSET__img_thomas_old_extra_front_png);
		type.set ("img/thomas/old-extra/front.png", AssetType.IMAGE);
		className.set ("img/thomas/old-extra/left side walking.png", __ASSET__img_thomas_old_extra_left_side_walking_png);
		type.set ("img/thomas/old-extra/left side walking.png", AssetType.IMAGE);
		className.set ("img/thomas/old-extra/leftback.png", __ASSET__img_thomas_old_extra_leftback_png);
		type.set ("img/thomas/old-extra/leftback.png", AssetType.IMAGE);
		className.set ("img/thomas/old-extra/leftfront.png", __ASSET__img_thomas_old_extra_leftfront_png);
		type.set ("img/thomas/old-extra/leftfront.png", AssetType.IMAGE);
		className.set ("img/thomas/old-extra/rightback.png", __ASSET__img_thomas_old_extra_rightback_png);
		type.set ("img/thomas/old-extra/rightback.png", AssetType.IMAGE);
		className.set ("img/thomas/old-extra/rightfront.png", __ASSET__img_thomas_old_extra_rightfront_png);
		type.set ("img/thomas/old-extra/rightfront.png", AssetType.IMAGE);
		className.set ("img/thomas/old-extra/side right walking.png", __ASSET__img_thomas_old_extra_side_right_walking_png);
		type.set ("img/thomas/old-extra/side right walking.png", AssetType.IMAGE);
		className.set ("img/thomas/old-extra/sideleft.png", __ASSET__img_thomas_old_extra_sideleft_png);
		type.set ("img/thomas/old-extra/sideleft.png", AssetType.IMAGE);
		className.set ("img/thomas/old-extra/sideright.png", __ASSET__img_thomas_old_extra_sideright_png);
		type.set ("img/thomas/old-extra/sideright.png", AssetType.IMAGE);
		className.set ("img/thomas/old-extra/tiles.png", __ASSET__img_thomas_old_extra_tiles_png);
		type.set ("img/thomas/old-extra/tiles.png", AssetType.IMAGE);
		className.set ("img/thomas/right_1.png", __ASSET__img_thomas_right_1_png);
		type.set ("img/thomas/right_1.png", AssetType.IMAGE);
		className.set ("img/thomas/right_2.png", __ASSET__img_thomas_right_2_png);
		type.set ("img/thomas/right_2.png", AssetType.IMAGE);
		className.set ("img/thomas/right_3.png", __ASSET__img_thomas_right_3_png);
		type.set ("img/thomas/right_3.png", AssetType.IMAGE);
		className.set ("img/thomas/right_4.png", __ASSET__img_thomas_right_4_png);
		type.set ("img/thomas/right_4.png", AssetType.IMAGE);
		className.set ("img/topbutton.png", __ASSET__img_topbutton_png);
		type.set ("img/topbutton.png", AssetType.IMAGE);
		className.set ("img/topbuttonhover.png", __ASSET__img_topbuttonhover_png);
		type.set ("img/topbuttonhover.png", AssetType.IMAGE);
		className.set ("audio/Buttonclick.mp3", __ASSET__audio_buttonclick_mp3);
		type.set ("audio/Buttonclick.mp3", AssetType.MUSIC);
		className.set ("audio/Buttonclick.ogg", __ASSET__audio_buttonclick_ogg);
		type.set ("audio/Buttonclick.ogg", AssetType.SOUND);
		className.set ("audio/Clock.mp3", __ASSET__audio_clock_mp3);
		type.set ("audio/Clock.mp3", AssetType.MUSIC);
		className.set ("audio/Clock.ogg", __ASSET__audio_clock_ogg);
		type.set ("audio/Clock.ogg", AssetType.SOUND);
		className.set ("audio/Closedoor.mp3", __ASSET__audio_closedoor_mp3);
		type.set ("audio/Closedoor.mp3", AssetType.MUSIC);
		className.set ("audio/Closedoor.ogg", __ASSET__audio_closedoor_ogg);
		type.set ("audio/Closedoor.ogg", AssetType.SOUND);
		className.set ("audio/Closedrawer.mp3", __ASSET__audio_closedrawer_mp3);
		type.set ("audio/Closedrawer.mp3", AssetType.MUSIC);
		className.set ("audio/Closedrawer.ogg", __ASSET__audio_closedrawer_ogg);
		type.set ("audio/Closedrawer.ogg", AssetType.SOUND);
		className.set ("audio/Coin.mp3", __ASSET__audio_coin_mp3);
		type.set ("audio/Coin.mp3", AssetType.MUSIC);
		className.set ("audio/Coin.ogg", __ASSET__audio_coin_ogg);
		type.set ("audio/Coin.ogg", AssetType.SOUND);
		className.set ("audio/Hintpopup.mp3", __ASSET__audio_hintpopup_mp3);
		type.set ("audio/Hintpopup.mp3", AssetType.MUSIC);
		className.set ("audio/Hintpopup.ogg", __ASSET__audio_hintpopup_ogg);
		type.set ("audio/Hintpopup.ogg", AssetType.SOUND);
		className.set ("audio/Huh.mp3", __ASSET__audio_huh_mp3);
		type.set ("audio/Huh.mp3", AssetType.MUSIC);
		className.set ("audio/Huh.ogg", __ASSET__audio_huh_ogg);
		type.set ("audio/Huh.ogg", AssetType.SOUND);
		className.set ("audio/Menu.ogg", __ASSET__audio_menu_ogg);
		type.set ("audio/Menu.ogg", AssetType.SOUND);
		className.set ("audio/Objectfound.mp3", __ASSET__audio_objectfound_mp3);
		type.set ("audio/Objectfound.mp3", AssetType.MUSIC);
		className.set ("audio/Objectfound.ogg", __ASSET__audio_objectfound_ogg);
		type.set ("audio/Objectfound.ogg", AssetType.SOUND);
		className.set ("audio/Objectfound2.mp3", __ASSET__audio_objectfound2_mp3);
		type.set ("audio/Objectfound2.mp3", AssetType.MUSIC);
		className.set ("audio/Objectfound2.ogg", __ASSET__audio_objectfound2_ogg);
		type.set ("audio/Objectfound2.ogg", AssetType.SOUND);
		className.set ("audio/Objectivecomplete.mp3", __ASSET__audio_objectivecomplete_mp3);
		type.set ("audio/Objectivecomplete.mp3", AssetType.MUSIC);
		className.set ("audio/Objectivecomplete.ogg", __ASSET__audio_objectivecomplete_ogg);
		type.set ("audio/Objectivecomplete.ogg", AssetType.SOUND);
		className.set ("audio/Opendoor.mp3", __ASSET__audio_opendoor_mp3);
		type.set ("audio/Opendoor.mp3", AssetType.MUSIC);
		className.set ("audio/Opendoor.ogg", __ASSET__audio_opendoor_ogg);
		type.set ("audio/Opendoor.ogg", AssetType.SOUND);
		className.set ("audio/Opendrawer.mp3", __ASSET__audio_opendrawer_mp3);
		type.set ("audio/Opendrawer.mp3", AssetType.MUSIC);
		className.set ("audio/Opendrawer.ogg", __ASSET__audio_opendrawer_ogg);
		type.set ("audio/Opendrawer.ogg", AssetType.SOUND);
		className.set ("audio/Papers.mp3", __ASSET__audio_papers_mp3);
		type.set ("audio/Papers.mp3", AssetType.MUSIC);
		className.set ("audio/Papers.ogg", __ASSET__audio_papers_ogg);
		type.set ("audio/Papers.ogg", AssetType.SOUND);
		className.set ("music/GameMusic.mp3", __ASSET__music_gamemusic_mp3);
		type.set ("music/GameMusic.mp3", AssetType.MUSIC);
		className.set ("music/GameMusic.ogg", __ASSET__music_gamemusic_ogg);
		type.set ("music/GameMusic.ogg", AssetType.SOUND);
		className.set ("music/Menu.mp3", __ASSET__music_menu_mp3);
		type.set ("music/Menu.mp3", AssetType.MUSIC);
		className.set ("music/Menu.ogg", __ASSET__music_menu_ogg);
		type.set ("music/Menu.ogg", AssetType.SOUND);
		className.set ("music/Winning.mp3", __ASSET__music_winning_mp3);
		type.set ("music/Winning.mp3", AssetType.MUSIC);
		
		
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
		id = "img/Contactbackground.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/level/collision.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/level/floorplan.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/level/floorplan2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/level/floorwalls.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/level/floorwalls2.png";
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
		id = "img/Optionsbackground.png";
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
		id = "img/topbutton.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/topbuttonhover.png";
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
		id = "music/GameMusic.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "music/GameMusic.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "music/Menu.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "music/Menu.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "music/Winning.mp3";
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
		
		className.set ("img/Background.png", __ASSET__img_background_png);
		type.set ("img/Background.png", AssetType.IMAGE);
		
		className.set ("img/Background_2.png", __ASSET__img_background_2_png);
		type.set ("img/Background_2.png", AssetType.IMAGE);
		
		className.set ("img/bottombutton.png", __ASSET__img_bottombutton_png);
		type.set ("img/bottombutton.png", AssetType.IMAGE);
		
		className.set ("img/bottombuttonhover.png", __ASSET__img_bottombuttonhover_png);
		type.set ("img/bottombuttonhover.png", AssetType.IMAGE);
		
		className.set ("img/Button.png", __ASSET__img_button_png);
		type.set ("img/Button.png", AssetType.IMAGE);
		
		className.set ("img/ButtonHover.png", __ASSET__img_buttonhover_png);
		type.set ("img/ButtonHover.png", AssetType.IMAGE);
		
		className.set ("img/Contactbackground.png", __ASSET__img_contactbackground_png);
		type.set ("img/Contactbackground.png", AssetType.IMAGE);
		
		className.set ("img/level/collision.png", __ASSET__img_level_collision_png);
		type.set ("img/level/collision.png", AssetType.IMAGE);
		
		className.set ("img/level/floorplan.png", __ASSET__img_level_floorplan_png);
		type.set ("img/level/floorplan.png", AssetType.IMAGE);
		
		className.set ("img/level/floorplan2.png", __ASSET__img_level_floorplan2_png);
		type.set ("img/level/floorplan2.png", AssetType.IMAGE);
		
		className.set ("img/level/floorwalls.png", __ASSET__img_level_floorwalls_png);
		type.set ("img/level/floorwalls.png", AssetType.IMAGE);
		
		className.set ("img/level/floorwalls2.png", __ASSET__img_level_floorwalls2_png);
		type.set ("img/level/floorwalls2.png", AssetType.IMAGE);
		
		className.set ("img/Levelkiezen.png", __ASSET__img_levelkiezen_png);
		type.set ("img/Levelkiezen.png", AssetType.IMAGE);
		
		className.set ("img/marker_1.png", __ASSET__img_marker_1_png);
		type.set ("img/marker_1.png", AssetType.IMAGE);
		
		className.set ("img/marker_2.png", __ASSET__img_marker_2_png);
		type.set ("img/marker_2.png", AssetType.IMAGE);
		
		className.set ("img/marker_3.png", __ASSET__img_marker_3_png);
		type.set ("img/marker_3.png", AssetType.IMAGE);
		
		className.set ("img/marker_4.png", __ASSET__img_marker_4_png);
		type.set ("img/marker_4.png", AssetType.IMAGE);
		
		className.set ("img/marker_5.png", __ASSET__img_marker_5_png);
		type.set ("img/marker_5.png", AssetType.IMAGE);
		
		className.set ("img/Menubackground.png", __ASSET__img_menubackground_png);
		type.set ("img/Menubackground.png", AssetType.IMAGE);
		
		className.set ("img/middlebutton.png", __ASSET__img_middlebutton_png);
		type.set ("img/middlebutton.png", AssetType.IMAGE);
		
		className.set ("img/middlebuttonhover.png", __ASSET__img_middlebuttonhover_png);
		type.set ("img/middlebuttonhover.png", AssetType.IMAGE);
		
		className.set ("img/Optionsbackground.png", __ASSET__img_optionsbackground_png);
		type.set ("img/Optionsbackground.png", AssetType.IMAGE);
		
		className.set ("img/speech bubble big left.png", __ASSET__img_speech_bubble_big_left_png);
		type.set ("img/speech bubble big left.png", AssetType.IMAGE);
		
		className.set ("img/speech bubble big right.png", __ASSET__img_speech_bubble_big_right_png);
		type.set ("img/speech bubble big right.png", AssetType.IMAGE);
		
		className.set ("img/speech bubble small left.png", __ASSET__img_speech_bubble_small_left_png);
		type.set ("img/speech bubble small left.png", AssetType.IMAGE);
		
		className.set ("img/Speech bubble small right.png", __ASSET__img_speech_bubble_small_right_png);
		type.set ("img/Speech bubble small right.png", AssetType.IMAGE);
		
		className.set ("img/thomas/back_1.png", __ASSET__img_thomas_back_1_png);
		type.set ("img/thomas/back_1.png", AssetType.IMAGE);
		
		className.set ("img/thomas/back_2.png", __ASSET__img_thomas_back_2_png);
		type.set ("img/thomas/back_2.png", AssetType.IMAGE);
		
		className.set ("img/thomas/back_3.png", __ASSET__img_thomas_back_3_png);
		type.set ("img/thomas/back_3.png", AssetType.IMAGE);
		
		className.set ("img/thomas/back_4.png", __ASSET__img_thomas_back_4_png);
		type.set ("img/thomas/back_4.png", AssetType.IMAGE);
		
		className.set ("img/thomas/front_1.png", __ASSET__img_thomas_front_1_png);
		type.set ("img/thomas/front_1.png", AssetType.IMAGE);
		
		className.set ("img/thomas/front_2.png", __ASSET__img_thomas_front_2_png);
		type.set ("img/thomas/front_2.png", AssetType.IMAGE);
		
		className.set ("img/thomas/front_3.png", __ASSET__img_thomas_front_3_png);
		type.set ("img/thomas/front_3.png", AssetType.IMAGE);
		
		className.set ("img/thomas/front_4.png", __ASSET__img_thomas_front_4_png);
		type.set ("img/thomas/front_4.png", AssetType.IMAGE);
		
		className.set ("img/thomas/left_1.png", __ASSET__img_thomas_left_1_png);
		type.set ("img/thomas/left_1.png", AssetType.IMAGE);
		
		className.set ("img/thomas/left_2.png", __ASSET__img_thomas_left_2_png);
		type.set ("img/thomas/left_2.png", AssetType.IMAGE);
		
		className.set ("img/thomas/left_3.png", __ASSET__img_thomas_left_3_png);
		type.set ("img/thomas/left_3.png", AssetType.IMAGE);
		
		className.set ("img/thomas/left_4.png", __ASSET__img_thomas_left_4_png);
		type.set ("img/thomas/left_4.png", AssetType.IMAGE);
		
		className.set ("img/thomas/old-extra/back walking.png", __ASSET__img_thomas_old_extra_back_walking_png);
		type.set ("img/thomas/old-extra/back walking.png", AssetType.IMAGE);
		
		className.set ("img/thomas/old-extra/back.png", __ASSET__img_thomas_old_extra_back_png);
		type.set ("img/thomas/old-extra/back.png", AssetType.IMAGE);
		
		className.set ("img/thomas/old-extra/front walking.png", __ASSET__img_thomas_old_extra_front_walking_png);
		type.set ("img/thomas/old-extra/front walking.png", AssetType.IMAGE);
		
		className.set ("img/thomas/old-extra/front.png", __ASSET__img_thomas_old_extra_front_png);
		type.set ("img/thomas/old-extra/front.png", AssetType.IMAGE);
		
		className.set ("img/thomas/old-extra/left side walking.png", __ASSET__img_thomas_old_extra_left_side_walking_png);
		type.set ("img/thomas/old-extra/left side walking.png", AssetType.IMAGE);
		
		className.set ("img/thomas/old-extra/leftback.png", __ASSET__img_thomas_old_extra_leftback_png);
		type.set ("img/thomas/old-extra/leftback.png", AssetType.IMAGE);
		
		className.set ("img/thomas/old-extra/leftfront.png", __ASSET__img_thomas_old_extra_leftfront_png);
		type.set ("img/thomas/old-extra/leftfront.png", AssetType.IMAGE);
		
		className.set ("img/thomas/old-extra/rightback.png", __ASSET__img_thomas_old_extra_rightback_png);
		type.set ("img/thomas/old-extra/rightback.png", AssetType.IMAGE);
		
		className.set ("img/thomas/old-extra/rightfront.png", __ASSET__img_thomas_old_extra_rightfront_png);
		type.set ("img/thomas/old-extra/rightfront.png", AssetType.IMAGE);
		
		className.set ("img/thomas/old-extra/side right walking.png", __ASSET__img_thomas_old_extra_side_right_walking_png);
		type.set ("img/thomas/old-extra/side right walking.png", AssetType.IMAGE);
		
		className.set ("img/thomas/old-extra/sideleft.png", __ASSET__img_thomas_old_extra_sideleft_png);
		type.set ("img/thomas/old-extra/sideleft.png", AssetType.IMAGE);
		
		className.set ("img/thomas/old-extra/sideright.png", __ASSET__img_thomas_old_extra_sideright_png);
		type.set ("img/thomas/old-extra/sideright.png", AssetType.IMAGE);
		
		className.set ("img/thomas/old-extra/tiles.png", __ASSET__img_thomas_old_extra_tiles_png);
		type.set ("img/thomas/old-extra/tiles.png", AssetType.IMAGE);
		
		className.set ("img/thomas/right_1.png", __ASSET__img_thomas_right_1_png);
		type.set ("img/thomas/right_1.png", AssetType.IMAGE);
		
		className.set ("img/thomas/right_2.png", __ASSET__img_thomas_right_2_png);
		type.set ("img/thomas/right_2.png", AssetType.IMAGE);
		
		className.set ("img/thomas/right_3.png", __ASSET__img_thomas_right_3_png);
		type.set ("img/thomas/right_3.png", AssetType.IMAGE);
		
		className.set ("img/thomas/right_4.png", __ASSET__img_thomas_right_4_png);
		type.set ("img/thomas/right_4.png", AssetType.IMAGE);
		
		className.set ("img/topbutton.png", __ASSET__img_topbutton_png);
		type.set ("img/topbutton.png", AssetType.IMAGE);
		
		className.set ("img/topbuttonhover.png", __ASSET__img_topbuttonhover_png);
		type.set ("img/topbuttonhover.png", AssetType.IMAGE);
		
		className.set ("audio/Buttonclick.mp3", __ASSET__audio_buttonclick_mp3);
		type.set ("audio/Buttonclick.mp3", AssetType.MUSIC);
		
		className.set ("audio/Buttonclick.ogg", __ASSET__audio_buttonclick_ogg);
		type.set ("audio/Buttonclick.ogg", AssetType.SOUND);
		
		className.set ("audio/Clock.mp3", __ASSET__audio_clock_mp3);
		type.set ("audio/Clock.mp3", AssetType.MUSIC);
		
		className.set ("audio/Clock.ogg", __ASSET__audio_clock_ogg);
		type.set ("audio/Clock.ogg", AssetType.SOUND);
		
		className.set ("audio/Closedoor.mp3", __ASSET__audio_closedoor_mp3);
		type.set ("audio/Closedoor.mp3", AssetType.MUSIC);
		
		className.set ("audio/Closedoor.ogg", __ASSET__audio_closedoor_ogg);
		type.set ("audio/Closedoor.ogg", AssetType.SOUND);
		
		className.set ("audio/Closedrawer.mp3", __ASSET__audio_closedrawer_mp3);
		type.set ("audio/Closedrawer.mp3", AssetType.MUSIC);
		
		className.set ("audio/Closedrawer.ogg", __ASSET__audio_closedrawer_ogg);
		type.set ("audio/Closedrawer.ogg", AssetType.SOUND);
		
		className.set ("audio/Coin.mp3", __ASSET__audio_coin_mp3);
		type.set ("audio/Coin.mp3", AssetType.MUSIC);
		
		className.set ("audio/Coin.ogg", __ASSET__audio_coin_ogg);
		type.set ("audio/Coin.ogg", AssetType.SOUND);
		
		className.set ("audio/Hintpopup.mp3", __ASSET__audio_hintpopup_mp3);
		type.set ("audio/Hintpopup.mp3", AssetType.MUSIC);
		
		className.set ("audio/Hintpopup.ogg", __ASSET__audio_hintpopup_ogg);
		type.set ("audio/Hintpopup.ogg", AssetType.SOUND);
		
		className.set ("audio/Huh.mp3", __ASSET__audio_huh_mp3);
		type.set ("audio/Huh.mp3", AssetType.MUSIC);
		
		className.set ("audio/Huh.ogg", __ASSET__audio_huh_ogg);
		type.set ("audio/Huh.ogg", AssetType.SOUND);
		
		className.set ("audio/Menu.ogg", __ASSET__audio_menu_ogg);
		type.set ("audio/Menu.ogg", AssetType.SOUND);
		
		className.set ("audio/Objectfound.mp3", __ASSET__audio_objectfound_mp3);
		type.set ("audio/Objectfound.mp3", AssetType.MUSIC);
		
		className.set ("audio/Objectfound.ogg", __ASSET__audio_objectfound_ogg);
		type.set ("audio/Objectfound.ogg", AssetType.SOUND);
		
		className.set ("audio/Objectfound2.mp3", __ASSET__audio_objectfound2_mp3);
		type.set ("audio/Objectfound2.mp3", AssetType.MUSIC);
		
		className.set ("audio/Objectfound2.ogg", __ASSET__audio_objectfound2_ogg);
		type.set ("audio/Objectfound2.ogg", AssetType.SOUND);
		
		className.set ("audio/Objectivecomplete.mp3", __ASSET__audio_objectivecomplete_mp3);
		type.set ("audio/Objectivecomplete.mp3", AssetType.MUSIC);
		
		className.set ("audio/Objectivecomplete.ogg", __ASSET__audio_objectivecomplete_ogg);
		type.set ("audio/Objectivecomplete.ogg", AssetType.SOUND);
		
		className.set ("audio/Opendoor.mp3", __ASSET__audio_opendoor_mp3);
		type.set ("audio/Opendoor.mp3", AssetType.MUSIC);
		
		className.set ("audio/Opendoor.ogg", __ASSET__audio_opendoor_ogg);
		type.set ("audio/Opendoor.ogg", AssetType.SOUND);
		
		className.set ("audio/Opendrawer.mp3", __ASSET__audio_opendrawer_mp3);
		type.set ("audio/Opendrawer.mp3", AssetType.MUSIC);
		
		className.set ("audio/Opendrawer.ogg", __ASSET__audio_opendrawer_ogg);
		type.set ("audio/Opendrawer.ogg", AssetType.SOUND);
		
		className.set ("audio/Papers.mp3", __ASSET__audio_papers_mp3);
		type.set ("audio/Papers.mp3", AssetType.MUSIC);
		
		className.set ("audio/Papers.ogg", __ASSET__audio_papers_ogg);
		type.set ("audio/Papers.ogg", AssetType.SOUND);
		
		className.set ("music/GameMusic.mp3", __ASSET__music_gamemusic_mp3);
		type.set ("music/GameMusic.mp3", AssetType.MUSIC);
		
		className.set ("music/GameMusic.ogg", __ASSET__music_gamemusic_ogg);
		type.set ("music/GameMusic.ogg", AssetType.SOUND);
		
		className.set ("music/Menu.mp3", __ASSET__music_menu_mp3);
		type.set ("music/Menu.mp3", AssetType.MUSIC);
		
		className.set ("music/Menu.ogg", __ASSET__music_menu_ogg);
		type.set ("music/Menu.ogg", AssetType.SOUND);
		
		className.set ("music/Winning.mp3", __ASSET__music_winning_mp3);
		type.set ("music/Winning.mp3", AssetType.MUSIC);
		
		
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

@:keep @:bind #if display private #end class __ASSET__img_background_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_background_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_bottombutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_bottombuttonhover_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_buttonhover_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_contactbackground_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_level_collision_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_level_floorplan_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_level_floorplan2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_level_floorwalls_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_level_floorwalls2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_levelkiezen_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_marker_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_marker_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_marker_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_marker_4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_marker_5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_menubackground_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_middlebutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_middlebuttonhover_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_optionsbackground_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_speech_bubble_big_left_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_speech_bubble_big_right_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_speech_bubble_small_left_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_speech_bubble_small_right_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_thomas_back_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_thomas_back_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_thomas_back_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_thomas_back_4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_thomas_front_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_thomas_front_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_thomas_front_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_thomas_front_4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_thomas_left_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_thomas_left_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_thomas_left_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_thomas_left_4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_thomas_old_extra_back_walking_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_thomas_old_extra_back_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_thomas_old_extra_front_walking_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_thomas_old_extra_front_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_thomas_old_extra_left_side_walking_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_thomas_old_extra_leftback_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_thomas_old_extra_leftfront_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_thomas_old_extra_rightback_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_thomas_old_extra_rightfront_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_thomas_old_extra_side_right_walking_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_thomas_old_extra_sideleft_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_thomas_old_extra_sideright_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_thomas_old_extra_tiles_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_thomas_right_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_thomas_right_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_thomas_right_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_thomas_right_4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_topbutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_topbuttonhover_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__audio_buttonclick_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__audio_buttonclick_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__audio_clock_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__audio_clock_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__audio_closedoor_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__audio_closedoor_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__audio_closedrawer_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__audio_closedrawer_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__audio_coin_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__audio_coin_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__audio_hintpopup_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__audio_hintpopup_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__audio_huh_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__audio_huh_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__audio_menu_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__audio_objectfound_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__audio_objectfound_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__audio_objectfound2_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__audio_objectfound2_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__audio_objectivecomplete_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__audio_objectivecomplete_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__audio_opendoor_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__audio_opendoor_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__audio_opendrawer_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__audio_opendrawer_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__audio_papers_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__audio_papers_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__music_gamemusic_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__music_gamemusic_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__music_menu_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__music_menu_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__music_winning_mp3 extends null { }


#elseif html5




























































































#else



#if (windows || mac || linux)


@:image("assets/img/Background.png") #if display private #end class __ASSET__img_background_png extends lime.graphics.Image {}
@:image("assets/img/Background_2.png") #if display private #end class __ASSET__img_background_2_png extends lime.graphics.Image {}
@:image("assets/img/bottombutton.png") #if display private #end class __ASSET__img_bottombutton_png extends lime.graphics.Image {}
@:image("assets/img/bottombuttonhover.png") #if display private #end class __ASSET__img_bottombuttonhover_png extends lime.graphics.Image {}
@:image("assets/img/Button.png") #if display private #end class __ASSET__img_button_png extends lime.graphics.Image {}
@:image("assets/img/ButtonHover.png") #if display private #end class __ASSET__img_buttonhover_png extends lime.graphics.Image {}
@:image("assets/img/Contactbackground.png") #if display private #end class __ASSET__img_contactbackground_png extends lime.graphics.Image {}
@:image("assets/img/level/collision.png") #if display private #end class __ASSET__img_level_collision_png extends lime.graphics.Image {}
@:image("assets/img/level/floorplan.png") #if display private #end class __ASSET__img_level_floorplan_png extends lime.graphics.Image {}
@:image("assets/img/level/floorplan2.png") #if display private #end class __ASSET__img_level_floorplan2_png extends lime.graphics.Image {}
@:image("assets/img/level/floorwalls.png") #if display private #end class __ASSET__img_level_floorwalls_png extends lime.graphics.Image {}
@:image("assets/img/level/floorwalls2.png") #if display private #end class __ASSET__img_level_floorwalls2_png extends lime.graphics.Image {}
@:image("assets/img/Levelkiezen.png") #if display private #end class __ASSET__img_levelkiezen_png extends lime.graphics.Image {}
@:image("assets/img/marker_1.png") #if display private #end class __ASSET__img_marker_1_png extends lime.graphics.Image {}
@:image("assets/img/marker_2.png") #if display private #end class __ASSET__img_marker_2_png extends lime.graphics.Image {}
@:image("assets/img/marker_3.png") #if display private #end class __ASSET__img_marker_3_png extends lime.graphics.Image {}
@:image("assets/img/marker_4.png") #if display private #end class __ASSET__img_marker_4_png extends lime.graphics.Image {}
@:image("assets/img/marker_5.png") #if display private #end class __ASSET__img_marker_5_png extends lime.graphics.Image {}
@:image("assets/img/Menubackground.png") #if display private #end class __ASSET__img_menubackground_png extends lime.graphics.Image {}
@:image("assets/img/middlebutton.png") #if display private #end class __ASSET__img_middlebutton_png extends lime.graphics.Image {}
@:image("assets/img/middlebuttonhover.png") #if display private #end class __ASSET__img_middlebuttonhover_png extends lime.graphics.Image {}
@:image("assets/img/Optionsbackground.png") #if display private #end class __ASSET__img_optionsbackground_png extends lime.graphics.Image {}
@:image("assets/img/speech bubble big left.png") #if display private #end class __ASSET__img_speech_bubble_big_left_png extends lime.graphics.Image {}
@:image("assets/img/speech bubble big right.png") #if display private #end class __ASSET__img_speech_bubble_big_right_png extends lime.graphics.Image {}
@:image("assets/img/speech bubble small left.png") #if display private #end class __ASSET__img_speech_bubble_small_left_png extends lime.graphics.Image {}
@:image("assets/img/Speech bubble small right.png") #if display private #end class __ASSET__img_speech_bubble_small_right_png extends lime.graphics.Image {}
@:image("assets/img/thomas/back_1.png") #if display private #end class __ASSET__img_thomas_back_1_png extends lime.graphics.Image {}
@:image("assets/img/thomas/back_2.png") #if display private #end class __ASSET__img_thomas_back_2_png extends lime.graphics.Image {}
@:image("assets/img/thomas/back_3.png") #if display private #end class __ASSET__img_thomas_back_3_png extends lime.graphics.Image {}
@:image("assets/img/thomas/back_4.png") #if display private #end class __ASSET__img_thomas_back_4_png extends lime.graphics.Image {}
@:image("assets/img/thomas/front_1.png") #if display private #end class __ASSET__img_thomas_front_1_png extends lime.graphics.Image {}
@:image("assets/img/thomas/front_2.png") #if display private #end class __ASSET__img_thomas_front_2_png extends lime.graphics.Image {}
@:image("assets/img/thomas/front_3.png") #if display private #end class __ASSET__img_thomas_front_3_png extends lime.graphics.Image {}
@:image("assets/img/thomas/front_4.png") #if display private #end class __ASSET__img_thomas_front_4_png extends lime.graphics.Image {}
@:image("assets/img/thomas/left_1.png") #if display private #end class __ASSET__img_thomas_left_1_png extends lime.graphics.Image {}
@:image("assets/img/thomas/left_2.png") #if display private #end class __ASSET__img_thomas_left_2_png extends lime.graphics.Image {}
@:image("assets/img/thomas/left_3.png") #if display private #end class __ASSET__img_thomas_left_3_png extends lime.graphics.Image {}
@:image("assets/img/thomas/left_4.png") #if display private #end class __ASSET__img_thomas_left_4_png extends lime.graphics.Image {}
@:image("assets/img/thomas/old-extra/back walking.png") #if display private #end class __ASSET__img_thomas_old_extra_back_walking_png extends lime.graphics.Image {}
@:image("assets/img/thomas/old-extra/back.png") #if display private #end class __ASSET__img_thomas_old_extra_back_png extends lime.graphics.Image {}
@:image("assets/img/thomas/old-extra/front walking.png") #if display private #end class __ASSET__img_thomas_old_extra_front_walking_png extends lime.graphics.Image {}
@:image("assets/img/thomas/old-extra/front.png") #if display private #end class __ASSET__img_thomas_old_extra_front_png extends lime.graphics.Image {}
@:image("assets/img/thomas/old-extra/left side walking.png") #if display private #end class __ASSET__img_thomas_old_extra_left_side_walking_png extends lime.graphics.Image {}
@:image("assets/img/thomas/old-extra/leftback.png") #if display private #end class __ASSET__img_thomas_old_extra_leftback_png extends lime.graphics.Image {}
@:image("assets/img/thomas/old-extra/leftfront.png") #if display private #end class __ASSET__img_thomas_old_extra_leftfront_png extends lime.graphics.Image {}
@:image("assets/img/thomas/old-extra/rightback.png") #if display private #end class __ASSET__img_thomas_old_extra_rightback_png extends lime.graphics.Image {}
@:image("assets/img/thomas/old-extra/rightfront.png") #if display private #end class __ASSET__img_thomas_old_extra_rightfront_png extends lime.graphics.Image {}
@:image("assets/img/thomas/old-extra/side right walking.png") #if display private #end class __ASSET__img_thomas_old_extra_side_right_walking_png extends lime.graphics.Image {}
@:image("assets/img/thomas/old-extra/sideleft.png") #if display private #end class __ASSET__img_thomas_old_extra_sideleft_png extends lime.graphics.Image {}
@:image("assets/img/thomas/old-extra/sideright.png") #if display private #end class __ASSET__img_thomas_old_extra_sideright_png extends lime.graphics.Image {}
@:image("assets/img/thomas/old-extra/tiles.png") #if display private #end class __ASSET__img_thomas_old_extra_tiles_png extends lime.graphics.Image {}
@:image("assets/img/thomas/right_1.png") #if display private #end class __ASSET__img_thomas_right_1_png extends lime.graphics.Image {}
@:image("assets/img/thomas/right_2.png") #if display private #end class __ASSET__img_thomas_right_2_png extends lime.graphics.Image {}
@:image("assets/img/thomas/right_3.png") #if display private #end class __ASSET__img_thomas_right_3_png extends lime.graphics.Image {}
@:image("assets/img/thomas/right_4.png") #if display private #end class __ASSET__img_thomas_right_4_png extends lime.graphics.Image {}
@:image("assets/img/topbutton.png") #if display private #end class __ASSET__img_topbutton_png extends lime.graphics.Image {}
@:image("assets/img/topbuttonhover.png") #if display private #end class __ASSET__img_topbuttonhover_png extends lime.graphics.Image {}
@:file("assets/audio/Buttonclick.mp3") #if display private #end class __ASSET__audio_buttonclick_mp3 extends lime.utils.ByteArray {}
@:file("assets/audio/Buttonclick.ogg") #if display private #end class __ASSET__audio_buttonclick_ogg extends lime.utils.ByteArray {}
@:file("assets/audio/Clock.mp3") #if display private #end class __ASSET__audio_clock_mp3 extends lime.utils.ByteArray {}
@:file("assets/audio/Clock.ogg") #if display private #end class __ASSET__audio_clock_ogg extends lime.utils.ByteArray {}
@:file("assets/audio/Closedoor.mp3") #if display private #end class __ASSET__audio_closedoor_mp3 extends lime.utils.ByteArray {}
@:file("assets/audio/Closedoor.ogg") #if display private #end class __ASSET__audio_closedoor_ogg extends lime.utils.ByteArray {}
@:file("assets/audio/Closedrawer.mp3") #if display private #end class __ASSET__audio_closedrawer_mp3 extends lime.utils.ByteArray {}
@:file("assets/audio/Closedrawer.ogg") #if display private #end class __ASSET__audio_closedrawer_ogg extends lime.utils.ByteArray {}
@:file("assets/audio/Coin.mp3") #if display private #end class __ASSET__audio_coin_mp3 extends lime.utils.ByteArray {}
@:file("assets/audio/Coin.ogg") #if display private #end class __ASSET__audio_coin_ogg extends lime.utils.ByteArray {}
@:file("assets/audio/Hintpopup.mp3") #if display private #end class __ASSET__audio_hintpopup_mp3 extends lime.utils.ByteArray {}
@:file("assets/audio/Hintpopup.ogg") #if display private #end class __ASSET__audio_hintpopup_ogg extends lime.utils.ByteArray {}
@:file("assets/audio/Huh.mp3") #if display private #end class __ASSET__audio_huh_mp3 extends lime.utils.ByteArray {}
@:file("assets/audio/Huh.ogg") #if display private #end class __ASSET__audio_huh_ogg extends lime.utils.ByteArray {}
@:file("assets/audio/Menu.ogg") #if display private #end class __ASSET__audio_menu_ogg extends lime.utils.ByteArray {}
@:file("assets/audio/Objectfound.mp3") #if display private #end class __ASSET__audio_objectfound_mp3 extends lime.utils.ByteArray {}
@:file("assets/audio/Objectfound.ogg") #if display private #end class __ASSET__audio_objectfound_ogg extends lime.utils.ByteArray {}
@:file("assets/audio/Objectfound2.mp3") #if display private #end class __ASSET__audio_objectfound2_mp3 extends lime.utils.ByteArray {}
@:file("assets/audio/Objectfound2.ogg") #if display private #end class __ASSET__audio_objectfound2_ogg extends lime.utils.ByteArray {}
@:file("assets/audio/Objectivecomplete.mp3") #if display private #end class __ASSET__audio_objectivecomplete_mp3 extends lime.utils.ByteArray {}
@:file("assets/audio/Objectivecomplete.ogg") #if display private #end class __ASSET__audio_objectivecomplete_ogg extends lime.utils.ByteArray {}
@:file("assets/audio/Opendoor.mp3") #if display private #end class __ASSET__audio_opendoor_mp3 extends lime.utils.ByteArray {}
@:file("assets/audio/Opendoor.ogg") #if display private #end class __ASSET__audio_opendoor_ogg extends lime.utils.ByteArray {}
@:file("assets/audio/Opendrawer.mp3") #if display private #end class __ASSET__audio_opendrawer_mp3 extends lime.utils.ByteArray {}
@:file("assets/audio/Opendrawer.ogg") #if display private #end class __ASSET__audio_opendrawer_ogg extends lime.utils.ByteArray {}
@:file("assets/audio/Papers.mp3") #if display private #end class __ASSET__audio_papers_mp3 extends lime.utils.ByteArray {}
@:file("assets/audio/Papers.ogg") #if display private #end class __ASSET__audio_papers_ogg extends lime.utils.ByteArray {}
@:file("assets/music/GameMusic.mp3") #if display private #end class __ASSET__music_gamemusic_mp3 extends lime.utils.ByteArray {}
@:file("assets/music/GameMusic.ogg") #if display private #end class __ASSET__music_gamemusic_ogg extends lime.utils.ByteArray {}
@:file("assets/music/Menu.mp3") #if display private #end class __ASSET__music_menu_mp3 extends lime.utils.ByteArray {}
@:file("assets/music/Menu.ogg") #if display private #end class __ASSET__music_menu_ogg extends lime.utils.ByteArray {}
@:file("assets/music/Winning.mp3") #if display private #end class __ASSET__music_winning_mp3 extends lime.utils.ByteArray {}



#end

#if openfl

#end

#end
#end

