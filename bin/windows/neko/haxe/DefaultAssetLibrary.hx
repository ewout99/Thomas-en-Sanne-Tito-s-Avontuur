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
		path.set ("img/bottombutton.png", "img/bottombutton.png");
		type.set ("img/bottombutton.png", AssetType.IMAGE);
		path.set ("img/bottombuttonhover.png", "img/bottombuttonhover.png");
		type.set ("img/bottombuttonhover.png", AssetType.IMAGE);
		path.set ("img/Button.png", "img/Button.png");
		type.set ("img/Button.png", AssetType.IMAGE);
		path.set ("img/ButtonHover.png", "img/ButtonHover.png");
		type.set ("img/ButtonHover.png", AssetType.IMAGE);
		path.set ("img/middlebutton.png", "img/middlebutton.png");
		type.set ("img/middlebutton.png", AssetType.IMAGE);
		path.set ("img/middlebuttonhover.png", "img/middlebuttonhover.png");
		type.set ("img/middlebuttonhover.png", AssetType.IMAGE);
		path.set ("img/topbutton.png", "img/topbutton.png");
		type.set ("img/topbutton.png", AssetType.IMAGE);
		path.set ("img/topbuttonhover.png", "img/topbuttonhover.png");
		type.set ("img/topbuttonhover.png", AssetType.IMAGE);
		path.set ("audio/Buttonclick.mp3", "audio/Buttonclick.mp3");
		type.set ("audio/Buttonclick.mp3", AssetType.MUSIC);
		path.set ("audio/Clock.mp3", "audio/Clock.mp3");
		type.set ("audio/Clock.mp3", AssetType.MUSIC);
		path.set ("audio/Closedoor.mp3", "audio/Closedoor.mp3");
		type.set ("audio/Closedoor.mp3", AssetType.MUSIC);
		path.set ("audio/Closedrawer.mp3", "audio/Closedrawer.mp3");
		type.set ("audio/Closedrawer.mp3", AssetType.MUSIC);
		path.set ("audio/Coin.mp3", "audio/Coin.mp3");
		type.set ("audio/Coin.mp3", AssetType.MUSIC);
		path.set ("audio/Hintpopup.mp3", "audio/Hintpopup.mp3");
		type.set ("audio/Hintpopup.mp3", AssetType.MUSIC);
		path.set ("audio/Huh.mp3", "audio/Huh.mp3");
		type.set ("audio/Huh.mp3", AssetType.MUSIC);
		path.set ("audio/Objectfound.mp3", "audio/Objectfound.mp3");
		type.set ("audio/Objectfound.mp3", AssetType.MUSIC);
		path.set ("audio/Objectfound2.mp3", "audio/Objectfound2.mp3");
		type.set ("audio/Objectfound2.mp3", AssetType.MUSIC);
		path.set ("audio/Objectivecomplete.mp3", "audio/Objectivecomplete.mp3");
		type.set ("audio/Objectivecomplete.mp3", AssetType.MUSIC);
		path.set ("audio/Opendoor.mp3", "audio/Opendoor.mp3");
		type.set ("audio/Opendoor.mp3", AssetType.MUSIC);
		path.set ("audio/Opendrawer.mp3", "audio/Opendrawer.mp3");
		type.set ("audio/Opendrawer.mp3", AssetType.MUSIC);
		path.set ("audio/Papers.mp3", "audio/Papers.mp3");
		type.set ("audio/Papers.mp3", AssetType.MUSIC);
		path.set ("music/GameMusic.mp3", "music/GameMusic.mp3");
		type.set ("music/GameMusic.mp3", AssetType.MUSIC);
		path.set ("music/Menu.mp3", "music/Menu.mp3");
		type.set ("music/Menu.mp3", AssetType.MUSIC);
		path.set ("music/Winning.mp3", "music/Winning.mp3");
		type.set ("music/Winning.mp3", AssetType.MUSIC);
		
		
		#elseif html5
		
		var id;
		id = "img/Background.png";
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
		id = "img/middlebutton.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/middlebuttonhover.png";
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
		id = "audio/Clock.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "audio/Closedoor.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "audio/Closedrawer.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "audio/Coin.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "audio/Hintpopup.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "audio/Huh.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "audio/Objectfound.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "audio/Objectfound2.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "audio/Objectivecomplete.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "audio/Opendoor.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "audio/Opendrawer.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "audio/Papers.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "music/GameMusic.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "music/Menu.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
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

