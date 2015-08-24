package util;
import flixel.FlxSprite;

/**
 * ...
 * @author x01010111
 */
class Health extends FlxSprite
{

	public function new() 
	{
		super(4, 4);
		loadGraphic("assets/images/health.png", true, 64, 16);
		scrollFactor.set();
		PlayState.instance.add(this);
	}
	
	override public function update(elapsed:Float):Void 
	{
		animation.frameIndex = Math.round(PlayState.instance.theDonul.health);
		super.update(elapsed);
	}
	
}