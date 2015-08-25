package stuff;
import flixel.math.FlxPoint;
import util.ZMath;

/**
 * ...
 * @author x01010111
 */
class Computer extends Exploder
{

	public function new(P:FlxPoint) 
	{
		super(P);
		loadGraphic("assets/images/tiles.png", true, 16, 16);
		animation.frameIndex = ZMath.randomRangeInt(37, 39);
		destructable = true;
		setWeight(30);
		PlayState.instance.stuff.add(this);
	}
	
}