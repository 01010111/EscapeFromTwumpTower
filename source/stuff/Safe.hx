package stuff;
import flixel.math.FlxPoint;
import util.ZMath;

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
	
	override public function update(elapsed:Float):Void 
	{
		if (heldSwitch) destructable = true;
		super.update(elapsed);
	}
	
	override public function kill():Void 
	{
		for (i in 0...5)
		{
			PlayState.instance.coins.add(new Coin(getMidpoint(), ZMath.velocityFromAngle(ZMath.randomRange(200, 340), ZMath.randomRange(150, 250)), true));
		}
		for (i in 0...2)
		{
			var m = new MoneyBag(getMidpoint(), true);
		}
		super.kill();
	}
	
}