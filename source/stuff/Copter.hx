package stuff;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import util.Transition;

/**
 * ...
 * @author x01010111
 */
class Copter extends FlxSprite
{
	
	public function new() 
	{
		super(FlxG.width * 0.5, 160);
		loadGraphic("assets/images/copter.png", true, 80, 48);
		animation.add("play", [0, 1, 2, 1], 10);
		setSize(16, 16);
		offset.set(8, 32);
		allowCollisions = 0x0100;
		immovable = true;
	}
	
	override public function update(elapsed:Float):Void 
	{
		FlxG.collide(this, PlayState.instance.theDonul, carryOff);
		
		
		super.update(elapsed);
	}
	
	function carryOff(c:Copter, d:Twump):Void
	{
		if (PlayState.instance.theDonul.canControl)
		{
			PlayState.instance.theDonul.canControl = false;
			animation.play("play");
			FlxTween.tween(animation.curAnim, { frameRate:48 }, 2).onComplete = function(t:FlxTween):Void
			{
				FlxTween.tween(this, { y: -64 }, 3, { ease:FlxEase.quadOut } ).onComplete = function(t:FlxTween):Void
				{
					PlayState.instance.openSubState(new Transition(false, true, false));
				}
			}
		}
	}
	
}