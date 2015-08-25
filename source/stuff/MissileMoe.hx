package stuff;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.util.FlxPath;
import util.ZMath;

/**
 * ...
 * @author x01010111
 */
class MissileMoe extends Exploder
{
	var nose:FlxObject;
	public function new(P:FlxPoint, W:FlxPoint) 
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
		findPath(W);
	}
	
	var path:FlxPath;
	
	function findPath(W:FlxPoint):Void
	{
		path = new FlxPath().start(this, [getMidpoint(), FlxPoint.get(W.x + 8, W.y + 8)], 40, FlxPath.YOYO);
	}
	
	override public function update(elapsed:Float):Void 
	{
		if (velocity.x > 0) {
			facing = FlxObject.RIGHT;
		} else if (velocity.x < 0) {
			facing = FlxObject.LEFT;
		}
		
		nose.setPosition(x - 2, y + 6);
		if (!heldSwitch)
		{
			if (FlxG.overlap(nose, PlayState.instance.theDonul))
			{
				for (i in 0...3) PlayState.instance.explosions.add(new Explosion(FlxPoint.get(getMidpoint().x + ZMath.randomRange( -10, 10), getMidpoint().y + ZMath.randomRange( -10, 10)), Math.random() + 1));
				kill();
				PlayState.instance.theDonul.hurt(1);
			}
		}
		else 
		{
			if (path.active)
			{
				path.cancel();
			}
			useGravity = true;
			immovable = false;
			acceleration.y = 800;
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