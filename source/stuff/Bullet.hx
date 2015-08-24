package stuff;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import util.ZMath;

/**
 * ...
 * @author x01010111
 */
class Bullet extends FlxSprite
{
	var timer = 4;
	public function new(P:FlxPoint, XV:Float) 
	{
		super(P.x, P.y, "assets/images/bullet.png");
		velocity.x = XV;
		velocity.y = ZMath.randomRange( -5, 5);
		scale.x = XV < 0 ? -1 : 1;
		setSize(3, 2);
		offset.set(3, 3);
		var e = new Explosion(P);
		PlayState.instance.bullets.add(this);
		//allowCollisions = 0x0000;
	}
	
	override public function kill():Void 
	{
		timer--;
		if (timer <= 0) allowCollisions = 0x1111;
		var e = new Explosion(getMidpoint());
		super.kill();
	}
	
}