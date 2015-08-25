package stuff;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.math.FlxPoint;

/**
 * ...
 * @author x01010111
 */
class Twumper extends Exploder
{
	
	public function new(P:FlxPoint) 
	{
		super(P);
		loadGraphic("assets/images/boy.png", true, 16, 20);
		animation.add("walk", [0, 1, 2, 3], 12);
		animation.add("held", [4]);
		animation.play("walk");
		setSize(12, 16);
		offset.set(2, 4);
		velocity.x = 40;
		destructable = true;
		PlayState.instance.stuff.add(this);
		walker = true;
		drag.set();
		setFacingFlip(FlxObject.LEFT, true, false);
		setFacingFlip(FlxObject.RIGHT, false, false);
		immovable = true;
		useGravity = false;
	}
	
	override public function update(elapsed:Float):Void 
	{
		if (!heldSwitch)
		{
			if (isTouching(FlxObject.LEFT)) velocity.x = 40;
			if (isTouching(FlxObject.RIGHT)) velocity.x = -40;
			var fD = facing == FlxObject.LEFT ? x - 8 : x + width + 8;
			if (!PlayState.instance.level.overlapsPoint(FlxPoint.get(fD, y + height + 8)) || PlayState.instance.level.overlapsPoint(FlxPoint.get(fD, y + height - 8))) velocity.x *= -1;
			if (!held) velocity.x > 0 ? facing = FlxObject.RIGHT : facing = FlxObject.LEFT;
		}
		else
		{
			immovable = false;
			useGravity = true;
			animation.play("held");
		}
		super.update(elapsed);
	}
	
	override public function kill():Void 
	{
		var c = new Coin(getMidpoint(), FlxPoint.get(0, -120), true);
		super.kill();
	}
	
}