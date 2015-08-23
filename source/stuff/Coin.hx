package stuff;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.tweens.FlxTween;
import openfl.display.BlendMode;

/**
 * ...
 * @author x01010111
 */
class Coin extends FlxSprite
{

	public function new(P:FlxPoint, V:FlxPoint) 
	{
		super(P.x, P.y);
		loadGraphic("assets/images/coin.png", true, 16, 16);
		animation.add("play", [0, 1, 2, 3], 12);
		animation.play("play");
		setSize(4, 4);
		offset.set(6, 6);
		velocity.set(V.x, V.y);
		drag.set(100, 100);
		PlayState.instance.coins.add(this);
	}
	
	override public function kill():Void 
	{
		blend = BlendMode.ADD;
		FlxTween.tween(scale, { x:0, y:2 }, 0.2).onComplete = function(t:FlxTween):Void { reallyKill(); }
		super.kill();
	}
	
	function reallyKill():Void
	{
		super.kill();
	}
	
}