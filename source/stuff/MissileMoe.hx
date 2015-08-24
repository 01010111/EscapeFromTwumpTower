package stuff;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import util.ZMath;

/**
 * ...
 * @author x01010111
 */
class MissileMoe extends Exploder
{
	var nose:FlxObject;
	public function new(P:FlxPoint) 
	{
		super(P);
		loadGraphic("assets/images/missileMoe.png");
		velocity.x = ZMath.randomRange(40, 50);
		nose = new FlxObject(0, 0, 20, 10);
		PlayState.instance.add(nose);
		setFacingFlip(FlxObject.RIGHT, true, false);
		setFacingFlip(FlxObject.LEFT, false, false);
		facing = FlxObject.RIGHT;
		PlayState.instance.stuff.add(this);
		immovable = true;
		acceleration.y = 0;
		useGravity = false;
		constructor = true;
	}
	
	override public function update(elapsed:Float):Void 
	{
		nose.setPosition(x - 2, y + 6);
		if (!heldSwitch)
		{
			if (FlxG.collide(nose, PlayState.instance.level)) turnAround();
			if (FlxG.overlap(nose, PlayState.instance.theDonul))
			{
				for (i in 0...3) PlayState.instance.explosions.add(new Explosion(FlxPoint.get(getMidpoint().x + ZMath.randomRange( -10, 10), getMidpoint().y + ZMath.randomRange( -10, 10)), Math.random() + 1));
				kill();
				PlayState.instance.theDonul.hurt(1);
			}
		}
		else 
		{
			useGravity = true;
			immovable = false;
		}
		
		if (useGravity && justTouched(FlxObject.FLOOR)) kill();
		
		super.update(elapsed);
	}
	
	override public function kill():Void 
	{
		nose.kill();
		super.kill();
	}
	
	function turnAround():Void
	{
		if (facing == FlxObject.LEFT)
		{
			facing = FlxObject.RIGHT;
			velocity.x = ZMath.randomRange(40, 50);
		}
		else
		{
			facing = FlxObject.LEFT;
			velocity.x = ZMath.randomRange(40, 50) * -1;
		}
	}
	
}