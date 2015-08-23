package;

import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.FlxCamera.FlxCameraFollowStyle;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.math.FlxPoint;
import flixel.tile.FlxTilemap;
import stuff.Block;
import stuff.Box;
import stuff.Coin;
import stuff.Safe;
import stuff.Twump;
import util.TState;
import stuff.Exploder;
import stuff.Elevator;

class PlayState extends TState
{
	static public var instance:PlayState;
	
	public var theDonul:Twump;
	public var stuff:FlxTypedGroup<Exploder>;
	public var elevators:FlxTypedGroup<Elevator>;
	public var explosions:FlxGroup;
	public var coins:FlxGroup;
	
	var map:FlxOgmoLoader;
	var level:FlxTilemap;
	
	override public function create():Void 
	{
		super.create();
		
		instance = this;
		
		stuff = new FlxTypedGroup();
		elevators = new FlxTypedGroup();
		explosions = new FlxGroup();
		coins = new FlxGroup();
		
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
		add(coins);
		add(explosions);
		
		FlxG.camera.follow(theDonul, FlxCameraFollowStyle.TOPDOWN);
		FlxG.camera.setScrollBoundsRect(0, 0, level.width, level.height, true);
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
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		FlxG.collide(elevators, stuff);
		FlxG.collide(elevators, theDonul);
		FlxG.collide(level, stuff);
		FlxG.collide(level, theDonul);
		FlxG.collide(level, coins);
		FlxG.collide(stuff, stuff, checkStuffOut);
		FlxG.collide(stuff, theDonul);
		
		FlxG.overlap(theDonul, coins, getCoin);
	}
	
	function getCoin(d:Twump, c:FlxObject):Void
	{
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