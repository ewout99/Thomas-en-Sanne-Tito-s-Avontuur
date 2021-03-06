#if !macro


@:access(lime.Assets)


class ApplicationMain {
	
	
	public static var config:lime.app.Config;
	public static var preloader:openfl.display.Preloader;
	
	
	public static function create ():Void {
		
		var app = new lime.app.Application ();
		app.create (config);
		openfl.Lib.application = app;
		
		#if !flash
		var stage = new openfl.display.Stage (app.window.width, app.window.height, config.background);
		stage.addChild (openfl.Lib.current);
		app.addModule (stage);
		#end
		
		var display = new NMEPreloader ();
		
		preloader = new openfl.display.Preloader (display);
		preloader.onComplete = init;
		preloader.create (config);
		
		#if (js && html5)
		var urls = [];
		var types = [];
		
		
		urls.push ("img/Background.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/Background_2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/bottombutton.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/bottombuttonhover.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/Button.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/ButtonHover.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/Characterbackground.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/Contactbackground.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/Hint.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/Hinthover.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/level/backups_old/collision - Copy.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/level/backups_old/floorplan - Copy.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/level/backups_old/floorplan2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/level/backups_old/floorwalls - Copy.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/level/backups_old/floorwalls2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/level/collision.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/level/floorplan.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/level/floorwalls.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/Levelkiezen.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/marker_1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/marker_2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/marker_3.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/marker_4.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/marker_5.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/Menubackground.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/middlebutton.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/middlebuttonhover.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/objectives/objective_1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/objectives/objective_1_alt.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/objectives/objective_2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/objectives/objective_2_alt.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/objectives/objective_3.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/objectives/objective_3_alt.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/objectives/objective_4.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/objectives/objective_4_alt.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/objectives/objective_5.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/objectives/objective_5_alt.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/objectives/objective_6.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/objectives/objective_6_alt.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/Objectives.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/optionbutton.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/optionbutton_alt.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/Optionsbackground.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/Progressbarpiece.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/Progressie.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/Progressie_2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/sanne/back_1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/sanne/back_2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/sanne/back_3.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/sanne/back_4.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/sanne/front_1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/sanne/front_2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/sanne/front_3.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/sanne/front_4.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/sanne/left_1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/sanne/left_2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/sanne/left_3.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/sanne/left_4.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/sanne/right_1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/sanne/right_2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/sanne/right_3.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/sanne/right_4.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/sanneicon.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/speech bubble big left.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/speech bubble big right.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/speech bubble small left.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/Speech bubble small right.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/thomas/back_1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/thomas/back_2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/thomas/back_3.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/thomas/back_4.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/thomas/front_1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/thomas/front_2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/thomas/front_3.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/thomas/front_4.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/thomas/left_1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/thomas/left_2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/thomas/left_3.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/thomas/left_4.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/thomas/old-extra/back walking.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/thomas/old-extra/back.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/thomas/old-extra/front walking.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/thomas/old-extra/front.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/thomas/old-extra/left side walking.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/thomas/old-extra/leftback.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/thomas/old-extra/leftfront.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/thomas/old-extra/rightback.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/thomas/old-extra/rightfront.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/thomas/old-extra/side right walking.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/thomas/old-extra/sideleft.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/thomas/old-extra/sideright.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/thomas/old-extra/tiles.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/thomas/right_1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/thomas/right_2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/thomas/right_3.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/thomas/right_4.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/thomasicon.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/topbutton.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/topbuttonhover.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/Victorybackground.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("audio/Buttonclick.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("audio/Buttonclick.ogg");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("audio/Clock.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("audio/Clock.ogg");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("audio/Closedoor.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("audio/Closedoor.ogg");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("audio/Closedrawer.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("audio/Closedrawer.ogg");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("audio/Coin.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("audio/Coin.ogg");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("audio/Hintpopup.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("audio/Hintpopup.ogg");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("audio/Huh.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("audio/Huh.ogg");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("audio/Menu.ogg");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("audio/Objectfound.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("audio/Objectfound.ogg");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("audio/Objectfound2.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("audio/Objectfound2.ogg");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("audio/Objectivecomplete.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("audio/Objectivecomplete.ogg");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("audio/Opendoor.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("audio/Opendoor.ogg");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("audio/Opendrawer.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("audio/Opendrawer.ogg");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("audio/Papers.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("audio/Papers.ogg");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("music/gameMusic.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("music/gameMusic.ogg");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("music/menuMusic.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("music/menuMusic.ogg");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("music/winningMusic.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("music/winningMusic.ogg");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		
		if (config.assetsPrefix != null) {
			
			for (i in 0...urls.length) {
				
				if (types[i] != lime.Assets.AssetType.FONT) {
					
					urls[i] = config.assetsPrefix + urls[i];
					
				}
				
			}
			
		}
		
		preloader.load (urls, types);
		#end
		
		var result = app.exec ();
		
		#if (sys && !nodejs && !emscripten)
		Sys.exit (result);
		#end
		
	}
	
	
	public static function init ():Void {
		
		var loaded = 0;
		var total = 0;
		var library_onLoad = function (__) {
			
			loaded++;
			
			if (loaded == total) {
				
				start ();
				
			}
			
		}
		
		preloader = null;
		
		
		
		if (loaded == total) {
			
			start ();
			
		}
		
	}
	
	
	public static function main () {
		
		config = {
			
			antialiasing: Std.int (0),
			background: Std.int (0),
			borderless: false,
			company: "Ezzz",
			depthBuffer: false,
			file: "ThomasenSanneTitosAvontuur",
			fps: Std.int (60),
			fullscreen: false,
			hardware: true,
			height: Std.int (720),
			orientation: "",
			packageName: "ThomasenSanneTitosAvontuur",
			resizable: true,
			stencilBuffer: true,
			title: "Thomas-en-Sanne-Tito-s-Avontuur",
			version: "1.0.0",
			vsync: false,
			width: Std.int (1280),
			
		}
		
		#if (js && html5)
		#if (munit || utest)
		openfl.Lib.embed (null, 1280, 720, "000000");
		#end
		#else
		create ();
		#end
		
	}
	
	
	public static function start ():Void {
		
		var hasMain = false;
		var entryPoint = Type.resolveClass ("Main");
		
		for (methodName in Type.getClassFields (entryPoint)) {
			
			if (methodName == "main") {
				
				hasMain = true;
				break;
				
			}
			
		}
		
		lime.Assets.initialize ();
		
		if (hasMain) {
			
			Reflect.callMethod (entryPoint, Reflect.field (entryPoint, "main"), []);
			
		} else {
			
			var instance:DocumentClass = Type.createInstance (DocumentClass, []);
			
			/*if (Std.is (instance, openfl.display.DisplayObject)) {
				
				openfl.Lib.current.addChild (cast instance);
				
			}*/
			
		}
		
		openfl.Lib.current.stage.dispatchEvent (new openfl.events.Event (openfl.events.Event.RESIZE, false, false));
		
	}
	
	
	#if neko
	@:noCompletion public static function __init__ () {
		
		var loader = new neko.vm.Loader (untyped $loader);
		loader.addPath (haxe.io.Path.directory (Sys.executablePath ()));
		loader.addPath ("./");
		loader.addPath ("@executable_path/");
		
	}
	#end
	
	
}


@:build(DocumentClass.build())
@:keep class DocumentClass extends Main {}


#else


import haxe.macro.Context;
import haxe.macro.Expr;


class DocumentClass {
	
	
	macro public static function build ():Array<Field> {
		
		var classType = Context.getLocalClass ().get ();
		var searchTypes = classType;
		
		while (searchTypes.superClass != null) {
			
			if (searchTypes.pack.length == 2 && searchTypes.pack[1] == "display" && searchTypes.name == "DisplayObject") {
				
				var fields = Context.getBuildFields ();
				
				var method = macro {
					
					openfl.Lib.current.addChild (this);
					super ();
					dispatchEvent (new openfl.events.Event (openfl.events.Event.ADDED_TO_STAGE, false, false));
					
				}
				
				fields.push ({ name: "new", access: [ APublic ], kind: FFun({ args: [], expr: method, params: [], ret: macro :Void }), pos: Context.currentPos () });
				
				return fields;
				
			}
			
			searchTypes = searchTypes.superClass.t.get ();
			
		}
		
		return null;
		
	}
	
	
}


#end
