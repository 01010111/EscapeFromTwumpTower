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
		
		var display = new flixel.system.FlxPreloader ();
		
		preloader = new openfl.display.Preloader (display);
		preloader.onComplete = init;
		preloader.create (config);
		
		#if (js && html5)
		var urls = [];
		var types = [];
		
		
		urls.push ("assets/data/armyman.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/data/block.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/data/box.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/data/coin.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/data/elevator.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/data/moe.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/data/moneybag.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/data/pc.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/data/safe.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/data/tower.oel");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/tower.oep");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/trump.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/data/trumper.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/armyman.bak");
		types.push (lime.Assets.AssetType.BINARY);
		
		
		urls.push ("assets/images/armyman.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/bg.bak");
		types.push (lime.Assets.AssetType.BINARY);
		
		
		urls.push ("assets/images/bg.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/bg2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/bgMtn1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/bgMtn2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/boy.bak");
		types.push (lime.Assets.AssetType.BINARY);
		
		
		urls.push ("assets/images/boy.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/bullet.bak");
		types.push (lime.Assets.AssetType.BINARY);
		
		
		urls.push ("assets/images/bullet.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/coin.bak");
		types.push (lime.Assets.AssetType.BINARY);
		
		
		urls.push ("assets/images/coin.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/copter.bak");
		types.push (lime.Assets.AssetType.BINARY);
		
		
		urls.push ("assets/images/copter.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/elevator.bak");
		types.push (lime.Assets.AssetType.BINARY);
		
		
		urls.push ("assets/images/elevator.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/explosion.bak");
		types.push (lime.Assets.AssetType.BINARY);
		
		
		urls.push ("assets/images/explosion.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/health.bak");
		types.push (lime.Assets.AssetType.BINARY);
		
		
		urls.push ("assets/images/health.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/heart.bak");
		types.push (lime.Assets.AssetType.BINARY);
		
		
		urls.push ("assets/images/heart.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/introExpl.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/intro_bldg.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/missileMoe.bak");
		types.push (lime.Assets.AssetType.BINARY);
		
		
		urls.push ("assets/images/missileMoe.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/numbers.bak");
		types.push (lime.Assets.AssetType.BINARY);
		
		
		urls.push ("assets/images/numbers.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/press_a.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/sweat.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/tiles.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/tiles1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/tiles2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/tiles3.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/tiles4.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/tiles5.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/tiles6.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/title.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/twump.bak");
		types.push (lime.Assets.AssetType.BINARY);
		
		
		urls.push ("assets/images/twump.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/uiBGthing.bak");
		types.push (lime.Assets.AssetType.BINARY);
		
		
		urls.push ("assets/images/uiBGthing.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/music/3333.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/music/untitled_2.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/explode.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/get.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/hit.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/jump.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/shooot.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/toss.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/tosstoss.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/beep.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/flixel.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("Nokia Cellphone FC Small");
		types.push (lime.Assets.AssetType.FONT);
		
		
		urls.push ("Arial");
		types.push (lime.Assets.AssetType.FONT);
		
		
		
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
			company: "HaxeFlixel",
			depthBuffer: false,
			file: "TwumpTower",
			fps: Std.int (60),
			fullscreen: false,
			height: Std.int (480),
			orientation: "portrait",
			packageName: "com.example.myapp",
			resizable: true,
			stencilBuffer: true,
			title: "TwumpTower",
			version: "0.0.1",
			vsync: true,
			width: Std.int (640),
			
		}
		
		#if (js && html5)
		#if (munit || utest)
		openfl.Lib.embed (null, 640, 480, "000000");
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
