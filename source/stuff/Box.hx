package stuff;
import flixel.math.FlxPoint;

/**
 * ...
 * @author x01010111
 */
class Box extends Exploder
{

	public function new(P:FlxPoint) 
	{
		super(P);
		loadGraphic("assets/images/tiles.png", true, 16, 16);
		animation.frameIndex = 36;
		destructable = true;
	}
	
}