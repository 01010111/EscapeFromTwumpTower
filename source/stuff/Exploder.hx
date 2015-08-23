package stuff;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;

/**
 * ...
 * @author x01010111
 */
class Exploder extends FlxSprite
{
	public var weight:Int = 10;
	public var weightInit:Int = 10;
	public var held:Bool = false;
	public var bounce:Bool = false;
	public var constructor:Bool = false;
	public var destructable:Bool = false;
	var hasSpawned:Bool = false;
	
	public function new(P:FlxPoint, TWUMP:Bool = false) 
	{
		super(P.x, P.y);
		TWUMP ? PlayState.instance.add(this) : PlayState.instance.stuff.add(this);
	}
	
	var yOff = 0.0;
	
	override public function update(elapsed:Float):Void 
	{
		if (isOnScreen())
		{
			if (justTouched(FlxObject.FLOOR)) 
			{
				if (!hasSpawned) hasSpawned = true;
				else if (bounce) 
				{
					bounce = false;
					velocity.y = -100;
				}
				else if (destructable)
				{
					kill();
				}
				weight = weightInit;
			}
			if (held)
			{
				yOff += (height - yOff) * 0.1;
				setPosition(PlayState.instance.theDonul.getMidpoint().x - width * 0.5, PlayState.instance.theDonul.y - yOff);
				allowCollisions = FlxObject.NONE;
				acceleration.y = 0;
			}
			else
			{
				yOff = 0;
				if (isTouching(FlxObject.FLOOR)) drag.x = 800;
				else drag.x = 0;
				allowCollisions = FlxObject.ANY;
				acceleration.y = 800;
			}
			super.update(elapsed);
		}
	}
	
	function setWeight(v:Float)
	{
		weight = weightInit = Math.floor(v);
	}
	
	override public function kill():Void 
	{
		var s = 0.0;
		height > width ? s = height : s = width;
		var e = new Explosion(getMidpoint(), s / 16 + Math.random() + 1);
		super.kill();
	}
	
}