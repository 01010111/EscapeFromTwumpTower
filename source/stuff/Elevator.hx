package stuff;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;

/**
 * ...
 * @author x01010111
 */
class Elevator extends FlxSprite
{
	
	var top:FlxObject;
	
	public function new(p:FlxPoint, w:FlxPoint) 
	{
		super(p.x, p.y + 16, "assets/images/elevator.png");
		setSize(32, 14);
		offset.set(0, 48);
		allowCollisions = 0x0100;
		immovable = true;
		elevate(p.y + 16, w.y + 16);
		top = new FlxObject(x, p.y - 47, 32, 14);
		top.immovable = true;
		top.allowCollisions = 0x0100;
		PlayState.instance.add(top);
	}
	
	function elevate(p1:Float, p2:Float):Void
	{
		FlxTween.tween(this, { y:p2 }, Math.abs(p1 - p2) / 64).onComplete = function(t:FlxTween):Void
		{
			new FlxTimer().start(2).onComplete = function(t:FlxTimer):Void
			{
				FlxTween.tween(this, { y:p1 }, Math.abs(p1 - p2) / 64).onComplete = function(t:FlxTween):Void
				{
					new FlxTimer().start(2).onComplete = function(t:FlxTimer):Void { elevate(p1, p2); }
				}
			}
		}
	}
	
	override public function update(elapsed:Float):Void 
	{
		top.y = y - 47;
		super.update(elapsed);
		FlxG.collide(top, PlayState.instance.theDonul);
	}
	
}