package stuff;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.tweens.FlxTween;
import openfl.display.BlendMode;
import util.ZMath;

/**
 * ...
 * @author x01010111
 */
class Heart extends FlxSprite
{

	public function new(P:FlxPoint) 
	{
		super(P.x - 6, P.y - 6, "assets/images/heart.png");
		setSize(12, 12);
		offset.set(2, 2);
		//FlxTween.tween(scale, { x:1.2, y:1.2 }, 1, { type:FlxTween.PINGPONG } );
		PlayState.instance.add(this);
	}
	
	var gone = false;
	
	override public function update(e:Float):Void 
	{
		if (!gone && FlxG.overlap(this, PlayState.instance.theDonul))
		{
			gone = true;
			FlxG.sound.play("assets/sounds/get.mp3", 0.3);
			PlayState.instance.theDonul.health = ZMath.clamp(PlayState.instance.theDonul.health + 1, 0, 4);
			FlxTween.tween(this, { y:y - 16, alpha:0 }, 0.2).onComplete = function(t:FlxTween):Void { reallyKill(); }
			blend = BlendMode.ADD;
		}
		super.update(e);
	}
	
	function reallyKill():Void
	{
		super.kill();
	}
	
}