package util;
import flixel.addons.display.FlxBackdrop;
import flixel.FlxG;
import flixel.FlxState;

/**
 * ...
 * @author x01010111
 */
class TState extends FlxState
{
	public static var c:Controller;
	
	override public function create():Void 
	{
		FlxG.mouse.visible = false;
		
		if (c == null) c = new Controller();
		add(c);
		
		add(new FlxBackdrop("assets/images/bg.png", 0, 0, true, false));
		
		super.create();
	}
	
}