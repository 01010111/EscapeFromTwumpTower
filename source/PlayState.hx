package;

import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.addons.weapon.FlxBullet;
import flixel.FlxCamera.FlxCameraFollowStyle;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.math.FlxPoint;
import flixel.tile.FlxTilemap;
import flixel.tweens.FlxEase.EaseFunction;
import stuff.ArmyMan;
import stuff.Block;
import stuff.Box;
import stuff.Bullet;
import stuff.Coin;
import stuff.Copter;
import stuff.MissileMoe;
import stuff.MoneyBag;
import stuff.Safe;
import stuff.Twump;
import stuff.Twumper;
import util.Health;
import util.Transition;
import util.TState;
import stuff.Exploder;
import stuff.Elevator;
import util.TwumpText;
import flixel.text.FlxText.FlxTextAlign;

class PlayState extends TState
{
	static public var instance:PlayState;
	
	public var theDonul:Twump;
	public var stuff:FlxTypedGroup<Exploder>;
	public var elevators:FlxTypedGroup<Elevator>;
	public var explosions:FlxGroup;
	public var coins:FlxGroup;
	public var bullets:FlxGroup;
	
	var map:FlxOgmoLoader;
	public var level:FlxTilemap;
	public var money:Int = 0;
	var moneyText:TwumpText;
	
	var timerText:TwumpText;
	var timerMSec:Int = 0;
	var timerSec:Int = 0;
	var timerMin:Int = 0;
	
	override public function create():Void 
	{
		super.create();
		
		instance = this;
		
		stuff = new FlxTypedGroup();
		elevators = new FlxTypedGroup();
		explosions = new FlxGroup();
		coins = new FlxGroup();
		bullets = new FlxGroup();
		
		map = new FlxOgmoLoader("assets/data/tower.oel");
		level = map.loadTilemap("assets/images/tiles.png", 16, 16, "map");
		var tP:Array<Int> = [
			0x0000, 0x1111, 0x1111, 0x1111, 0x1111, 0x0000, 0x1111, 0x1111, 
			0x0000, 0x0100, 0x0100, 0x0100, 0x1111, 0x0000, 0x1111, 0x1111, 
			0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x1111, 0x1111, 
			0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x1111, 0x1111, 
			0x1111, 0x1111, 0x1111, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 
			0x0100, 0x0100, 0x0100, 0x0000, 0x0000, 0x0100, 0x0000, 0x1111, 
			0x0000, 0x0000, 0x1111, 0x0000, 0x0000, 0x1111, 0x1111, 0x1111, 
			0x1111, 0x1111, 0x1111, 0x0000, 0x0000, 0x1111, 0x1111, 0x0000, 
		];
		for (i in 0...tP.length) level.setTileProperties(i, tP[i]);
		add(level);
		add(elevators);
		map.loadEntities(placeObjects, "objects");
		add(stuff);
		add(new Copter());
		add(bullets);
		add(coins);
		add(explosions);
		
		var uiBG1 = new FlxSprite(0, FlxG.height - 32, "assets/images/uiBGthing.png");
		uiBG1.scrollFactor.set();
		add(uiBG1);
		
		var uiBG2 = new FlxSprite(FlxG.width - 80, FlxG.height - 32, "assets/images/uiBGthing.png");
		uiBG2.scrollFactor.set();
		uiBG2.scale.x = -1;
		add(uiBG2);
		
		moneyText = new TwumpText( -4, FlxG.height - 20, "", FlxTextAlign.RIGHT);
		add(moneyText);
		timerText = new TwumpText( 4, FlxG.height - 20, "");
		add(timerText);
		var h = new Health();
		
		FlxG.camera.follow(theDonul, FlxCameraFollowStyle.TOPDOWN);
		FlxG.camera.setScrollBoundsRect(0, 0, level.width, level.height, true);
		
		openSubState(new Transition(true));
	}
	
	function placeObjects(entityName:String, entityData:Xml):Void
	{
		var p:FlxPoint = FlxPoint.get(Std.parseInt(entityData.get("x")), Std.parseInt(entityData.get("y")));
		if (entityName == "twump") 
		{
			theDonul = new Twump(p);
		}
		else if (entityName == "elevator") 
		{
			var e:Xml = entityData.firstElement();
			elevators.add(new Elevator(p, FlxPoint.get(Std.parseInt(e.get("x")), Std.parseInt(e.get("y")))));
		}
		else if (entityName == "box")
		{
			var b = new Box(p);
		}
		else if (entityName == "block")
		{
			var b = new Block(p);
		}
		else if (entityName == "safe")
		{
			var s = new Safe(p);
		}
		else if (entityName == "coin")
		{
			var c = new Coin(p, FlxPoint.get());
		}
		else if (entityName == "moe")
		{
			var m = new MissileMoe(p);
		}
		else if (entityName == "trumper")
		{
			var t = new Twumper(p);
		}
		else if (entityName == "moneybag")
		{
			var m = new MoneyBag(p);
		}
		else if (entityName == "armyman")
		{
			var a = new ArmyMan(p);
		}
	}
	
	override public function update(elapsed:Float):Void 
	{
		if (FlxG.keys.justPressed.R) FlxG.switchState(new PlayState());
		
		super.update(elapsed);
		
		setMoneyText();
		setTimerText();
		
		FlxG.collide(elevators, stuff);
		FlxG.collide(elevators, theDonul);
		FlxG.collide(level, stuff);
		FlxG.collide(level, theDonul);
		FlxG.collide(level, coins);
		//FlxG.collide(stuff, coins);
		FlxG.collide(stuff, stuff, checkStuffOut);
		FlxG.collide(stuff, theDonul);
		
		FlxG.overlap(theDonul, coins, getCoin);
		FlxG.overlap(bullets, theDonul, bulletHitD);
		FlxG.collide(bullets, level, bulletHitL);
		FlxG.overlap(bullets, stuff, bulletHitS);
	}
	
	function bulletHitD(b:Bullet, d:Twump):Void
	{
		b.kill();
		d.hurt(1);
	}
	
	function bulletHitL(b:Bullet, l:FlxObject):Void
	{
		b.kill();
	}
	
	function bulletHitS(b:Bullet, s:Exploder):Void
	{
		b.kill();
		if (s.destructable) s.kill();
	}
	
	function setMoneyText():Void
	{
		moneyText.text = "<>" + money;
	}
	
	function setTimerText():Void
	{
		timerMSec++;
		if (timerMSec >= 60)
		{
			timerMSec = 0;
			timerSec++;
			if (timerSec >= 60)
			{
				timerSec = 0;
				timerMin++;
			}
		}
		var ms = timerMSec < 10 ? "0" + timerMSec : "" + timerMSec;
		var s = timerSec < 10 ? "0" + timerSec : "" + timerSec;
		var m = timerMin < 10 ? "0" + timerMin : "" + timerMin;
		timerText.text = m + ":" + s + ":" + ms;
	}
	
	function getCoin(d:Twump, c:FlxObject):Void
	{
		if (c.alive) money += 10;
		c.kill();
	}
	
	function checkStuffOut(s1:Exploder, s2:Exploder):Void
	{
		if (s1.bounce || s2.bounce)
		{
			if (s1.destructable) s1.kill();
			if (s2.destructable) s2.kill();
		}
	}
	
}