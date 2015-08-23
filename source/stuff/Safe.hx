package stuff;
import flixel.math.FlxPoint;

/**
 * ...
 * @author x01010111
 */
class Safe extends Exploder
{

	public function new(P:FlxPoint) 
	{
		super(P);
		loadGraphic("assets/images/tiles.png", true, 32, 32);
		animation.frameIndex = 13;
		setWeight(200);
	}
	
}