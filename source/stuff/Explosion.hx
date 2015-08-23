package stuff;
import flixel.FlxSprite;
import flixel.math.FlxPoint;

/**
 * ...
 * @author x01010111
 */
class Explosion extends FlxSprite
{

	public function new(P:FlxPoint, S:Float = 1) 
	{
		super(P.x, P.y);
		loadGraphic("assets/images/explosion.png", true, 16, 16);
		animation.add("play", [0, 0, 1, 2, 3, 4, 5, 6, 7, 7, 8, 8, 8], 30, false);
		animation.play("play");
		offset.set(8, 8);
		scale.set(S, S);
		angle = Math.random() * 360;
		PlayState.instance.explosions.add(this);
	}
	
	override public function update(elapsed:Float):Void 
	{
		if (animation.finished) kill();
		super.update(elapsed);
	}
	
}