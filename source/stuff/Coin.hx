package stuff;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import openfl.display.BlendMode;
import flixel.FlxG;

/**
 * ...
 * @author x01010111
 */
class Coin extends FlxSprite
{

	public function new(P:FlxPoint, V:FlxPoint, S:Bool = false) 
	{
		super(P.x + 6, P.y + 4);
		loadGraphic("assets/images/coin.png", true, 16, 16);
		animation.add("play", [0, 1, 2, 3], 12);
		animation.play("play");
		setSize(4, 8);
		offset.set(6, 4);
		velocity.set(V.x, V.y);
		if (S) drag.set(300, 300);
		PlayState.instance.coins.add(this);
		elasticity = 0.25;
		if (S) acceleration.y = 500;
	}
	
	override public function update(e:Float):Void
	{
		if (justTouched(FlxObject.FLOOR)) acceleration.y = 0;
		if (velocity.x == 0 && velocity.y == 0) allowCollisions = 0x1000;
		else allowCollisions = 0x1111;
		super.update(e);
	}
	
	override public function kill():Void 
	{
		alive = false;
		blend = BlendMode.ADD;
		FlxTween.tween(this, { y:y - 16 }, 0.2);
		FlxTween.tween(scale, { x:0, y:2 }, 0.2).onComplete = function(t:FlxTween):Void { reallyKill(); }
	}
	
	function reallyKill():Void
	{
		super.kill();
	}
	
}