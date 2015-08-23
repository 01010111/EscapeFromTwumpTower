package stuff;
import flixel.FlxObject;
import flixel.math.FlxPoint;

/**
 * ...
 * @author x01010111
 */
class Block extends Exploder
{
	
	public function new(P:FlxPoint) 
	{
		super(P);
		loadGraphic("assets/images/tiles.png", true, 16, 16);
		animation.frameIndex = 43;
		constructor = true;
		setWeight(100);
	}
	
}