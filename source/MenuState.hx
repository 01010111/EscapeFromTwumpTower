package;

import flixel.addons.display.FlxBackdrop;
import flixel.FlxCamera.FlxCameraFollowStyle;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxAxes;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import util.Transition;
import util.TState;

class MenuState extends TState
{
	var pink = true;
	
	override public function create():Void 
	{
		Reg.initSave();
		
		super.create();
		
		/*for (y in 0...8)
		{
			for (x in 0...10)
			{
				var s = new FlxSprite(x * 32, y * 32);
				pink ? s.makeGraphic(32, 32, 0xffc3959c) : s.makeGraphic(32, 32, 0xffffc48d);
				pink ? pink = false : pink = true;
				s.scrollFactor.set();
				add(s);
			}
			pink ? pink = false : pink = true;
		}
		var title:FlxSprite = new FlxSprite(0, 0, "assets/images/title.png");
		title.screenCenter(FlxAxes.XY);
		title.scale.set();
		add(title);
		title.angle = -10;
		FlxTween.tween(title.scale, { x:2, y:2 }, 0.4, { ease:FlxEase.backOut } ).onComplete = function(t:FlxTween):Void { FlxTween.tween(title.scale, { x:1.5, y:1.5 }, 3, { type:FlxTween.PINGPONG, ease:FlxEase.sineInOut } ); }
		FlxTween.tween(title, { angle:10 }, 2, { ease:FlxEase.sineInOut, type:FlxTween.PINGPONG } );
		
		var inst:FlxText = new FlxText(0, FlxG.height * 0.9, FlxG.width, "SQUAT AND PULL YOU DEGENERATE");
		inst.setFormat(null, 8, 0xffffffff, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(inst);*/
		
		FlxG.sound.music = new FlxSound();
		FlxG.sound.music.loadEmbedded("assets/music/untitled_2.mp3", false);
		FlxG.sound.music.play();
		
		var bg:FlxBackdrop = new FlxBackdrop("assets/images/bg2.png", 0, 0);
		bg.velocity.x = 10;
		add(bg);
		
		var bgm2:FlxBackdrop = new FlxBackdrop("assets/images/bgMtn2.png", 1, 1, true, false);
		var bgm1:FlxBackdrop = new FlxBackdrop("assets/images/bgMtn1.png", 1, 1, true, false);
		bgm2.setPosition(0, 1600 - 144 - 48);
		bgm1.setPosition(0, 1600 - 92 - 48);
		add(bgm2);
		add(bgm1);
		
		add(new FlxSprite(0, 0, "assets/images/intro_bldg.png"));
		
		var trumpster:FlxSprite = new FlxSprite(292 - 8, 144 - 32);
		trumpster.loadGraphic("assets/images/twump.png", true, 32, 32);
		trumpster.animation.add("play", [0, 1, 2, 3], 5);
		trumpster.animation.play("play");
		trumpster.scale.x = -1;
		add(trumpster);
		
		var topBar = new FlxSprite(0, 0);
		topBar.makeGraphic(FlxG.width, 20, 0xff000000);
		topBar.scrollFactor.set();
		add(topBar);
		
		var textBar = new FlxSprite(0, FlxG.height - 20);
		textBar.makeGraphic(FlxG.width, 20, 0xff000000);
		textBar.scrollFactor.set();
		add(textBar);
		
		var introText:FlxText = new FlxText(0, FlxG.height - 16);
		introText.setFormat(null, 8, 0xf8f5d4);
		introText.text = "                                     THE YEAR IS 202X...                                      AFTER A SUCCESSFUL REELECTION CAMPAIGN, PRESIDENT TWUMP FIRES THE ENTIRE USA ON A WHIM.         AFTER GETTING REPORTS OF ANGRY MOBS AT TWUMP TOWER, HE HURRIES TO RESCUE HIS VAST FORTUNE!";
		introText.scrollFactor.set(1, 0);
		add(introText);
		
		var dolly:FlxObject = new FlxObject(0, 1600 - FlxG.height * 0.5, 1, 1);
		add(dolly);
		
		new FlxTimer().start(0.5, addExp, 20);
		
		FlxG.camera.follow(dolly, FlxCameraFollowStyle.LOCKON);
		FlxG.camera.setScrollBoundsRect(0, 0, 320, 1600, true);
		
		FlxG.camera.flash(0xff000000, 0.5);
		
		new FlxTimer().start(7.5).onComplete = function(t:FlxTimer):Void
		{
			FlxTween.tween(bgm1, { y:1200 }, 31.5, { ease:FlxEase.sineInOut } );
			FlxTween.tween(bgm2, { y:800 }, 31.5, { ease:FlxEase.sineInOut } );
			FlxTween.tween(introText, { x: -1500 }, 31.5);
			FlxTween.tween(dolly, { y:0 + FlxG.height * 0.5 }, 31.5, { ease:FlxEase.sineInOut } ).onComplete = function(t:FlxTween):Void
			{
				FlxG.camera.flash(0xffffffff, 0.3);
				
				var title:FlxSprite = new FlxSprite(0, 0, "assets/images/title.png");
				title.screenCenter();
				add(title);
				
				var instructions = new FlxSprite(0, FlxG.height * 0.65);
				instructions.loadGraphic("assets/images/press_a.png", true, 96, 16);
				instructions.animation.add("play", [0, 0, 1, 2, 2], 24);
				instructions.animation.play("play");
				instructions.screenCenter(FlxAxes.X);
				add(instructions);
				
				var titleText:FlxText = new FlxText(0, FlxG.height + 16);
				titleText.setFormat(null, 8, 0xf8f5d4);
				if (Reg.bestGld == 0)
				{
					titleText.text = "MADE IN 72 HOURS FOR LUDUM DARE 33 BY 01010111";
				}
				else
				{
					titleText.text = "BEST MONEY-$" + Reg.bestGld + "  BEST TIME-" + Reg.bestMin + ":" + Reg.bestSec + ":" + Reg.bestMSc + "  SAFES CRACKED-" + Reg.bestSaf + "/10";
				}
				titleText.screenCenter(FlxAxes.X);
				add(titleText);
				FlxTween.tween(titleText, { y:FlxG.height - 16 }, 2);
			}
		}
	}
	
	function addExp(t:FlxTimer):Void
	{
		FlxG.camera.flash(0x20f79955, 0.2);
		var e:FlxSprite = new FlxSprite(Math.random() * 240, Math.random() * 64 + 80);
		e.loadGraphic("assets/images/introExpl.png", true, 16, 16);
		e.animation.add("play", [0, 1, 2, 3, 4, 5], 24, false);
		e.animation.play("play");
		e.scrollFactor.set();
		e.scale.set(2, 2);
		add(e);
	}
	
	override public function update(elapsed:Float):Void 
	{
		if (TState.c.a_just_pressed())
		{
			openSubState(new Transition(false, false, false, true));
		}
		super.update(elapsed);
	}
	
}