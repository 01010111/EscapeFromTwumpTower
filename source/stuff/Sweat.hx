package stuff;
import flixel.FlxSprite;
import util.ZMath;

/**
 * ...
 * @author x01010111
 */
class Sweat extends FlxSprite
{

	public function new(X:Float, Y:Float) 
	{
		super(X, Y);
		loadGraphic("assets/images/sweat.png", true, 8, 8);
		animation.add("play", [0, 1, 2, 3, 4, 5], 24, false);
		animation.play("play");
		velocity.set(ZMath.randomRange( -10, 10), ZMath.randomRangeInt( -10, -20));
		PlayState.instance.add(this);
		offset.set(4, 4);
	}
	
	override public function update(elapsed:Float):Void 
	{
		if (animation.finished) kill();
		super.update(elapsed);
	}
	
}