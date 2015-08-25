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
		className.set ("assets/images/armyman.bak", __ASSET__assets_images_armyman_bak);
		type.set ("assets/images/armyman.bak", AssetType.BINARY);
		className.set ("assets/images/armyman.png", __ASSET__assets_images_armyman_png);
		type.set ("assets/images/armyman.png", AssetType.IMAGE);
		className.set ("assets/images/bg.bak", __ASSET__assets_images_bg_bak);
		type.set ("assets/images/bg.bak", AssetType.BINARY);
		className.set ("assets/images/bg.png", __ASSET__assets_images_bg_png);
		type.set ("assets/images/bg.png", AssetType.IMAGE);
		className.set ("assets/images/bg2.png", __ASSET__assets_images_bg2_png);
		type.set ("assets/images/bg2.png", AssetType.IMAGE);
		className.set ("assets/images/bgMtn1.png", __ASSET__assets_images_bgmtn1_png);
		type.set ("assets/images/bgMtn1.png", AssetType.IMAGE);
		className.set ("assets/images/bgMtn2.png", __ASSET__assets_images_bgmtn2_png);
		type.set ("assets/images/bgMtn2.png", AssetType.IMAGE);
		className.set ("assets/images/boy.bak", __ASSET__assets_images_boy_bak);
		type.set ("assets/images/boy.bak", AssetType.BINARY);
		className.set ("assets/images/boy.png", __ASSET__assets_images_boy_png);
		type.set ("assets/images/boy.png", AssetType.IMAGE);
		className.set ("assets/images/bullet.bak", __ASSET__assets_images_bullet_bak);
		type.set ("assets/images/bullet.bak", AssetType.BINARY);
		className.set ("assets/images/bullet.png", __ASSET__assets_images_bullet_png);
		type.set ("assets/images/bullet.png", AssetType.IMAGE);
		className.set ("assets/images/coin.bak", __ASSET__assets_images_coin_bak);
		type.set ("assets/images/coin.bak", AssetType.BINARY);
		className.set ("assets/images/coin.png", __ASSET__assets_images_coin_png);
		type.set ("assets/images/coin.png", AssetType.IMAGE);
		className.set ("assets/images/copter.bak", __ASSET__assets_images_copter_bak);
		type.set ("assets/images/copter.bak", AssetType.BINARY);
		className.set ("assets/images/copter.png", __ASSET__assets_images_copter_png);
		type.set ("assets/images/copter.png", AssetType.IMAGE);
		className.set ("assets/images/elevator.bak", __ASSET__assets_images_elevator_bak);
		type.set ("assets/images/elevator.bak", AssetType.BINARY);
		className.set ("assets/images/elevator.png", __ASSET__assets_images_elevator_png);
		type.set ("assets/images/elevator.png", AssetType.IMAGE);
		className.set ("assets/images/explosion.bak", __ASSET__assets_images_explosion_bak);
		type.set ("assets/images/explosion.bak", AssetType.BINARY);
		className.set ("assets/images/explosion.png", __ASSET__assets_images_explosion_png);
		type.set ("assets/images/explosion.png", AssetType.IMAGE);
		className.set ("assets/images/health.bak", __ASSET__assets_images_health_bak);
		type.set ("assets/images/health.bak", AssetType.BINARY);
		className.set ("assets/images/health.png", __ASSET__assets_images_health_png);
		type.set ("assets/images/health.png", AssetType.IMAGE);
		className.set ("assets/images/heart.bak", __ASSET__assets_images_heart_bak);
		type.set ("assets/images/heart.bak", AssetType.BINARY);
		className.set ("assets/images/heart.png", __ASSET__assets_images_heart_png);
		type.set ("assets/images/heart.png", AssetType.IMAGE);
		className.set ("assets/images/introExpl.png", __ASSET__assets_images_introexpl_png);
		type.set ("assets/images/introExpl.png", AssetType.IMAGE);
		className.set ("assets/images/intro_bldg.png", __ASSET__assets_images_intro_bldg_png);
		type.set ("assets/images/intro_bldg.png", AssetType.IMAGE);
		className.set ("assets/images/missileMoe.bak", __ASSET__assets_images_missilemoe_bak);
		type.set ("assets/images/missileMoe.bak", AssetType.BINARY);
		className.set ("assets/images/missileMoe.png", __ASSET__assets_images_missilemoe_png);
		type.set ("assets/images/missileMoe.png", AssetType.IMAGE);
		className.set ("assets/images/numbers.bak", __ASSET__assets_images_numbers_bak);
		type.set ("assets/images/numbers.bak", AssetType.BINARY);
		className.set ("assets/images/numbers.png", __ASSET__assets_images_numbers_png);
		type.set ("assets/images/numbers.png", AssetType.IMAGE);
		className.set ("assets/images/press_a.png", __ASSET__assets_images_press_a_png);
		type.set ("assets/images/press_a.png", AssetType.IMAGE);
		className.set ("assets/images/sweat.png", __ASSET__assets_images_sweat_png);
		type.set ("assets/images/sweat.png", AssetType.IMAGE);
		className.set ("assets/images/tiles.png", __ASSET__assets_images_tiles_png);
		type.set ("assets/images/tiles.png", AssetType.IMAGE);
		className.set ("assets/images/tiles1.png", __ASSET__assets_images_tiles1_png);
		type.set ("assets/images/tiles1.png", AssetType.IMAGE);
		className.set ("assets/images/tiles2.png", __ASSET__assets_images_tiles2_png);
		type.set ("assets/images/tiles2.png", AssetType.IMAGE);
		className.set ("assets/images/tiles3.png", __ASSET__assets_images_tiles3_png);
		type.set ("assets/images/tiles3.png", AssetType.IMAGE);
		className.set ("assets/images/tiles4.png", __ASSET__assets_images_tiles4_png);
		type.set ("assets/images/tiles4.png", AssetType.IMAGE);
		className.set ("assets/images/tiles5.png", __ASSET__assets_images_tiles5_png);
		type.set ("assets/images/tiles5.png", AssetType.IMAGE);
		className.set ("assets/images/tiles6.png", __ASSET__assets_images_tiles6_png);
		type.set ("assets/images/tiles6.png", AssetType.IMAGE);
		className.set ("assets/images/title.png", __ASSET__assets_images_title_png);
		type.set ("assets/images/title.png", AssetType.IMAGE);
		className.set ("assets/images/twump.bak", __ASSET__assets_images_twump_bak);
		type.set ("assets/images/twump.bak", AssetType.BINARY);
		className.set ("assets/images/twump.png", __ASSET__assets_images_twump_png);
		type.set ("assets/images/twump.png", AssetType.IMAGE);
		className.set ("assets/images/uiBGthing.bak", __ASSET__assets_images_uibgthing_bak);
		type.set ("assets/images/uiBGthing.bak", AssetType.BINARY);
		className.set ("assets/images/uiBGthing.png", __ASSET__assets_images_uibgthing_png);
		type.set ("assets/images/uiBGthing.png", AssetType.IMAGE);
		className.set ("assets/music/3333.mp3", __ASSET__assets_music_3333_mp3);
		type.set ("assets/music/3333.mp3", AssetType.MUSIC);
		className.set ("assets/music/untitled_2.mp3", __ASSET__assets_music_untitled_2_mp3);
		type.set ("assets/music/untitled_2.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/explode.mp3", __ASSET__assets_sounds_explode_mp3);
		type.set ("assets/sounds/explode.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/get.mp3", __ASSET__assets_sounds_get_mp3);
		type.set ("assets/sounds/get.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/hit.mp3", __ASSET__assets_sounds_hit_mp3);
		type.set ("assets/sounds/hit.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/jump.mp3", __ASSET__assets_sounds_jump_mp3);
		type.set ("assets/sounds/jump.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/shooot.mp3", __ASSET__assets_sounds_shooot_mp3);
		type.set ("assets/sounds/shooot.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/toss.mp3", __ASSET__assets_sounds_toss_mp3);
		type.set ("assets/sounds/toss.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/tosstoss.mp3", __ASSET__assets_sounds_tosstoss_mp3);
		type.set ("assets/sounds/tosstoss.mp3", AssetType.MUSIC);
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
		id = "assets/images/armyman.bak";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/armyman.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/bg.bak";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/bg.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/bg2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/bgMtn1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/bgMtn2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/boy.bak";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/boy.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/bullet.bak";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/bullet.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/coin.bak";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/coin.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/copter.bak";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/copter.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/elevator.bak";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/elevator.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/explosion.bak";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/explosion.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/health.bak";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/health.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/heart.bak";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/heart.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/introExpl.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/intro_bldg.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/missileMoe.bak";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/missileMoe.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/numbers.bak";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/numbers.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/press_a.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sweat.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tiles.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tiles1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tiles2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tiles3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tiles4.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tiles5.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tiles6.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/title.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/twump.bak";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/twump.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/uiBGthing.bak";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/uiBGthing.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/music/3333.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/music/untitled_2.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/explode.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/get.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/hit.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/jump.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/shooot.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/toss.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/tosstoss.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
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
		
		#if openfl
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_arial_ttf);
		
		#end
		
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
		
		className.set ("assets/images/armyman.bak", __ASSET__assets_images_armyman_bak);
		type.set ("assets/images/armyman.bak", AssetType.BINARY);
		
		className.set ("assets/images/armyman.png", __ASSET__assets_images_armyman_png);
		type.set ("assets/images/armyman.png", AssetType.IMAGE);
		
		className.set ("assets/images/bg.bak", __ASSET__assets_images_bg_bak);
		type.set ("assets/images/bg.bak", AssetType.BINARY);
		
		className.set ("assets/images/bg.png", __ASSET__assets_images_bg_png);
		type.set ("assets/images/bg.png", AssetType.IMAGE);
		
		className.set ("assets/images/bg2.png", __ASSET__assets_images_bg2_png);
		type.set ("assets/images/bg2.png", AssetType.IMAGE);
		
		className.set ("assets/images/bgMtn1.png", __ASSET__assets_images_bgmtn1_png);
		type.set ("assets/images/bgMtn1.png", AssetType.IMAGE);
		
		className.set ("assets/images/bgMtn2.png", __ASSET__assets_images_bgmtn2_png);
		type.set ("assets/images/bgMtn2.png", AssetType.IMAGE);
		
		className.set ("assets/images/boy.bak", __ASSET__assets_images_boy_bak);
		type.set ("assets/images/boy.bak", AssetType.BINARY);
		
		className.set ("assets/images/boy.png", __ASSET__assets_images_boy_png);
		type.set ("assets/images/boy.png", AssetType.IMAGE);
		
		className.set ("assets/images/bullet.bak", __ASSET__assets_images_bullet_bak);
		type.set ("assets/images/bullet.bak", AssetType.BINARY);
		
		className.set ("assets/images/bullet.png", __ASSET__assets_images_bullet_png);
		type.set ("assets/images/bullet.png", AssetType.IMAGE);
		
		className.set ("assets/images/coin.bak", __ASSET__assets_images_coin_bak);
		type.set ("assets/images/coin.bak", AssetType.BINARY);
		
		className.set ("assets/images/coin.png", __ASSET__assets_images_coin_png);
		type.set ("assets/images/coin.png", AssetType.IMAGE);
		
		className.set ("assets/images/copter.bak", __ASSET__assets_images_copter_bak);
		type.set ("assets/images/copter.bak", AssetType.BINARY);
		
		className.set ("assets/images/copter.png", __ASSET__assets_images_copter_png);
		type.set ("assets/images/copter.png", AssetType.IMAGE);
		
		className.set ("assets/images/elevator.bak", __ASSET__assets_images_elevator_bak);
		type.set ("assets/images/elevator.bak", AssetType.BINARY);
		
		className.set ("assets/images/elevator.png", __ASSET__assets_images_elevator_png);
		type.set ("assets/images/elevator.png", AssetType.IMAGE);
		
		className.set ("assets/images/explosion.bak", __ASSET__assets_images_explosion_bak);
		type.set ("assets/images/explosion.bak", AssetType.BINARY);
		
		className.set ("assets/images/explosion.png", __ASSET__assets_images_explosion_png);
		type.set ("assets/images/explosion.png", AssetType.IMAGE);
		
		className.set ("assets/images/health.bak", __ASSET__assets_images_health_bak);
		type.set ("assets/images/health.bak", AssetType.BINARY);
		
		className.set ("assets/images/health.png", __ASSET__assets_images_health_png);
		type.set ("assets/images/health.png", AssetType.IMAGE);
		
		className.set ("assets/images/heart.bak", __ASSET__assets_images_heart_bak);
		type.set ("assets/images/heart.bak", AssetType.BINARY);
		
		className.set ("assets/images/heart.png", __ASSET__assets_images_heart_png);
		type.set ("assets/images/heart.png", AssetType.IMAGE);
		
		className.set ("assets/images/introExpl.png", __ASSET__assets_images_introexpl_png);
		type.set ("assets/images/introExpl.png", AssetType.IMAGE);
		
		className.set ("assets/images/intro_bldg.png", __ASSET__assets_images_intro_bldg_png);
		type.set ("assets/images/intro_bldg.png", AssetType.IMAGE);
		
		className.set ("assets/images/missileMoe.bak", __ASSET__assets_images_missilemoe_bak);
		type.set ("assets/images/missileMoe.bak", AssetType.BINARY);
		
		className.set ("assets/images/missileMoe.png", __ASSET__assets_images_missilemoe_png);
		type.set ("assets/images/missileMoe.png", AssetType.IMAGE);
		
		className.set ("assets/images/numbers.bak", __ASSET__assets_images_numbers_bak);
		type.set ("assets/images/numbers.bak", AssetType.BINARY);
		
		className.set ("assets/images/numbers.png", __ASSET__assets_images_numbers_png);
		type.set ("assets/images/numbers.png", AssetType.IMAGE);
		
		className.set ("assets/images/press_a.png", __ASSET__assets_images_press_a_png);
		type.set ("assets/images/press_a.png", AssetType.IMAGE);
		
		className.set ("assets/images/sweat.png", __ASSET__assets_images_sweat_png);
		type.set ("assets/images/sweat.png", AssetType.IMAGE);
		
		className.set ("assets/images/tiles.png", __ASSET__assets_images_tiles_png);
		type.set ("assets/images/tiles.png", AssetType.IMAGE);
		
		className.set ("assets/images/tiles1.png", __ASSET__assets_images_tiles1_png);
		type.set ("assets/images/tiles1.png", AssetType.IMAGE);
		
		className.set ("assets/images/tiles2.png", __ASSET__assets_images_tiles2_png);
		type.set ("assets/images/tiles2.png", AssetType.IMAGE);
		
		className.set ("assets/images/tiles3.png", __ASSET__assets_images_tiles3_png);
		type.set ("assets/images/tiles3.png", AssetType.IMAGE);
		
		className.set ("assets/images/tiles4.png", __ASSET__assets_images_tiles4_png);
		type.set ("assets/images/tiles4.png", AssetType.IMAGE);
		
		className.set ("assets/images/tiles5.png", __ASSET__assets_images_tiles5_png);
		type.set ("assets/images/tiles5.png", AssetType.IMAGE);
		
		className.set ("assets/images/tiles6.png", __ASSET__assets_images_tiles6_png);
		type.set ("assets/images/tiles6.png", AssetType.IMAGE);
		
		className.set ("assets/images/title.png", __ASSET__assets_images_title_png);
		type.set ("assets/images/title.png", AssetType.IMAGE);
		
		className.set ("assets/images/twump.bak", __ASSET__assets_images_twump_bak);
		type.set ("assets/images/twump.bak", AssetType.BINARY);
		
		className.set ("assets/images/twump.png", __ASSET__assets_images_twump_png);
		type.set ("assets/images/twump.png", AssetType.IMAGE);
		
		className.set ("assets/images/uiBGthing.bak", __ASSET__assets_images_uibgthing_bak);
		type.set ("assets/images/uiBGthing.bak", AssetType.BINARY);
		
		className.set ("assets/images/uiBGthing.png", __ASSET__assets_images_uibgthing_png);
		type.set ("assets/images/uiBGthing.png", AssetType.IMAGE);
		
		className.set ("assets/music/3333.mp3", __ASSET__assets_music_3333_mp3);
		type.set ("assets/music/3333.mp3", AssetType.MUSIC);
		
		className.set ("assets/music/untitled_2.mp3", __ASSET__assets_music_untitled_2_mp3);
		type.set ("assets/music/untitled_2.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/explode.mp3", __ASSET__assets_sounds_explode_mp3);
		type.set ("assets/sounds/explode.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/get.mp3", __ASSET__assets_sounds_get_mp3);
		type.set ("assets/sounds/get.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/hit.mp3", __ASSET__assets_sounds_hit_mp3);
		type.set ("assets/sounds/hit.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/jump.mp3", __ASSET__assets_sounds_jump_mp3);
		type.set ("assets/sounds/jump.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/shooot.mp3", __ASSET__assets_sounds_shooot_mp3);
		type.set ("assets/sounds/shooot.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/toss.mp3", __ASSET__assets_sounds_toss_mp3);
		type.set ("assets/sounds/toss.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/tosstoss.mp3", __ASSET__assets_sounds_tosstoss_mp3);
		type.set ("assets/sounds/tosstoss.mp3", AssetType.MUSIC);
		
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
@:keep @:bind #if display private #end class __ASSET__assets_images_armyman_bak extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_armyman_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bg_bak extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bg2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bgmtn1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bgmtn2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_boy_bak extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_boy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bullet_bak extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_bullet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_coin_bak extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_coin_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_copter_bak extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_copter_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_elevator_bak extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_elevator_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_explosion_bak extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_explosion_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_health_bak extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_health_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_heart_bak extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_heart_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_introexpl_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_intro_bldg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_missilemoe_bak extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_missilemoe_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_numbers_bak extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_numbers_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_press_a_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sweat_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tiles_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tiles1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tiles2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tiles3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tiles4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tiles5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tiles6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_title_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_twump_bak extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_twump_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_uibgthing_bak extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_uibgthing_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_music_3333_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_music_untitled_2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_explode_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_get_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_hit_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_jump_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_shooot_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_toss_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_tosstoss_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_beep_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_flixel_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_arial_ttf extends flash.text.Font { }


#elseif html5




































































@:keep #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { super (); name = "Nokia Cellphone FC Small"; } } 
@:keep #if display private #end class __ASSET__assets_fonts_arial_ttf extends lime.text.Font { public function new () { super (); name = "Arial"; } } 


#else



#if (windows || mac || linux)


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
@:file("assets/images/armyman.bak") #if display private #end class __ASSET__assets_images_armyman_bak extends lime.utils.ByteArray {}
@:image("assets/images/armyman.png") #if display private #end class __ASSET__assets_images_armyman_png extends lime.graphics.Image {}
@:file("assets/images/bg.bak") #if display private #end class __ASSET__assets_images_bg_bak extends lime.utils.ByteArray {}
@:image("assets/images/bg.png") #if display private #end class __ASSET__assets_images_bg_png extends lime.graphics.Image {}
@:image("assets/images/bg2.png") #if display private #end class __ASSET__assets_images_bg2_png extends lime.graphics.Image {}
@:image("assets/images/bgMtn1.png") #if display private #end class __ASSET__assets_images_bgmtn1_png extends lime.graphics.Image {}
@:image("assets/images/bgMtn2.png") #if display private #end class __ASSET__assets_images_bgmtn2_png extends lime.graphics.Image {}
@:file("assets/images/boy.bak") #if display private #end class __ASSET__assets_images_boy_bak extends lime.utils.ByteArray {}
@:image("assets/images/boy.png") #if display private #end class __ASSET__assets_images_boy_png extends lime.graphics.Image {}
@:file("assets/images/bullet.bak") #if display private #end class __ASSET__assets_images_bullet_bak extends lime.utils.ByteArray {}
@:image("assets/images/bullet.png") #if display private #end class __ASSET__assets_images_bullet_png extends lime.graphics.Image {}
@:file("assets/images/coin.bak") #if display private #end class __ASSET__assets_images_coin_bak extends lime.utils.ByteArray {}
@:image("assets/images/coin.png") #if display private #end class __ASSET__assets_images_coin_png extends lime.graphics.Image {}
@:file("assets/images/copter.bak") #if display private #end class __ASSET__assets_images_copter_bak extends lime.utils.ByteArray {}
@:image("assets/images/copter.png") #if display private #end class __ASSET__assets_images_copter_png extends lime.graphics.Image {}
@:file("assets/images/elevator.bak") #if display private #end class __ASSET__assets_images_elevator_bak extends lime.utils.ByteArray {}
@:image("assets/images/elevator.png") #if display private #end class __ASSET__assets_images_elevator_png extends lime.graphics.Image {}
@:file("assets/images/explosion.bak") #if display private #end class __ASSET__assets_images_explosion_bak extends lime.utils.ByteArray {}
@:image("assets/images/explosion.png") #if display private #end class __ASSET__assets_images_explosion_png extends lime.graphics.Image {}
@:file("assets/images/health.bak") #if display private #end class __ASSET__assets_images_health_bak extends lime.utils.ByteArray {}
@:image("assets/images/health.png") #if display private #end class __ASSET__assets_images_health_png extends lime.graphics.Image {}
@:file("assets/images/heart.bak") #if display private #end class __ASSET__assets_images_heart_bak extends lime.utils.ByteArray {}
@:image("assets/images/heart.png") #if display private #end class __ASSET__assets_images_heart_png extends lime.graphics.Image {}
@:image("assets/images/introExpl.png") #if display private #end class __ASSET__assets_images_introexpl_png extends lime.graphics.Image {}
@:image("assets/images/intro_bldg.png") #if display private #end class __ASSET__assets_images_intro_bldg_png extends lime.graphics.Image {}
@:file("assets/images/missileMoe.bak") #if display private #end class __ASSET__assets_images_missilemoe_bak extends lime.utils.ByteArray {}
@:image("assets/images/missileMoe.png") #if display private #end class __ASSET__assets_images_missilemoe_png extends lime.graphics.Image {}
@:file("assets/images/numbers.bak") #if display private #end class __ASSET__assets_images_numbers_bak extends lime.utils.ByteArray {}
@:image("assets/images/numbers.png") #if display private #end class __ASSET__assets_images_numbers_png extends lime.graphics.Image {}
@:image("assets/images/press_a.png") #if display private #end class __ASSET__assets_images_press_a_png extends lime.graphics.Image {}
@:image("assets/images/sweat.png") #if display private #end class __ASSET__assets_images_sweat_png extends lime.graphics.Image {}
@:image("assets/images/tiles.png") #if display private #end class __ASSET__assets_images_tiles_png extends lime.graphics.Image {}
@:image("assets/images/tiles1.png") #if display private #end class __ASSET__assets_images_tiles1_png extends lime.graphics.Image {}
@:image("assets/images/tiles2.png") #if display private #end class __ASSET__assets_images_tiles2_png extends lime.graphics.Image {}
@:image("assets/images/tiles3.png") #if display private #end class __ASSET__assets_images_tiles3_png extends lime.graphics.Image {}
@:image("assets/images/tiles4.png") #if display private #end class __ASSET__assets_images_tiles4_png extends lime.graphics.Image {}
@:image("assets/images/tiles5.png") #if display private #end class __ASSET__assets_images_tiles5_png extends lime.graphics.Image {}
@:image("assets/images/tiles6.png") #if display private #end class __ASSET__assets_images_tiles6_png extends lime.graphics.Image {}
@:image("assets/images/title.png") #if display private #end class __ASSET__assets_images_title_png extends lime.graphics.Image {}
@:file("assets/images/twump.bak") #if display private #end class __ASSET__assets_images_twump_bak extends lime.utils.ByteArray {}
@:image("assets/images/twump.png") #if display private #end class __ASSET__assets_images_twump_png extends lime.graphics.Image {}
@:file("assets/images/uiBGthing.bak") #if display private #end class __ASSET__assets_images_uibgthing_bak extends lime.utils.ByteArray {}
@:image("assets/images/uiBGthing.png") #if display private #end class __ASSET__assets_images_uibgthing_png extends lime.graphics.Image {}
@:file("assets/music/3333.mp3") #if display private #end class __ASSET__assets_music_3333_mp3 extends lime.utils.ByteArray {}
@:file("assets/music/untitled_2.mp3") #if display private #end class __ASSET__assets_music_untitled_2_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/explode.mp3") #if display private #end class __ASSET__assets_sounds_explode_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/get.mp3") #if display private #end class __ASSET__assets_sounds_get_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/hit.mp3") #if display private #end class __ASSET__assets_sounds_hit_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/jump.mp3") #if display private #end class __ASSET__assets_sounds_jump_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/shooot.mp3") #if display private #end class __ASSET__assets_sounds_shooot_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/toss.mp3") #if display private #end class __ASSET__assets_sounds_toss_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/tosstoss.mp3") #if display private #end class __ASSET__assets_sounds_tosstoss_mp3 extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/git/assets/sounds/beep.mp3") #if display private #end class __ASSET__assets_sounds_beep_mp3 extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/git/assets/sounds/flixel.mp3") #if display private #end class __ASSET__assets_sounds_flixel_mp3 extends lime.utils.ByteArray {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/git/assets/fonts/nokiafc22.ttf") #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends lime.text.Font {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/git/assets/fonts/arial.ttf") #if display private #end class __ASSET__assets_fonts_arial_ttf extends lime.text.Font {}



#end

#if openfl
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fontPath = "assets/fonts/nokiafc22.ttf"; name = "Nokia Cellphone FC Small"; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_arial_ttf extends openfl.text.Font { public function new () { __fontPath = "assets/fonts/arial.ttf"; name = "Arial"; super (); }}

#end

#end
#end

