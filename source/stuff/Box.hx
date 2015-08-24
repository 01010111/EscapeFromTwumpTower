package stuff;
import flixel.math.FlxPoint;
import util.ZMath;

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
	
	override public function kill():Void 
	{
		if (PlayState.instance.theDonul.health >= 4)
		{
			for (i in 0...3)
			{
				PlayState.instance.coins.add(new Coin(getMidpoint(), ZMath.velocityFromAngle(ZMath.randomRange(200, 340), ZMath.randomRange(150, 250)), true));
			}
		}
		else 
		{
			var h = new Heart(getMidpoint());
		}
		super.kill();
	}
	
}