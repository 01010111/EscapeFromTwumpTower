package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Preloader;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.system.ThreadPool;
import lime.text.Font;
import lime.utils.ByteArray;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if (js && html5)
import lime.net.URLLoader;
import lime.net.URLRequest;
#elseif flash
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
	private var threadPool:ThreadPool;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if (openfl && !flash)
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_arial_ttf);
		
		#end
		
		#if flash
		
		className.set ("assets/data/armyman.png", __ASSET__assets_data_armyman_png);
		type.set ("assets/data/armyman.png", AssetType.IMAGE);
		className.set ("assets/data/block.png", __ASSET__assets_data_block_png);
		type.set ("assets/data/block.png", AssetType.IMAGE);
		className.set ("assets/data/box.png", __ASSET__assets_data_box_png);
		type.set ("assets/data/box.png", AssetType.IMAGE);
		className.set ("assets/data/coin.png", __ASSET__assets_data_coin_png);
		type.set ("assets/data/coin.png", AssetType.IMAGE);
		className.set ("assets/data/elevator.png", __ASSET__assets_data_elevator_png);
		type.set ("assets/data/elevator.png", AssetType.IMAGE);
		className.set ("assets/data/moe.png", __ASSET__assets_data_moe_png);
		type.set ("assets/data/moe.png", AssetType.IMAGE);
		className.set ("assets/data/moneybag.png", __ASSET__assets_data_moneybag_png);
		type.set ("assets/data/moneybag.png", AssetType.IMAGE);
		className.set ("assets/data/pc.png", __ASSET__assets_data_pc_png);
		type.set ("assets/data/pc.png", AssetType.IMAGE);
		className.set ("assets/data/safe.png", __ASSET__assets_data_safe_png);
		type.set ("assets/data/safe.png", AssetType.IMAGE);
		className.set ("assets/data/tower.oel", __ASSET__assets_data_tower_oel);
		type.set ("assets/data/tower.oel", AssetType.TEXT);
		className.set ("assets/data/tower.oep", __ASSET__assets_data_tower_oep);
		type.set ("assets/data/tower.oep", AssetType.TEXT);
		className.set ("assets/data/trump.png", __ASSET__assets_data_trump_png);
		type.set ("assets/data/trump.png", AssetType.IMAGE);
		className.set ("assets/data/trumper.png", __ASSET__assets_data_trumper_png);
		type.set ("assets/data/trumper.png", AssetType.IMAGE);
		className.set ("assets/images/armyman.png", __ASSET__assets_images_armyman_png);
		type.set ("assets/images/armyman.png", AssetType.IMAGE);
		className.set ("assets/images/bg.png", __ASSET__assets_images_bg_png);
		type.set ("assets/images/bg.png", AssetType.IMAGE);
		className.set ("assets/images/boy.png", __ASSET__assets_images_boy_png);
		type.set ("assets/images/boy.png", AssetType.IMAGE);
		className.set ("assets/images/bullet.png", __ASSET__assets_images_bullet_png);
		type.set ("assets/images/bullet.png", AssetType.IMAGE);
		className.set ("assets/images/coin.png", __ASSET__assets_images_coin_png);
		type.set ("assets/images/coin.png", AssetType.IMAGE);
		className.set ("assets/images/copter.png", __ASSET__assets_images_copter_png);
		type.set ("assets/images/copter.png", AssetType.IMAGE);
		className.set ("assets/images/elevator.png", __ASSET__assets_images_elevator_png);
		type.set ("assets/images/elevator.png", AssetType.IMAGE);
		className.set ("assets/images/explosion.png", __ASSET__assets_images_explosion_png);
		type.set ("assets/images/explosion.png", AssetType.IMAGE);
		className.set ("assets/images/health.png", __ASSET__assets_images_health_png);
		type.set ("assets/images/health.png", AssetType.IMAGE);
		className.set ("assets/images/heart.png", __ASSET__assets_images_heart_png);
		type.set ("assets/images/heart.png", AssetType.IMAGE);
		className.set ("assets/images/missileMoe.png", __ASSET__assets_images_missilemoe_png);
		type.set ("assets/images/missileMoe.png", AssetType.IMAGE);
		className.set ("assets/images/numbers.png", __ASSET__assets_images_numbers_png);
		type.set ("assets/images/numbers.png", AssetType.IMAGE);
		className.set ("assets/images/sweat.png", __ASSET__assets_images_sweat_png);
		type.set ("assets/images/sweat.png", AssetType.IMAGE);
		className.set ("assets/images/tiles.png", __ASSET__assets_images_tiles_png);
		type.set ("assets/images/tiles.png", AssetType.IMAGE);
		className.set ("assets/images/title.png", __ASSET__assets_images_title_png);
		type.set ("assets/images/title.png", AssetType.IMAGE);
		className.set ("assets/images/twump.png", __ASSET__assets_images_twump_png);
		type.set ("assets/images/twump.png", AssetType.IMAGE);
		className.set ("assets/images/uiBGthing.png", __ASSET__assets_images_uibgthing_png);
		type.set ("assets/images/uiBGthing.png", AssetType.IMAGE);
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		className.set ("assets/fonts/nokiafc22.ttf", __ASSET__assets_fonts_nokiafc22_ttf);
		type.set ("assets/fonts/nokiafc22.ttf", AssetType.FONT);
		className.set ("assets/fonts/arial.ttf", __ASSET__assets_fonts_arial_ttf);
		type.set ("assets/fonts/arial.ttf", AssetType.FONT);
		
		
		#elseif html5
		
		var id;
		id = "assets/data/armyman.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/data/block.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/data/box.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/data/coin.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/data/elevator.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/data/moe.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/data/moneybag.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/data/pc.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/data/safe.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/data/tower.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/tower.oep";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/trump.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/data/trumper.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/armyman.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/bg.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/boy.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/bullet.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/coin.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/copter.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/elevator.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/explosion.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/health.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/heart.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/missileMoe.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/numbers.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sweat.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tiles.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/title.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/twump.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/uiBGthing.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sounds/beep.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/flixel.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/fonts/nokiafc22.ttf";
		className.set (id, __ASSET__assets_fonts_nokiafc22_ttf);
		
		type.set (id, AssetType.FONT);
		id = "assets/fonts/arial.ttf";
		className.set (id, __ASSET__assets_fonts_arial_ttf);
		
		type.set (id, AssetType.FONT);
		
		
		var assetsPrefix = ApplicationMain.config.assetsPrefix;
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("assets/data/armyman.png", __ASSET__assets_data_armyman_png);
		type.set ("assets/data/armyman.png", AssetType.IMAGE);
		
		className.set ("assets/data/block.png", __ASSET__assets_data_block_png);
		type.set ("assets/data/block.png", AssetType.IMAGE);
		
		className.set ("assets/data/box.png", __ASSET__assets_data_box_png);
		type.set ("assets/data/box.png", AssetType.IMAGE);
		
		className.set ("assets/data/coin.png", __ASSET__assets_data_coin_png);
		type.set ("assets/data/coin.png", AssetType.IMAGE);
		
		className.set ("assets/data/elevator.png", __ASSET__assets_data_elevator_png);
		type.set ("assets/data/elevator.png", AssetType.IMAGE);
		
		className.set ("assets/data/moe.png", __ASSET__assets_data_moe_png);
		type.set ("assets/data/moe.png", AssetType.IMAGE);
		
		className.set ("assets/data/moneybag.png", __ASSET__assets_data_moneybag_png);
		type.set ("assets/data/moneybag.png", AssetType.IMAGE);
		
		className.set ("assets/data/pc.png", __ASSET__assets_data_pc_png);
		type.set ("assets/data/pc.png", AssetType.IMAGE);
		
		className.set ("assets/data/safe.png", __ASSET__assets_data_safe_png);
		type.set ("assets/data/safe.png", AssetType.IMAGE);
		
		className.set ("assets/data/tower.oel", __ASSET__assets_data_tower_oel);
		type.set ("assets/data/tower.oel", AssetType.TEXT);
		
		className.set ("assets/data/tower.oep", __ASSET__assets_data_tower_oep);
		type.set ("assets/data/tower.oep", AssetType.TEXT);
		
		className.set ("assets/data/trump.png", __ASSET__assets_data_trump_png);
		type.set ("assets/data/trump.png", AssetType.IMAGE);
		
		className.set ("assets/data/trumper.png", __ASSET__assets_data_trumper_png);
		type.set ("assets/data/trumper.png", AssetType.IMAGE);
		
		className.set ("assets/images/armyman.png", __ASSET__assets_images_armyman_png);
		type.set ("assets/images/armyman.png", AssetType.IMAGE);
		
		className.set ("assets/images/bg.png", __ASSET__assets_images_bg_png);
		type.set ("assets/images/bg.png", AssetType.IMAGE);
		
		className.set ("assets/images/boy.png", __ASSET__assets_images_boy_png);
		type.set ("assets/images/boy.png", AssetType.IMAGE);
		
		className.set ("assets/images/bullet.png", __ASSET__assets_images_bullet_png);
		type.set ("assets/images/bullet.png", AssetType.IMAGE);
		
		className.set ("assets/images/coin.png", __ASSET__assets_images_coin_png);
		type.set ("assets/images/coin.png", AssetType.IMAGE);
		
		className.set ("assets/images/copter.png", __ASSET__assets_images_copter_png);
		type.set ("assets/images/copter.png", AssetType.IMAGE);
		
		className.set ("assets/images/elevator.png", __ASSET__assets_images_elevator_png);
		type.set ("assets/images/elevator.png", AssetType.IMAGE);
		
		className.set ("assets/images/explosion.png", __ASSET__assets_images_explosion_png);
		type.set ("assets/images/explosion.png", AssetType.IMAGE);
		
		className.set ("assets/images/health.png", __ASSET__assets_images_health_png);
		type.set ("assets/images/health.png", AssetType.IMAGE);
		
		className.set ("assets/images/heart.png", __ASSET__assets_images_heart_png);
		type.set ("assets/images/heart.png", AssetType.IMAGE);
		
		className.set ("assets/images/missileMoe.png", __ASSET__assets_images_missilemoe_png);
		type.set ("assets/images/missileMoe.png", AssetType.IMAGE);
		
		className.set ("assets/images/numbers.png", __ASSET__assets_images_numbers_png);
		type.set ("assets/images/numbers.png", AssetType.IMAGE);
		
		className.set ("assets/images/sweat.png", __ASSET__assets_images_sweat_png);
		type.set ("assets/images/sweat.png", AssetType.IMAGE);
		
		className.set ("assets/images/tiles.png", __ASSET__assets_images_tiles_png);
		type.set ("assets/images/tiles.png", AssetType.IMAGE);
		
		className.set ("assets/images/title.png", __ASSET__assets_images_title_png);
		type.set ("assets/images/title.png", AssetType.IMAGE);
		
		className.set ("assets/images/twump.png", __ASSET__assets_images_twump_png);
		type.set ("assets/images/twump.png", AssetType.IMAGE);
		
		className.set ("assets/images/uiBGthing.png", __ASSET__assets_images_uibgthing_png);
		type.set ("assets/images/uiBGthing.png", AssetType.IMAGE);
		
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		
		className.set ("assets/fonts/nokiafc22.ttf", __ASSET__assets_fonts_nokiafc22_ttf);
		type.set ("assets/fonts/nokiafc22.ttf", AssetType.FONT);
		
		className.set ("assets/fonts/arial.ttf", __ASSET__assets_fonts_arial_ttf);
		type.set ("assets/fonts/arial.ttf", AssetType.FONT);
		
		
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
	
	
	private function createThreadPool ():Void {
		
		threadPool = new ThreadPool (0, 2);
		threadPool.doWork.add (function (id, data) {
			
			data.result = data.getMethod (id);
			threadPool.sendComplete (data.handler, data);
			
		});
		threadPool.onComplete.add (function (id, data) {
			
			data.handler (data.result);
			
		});
		
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
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var data = loader.data;
		
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
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var data = loader.data;
		
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
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.dataFormat = BINARY;
			loader.onComplete.add (function (_):Void {
				
				handler (loader.data);
				
			});
			
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		if (threadPool == null) {
			
			createThreadPool ();
			
		}
		
		threadPool.queue (id, { handler: handler, getMethod: getBytes });
		
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
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				handler (Image.fromImageElement (image));
				
			}
			image.src = path.get (id);
			
		} else {
			
			handler (getImage (id));
			
		}
		
		#else
		
		if (threadPool == null) {
			
			createThreadPool ();
			
		}
		
		threadPool.queue (id, { handler: handler, getMethod: getImage });
		
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
		
		#if html5
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.onComplete.add (function (_):Void {
				
				handler (loader.data);
				
			});
			
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getText (id));
			
		}
		
		#else
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
		#end
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_data_armyman_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_data_block_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_data_box_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_data_coin_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_data_elevator_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_data_moe_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_data_moneybag_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_data_pc_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_data_safe_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_data_tower_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_tower_oep extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_trump_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_data_trumper_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_armyman_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_boy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bullet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_coin_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_copter_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_elevator_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_explosion_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_health_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_heart_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_missilemoe_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_numbers_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sweat_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tiles_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_title_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_twump_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_uibgthing_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_beep_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_flixel_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_arial_ttf extends flash.text.Font { }


#elseif html5

































@:keep #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { super (); name = "Nokia Cellphone FC Small"; } } 
@:keep #if display private #end class __ASSET__assets_fonts_arial_ttf extends lime.text.Font { public function new () { super (); name = "Arial"; } } 


#else



#if (windows || mac || linux || cpp)


@:image("assets/data/armyman.png") #if display private #end class __ASSET__assets_data_armyman_png extends lime.graphics.Image {}
@:image("assets/data/block.png") #if display private #end class __ASSET__assets_data_block_png extends lime.graphics.Image {}
@:image("assets/data/box.png") #if display private #end class __ASSET__assets_data_box_png extends lime.graphics.Image {}
@:image("assets/data/coin.png") #if display private #end class __ASSET__assets_data_coin_png extends lime.graphics.Image {}
@:image("assets/data/elevator.png") #if display private #end class __ASSET__assets_data_elevator_png extends lime.graphics.Image {}
@:image("assets/data/moe.png") #if display private #end class __ASSET__assets_data_moe_png extends lime.graphics.Image {}
@:image("assets/data/moneybag.png") #if display private #end class __ASSET__assets_data_moneybag_png extends lime.graphics.Image {}
@:image("assets/data/pc.png") #if display private #end class __ASSET__assets_data_pc_png extends lime.graphics.Image {}
@:image("assets/data/safe.png") #if display private #end class __ASSET__assets_data_safe_png extends lime.graphics.Image {}
@:file("assets/data/tower.oel") #if display private #end class __ASSET__assets_data_tower_oel extends lime.utils.ByteArray {}
@:file("assets/data/tower.oep") #if display private #end class __ASSET__assets_data_tower_oep extends lime.utils.ByteArray {}
@:image("assets/data/trump.png") #if display private #end class __ASSET__assets_data_trump_png extends lime.graphics.Image {}
@:image("assets/data/trumper.png") #if display private #end class __ASSET__assets_data_trumper_png extends lime.graphics.Image {}
@:image("assets/images/armyman.png") #if display private #end class __ASSET__assets_images_armyman_png extends lime.graphics.Image {}
@:image("assets/images/bg.png") #if display private #end class __ASSET__assets_images_bg_png extends lime.graphics.Image {}
@:image("assets/images/boy.png") #if display private #end class __ASSET__assets_images_boy_png extends lime.graphics.Image {}
@:image("assets/images/bullet.png") #if display private #end class __ASSET__assets_images_bullet_png extends lime.graphics.Image {}
@:image("assets/images/coin.png") #if display private #end class __ASSET__assets_images_coin_png extends lime.graphics.Image {}
@:image("assets/images/copter.png") #if display private #end class __ASSET__assets_images_copter_png extends lime.graphics.Image {}
@:image("assets/images/elevator.png") #if display private #end class __ASSET__assets_images_elevator_png extends lime.graphics.Image {}
@:image("assets/images/explosion.png") #if display private #end class __ASSET__assets_images_explosion_png extends lime.graphics.Image {}
@:image("assets/images/health.png") #if display private #end class __ASSET__assets_images_health_png extends lime.graphics.Image {}
@:image("assets/images/heart.png") #if display private #end class __ASSET__assets_images_heart_png extends lime.graphics.Image {}
@:image("assets/images/missileMoe.png") #if display private #end class __ASSET__assets_images_missilemoe_png extends lime.graphics.Image {}
@:image("assets/images/numbers.png") #if display private #end class __ASSET__assets_images_numbers_png extends lime.graphics.Image {}
@:image("assets/images/sweat.png") #if display private #end class __ASSET__assets_images_sweat_png extends lime.graphics.Image {}
@:image("assets/images/tiles.png") #if display private #end class __ASSET__assets_images_tiles_png extends lime.graphics.Image {}
@:image("assets/images/title.png") #if display private #end class __ASSET__assets_images_title_png extends lime.graphics.Image {}
@:image("assets/images/twump.png") #if display private #end class __ASSET__assets_images_twump_png extends lime.graphics.Image {}
@:image("assets/images/uiBGthing.png") #if display private #end class __ASSET__assets_images_uibgthing_png extends lime.graphics.Image {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/git/assets/sounds/beep.mp3") #if display private #end class __ASSET__assets_sounds_beep_mp3 extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/git/assets/sounds/flixel.mp3") #if display private #end class __ASSET__assets_sounds_flixel_mp3 extends lime.utils.ByteArray {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/git/assets/fonts/nokiafc22.ttf") #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends lime.text.Font {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/git/assets/fonts/arial.ttf") #if display private #end class __ASSET__assets_fonts_arial_ttf extends lime.text.Font {}



#end
#end

#if (openfl && !flash)
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_fonts_nokiafc22_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_arial_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_fonts_arial_ttf (); src = font.src; name = font.name; super (); }}

#end

#end