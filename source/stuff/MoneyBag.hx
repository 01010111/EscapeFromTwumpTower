package stuff;
import flixel.math.FlxPoint;
import flixel.tweens.FlxTween;
import openfl.display.BlendMode;
import util.ZMath;
import flixel.FlxG;

/**
 * ...
 * @author x01010111
 */
class MoneyBag extends Exploder
{

	public function new(P:FlxPoint, V:Bool = false ) 
	{
		super(P);
		loadGraphic("assets/images/tiles.png", true, 16, 16);
		animation.frameIndex = 35;
		setSize(16, 12);
		offset.set(0, 4);
		explode = false;
		if (V) velocity.set(ZMath.randomRange( -100, 100), ZMath.randomRange( -100, -200));
		weight = 50;
	}
	
	var killswitch:Bool;
	
	override public function update(elapsed:Float):Void 
	{
		if (!killswitch)
		{
			if (held)
			{
				FlxG.sound.play("assets/sounds/get.mp3", 0.3);
				killswitch = true;
				PlayState.instance.theDonul.holding = false;
				blend = BlendMode.ADD;
				FlxTween.tween(this, { y:y - 16 }, 0.2);
				FlxTween.tween(scale, { x:0, y:2 }, 0.2).onComplete = function(t:FlxTween):Void { reallyKill(); }
				PlayState.instance.money += 500;
			}
		}
		super.update(elapsed);
	}
	
	override public function kill():Void 
	{
		//super.kill();
	}
	
	function reallyKill():Void
	{
		super.kill();
	}
	
}