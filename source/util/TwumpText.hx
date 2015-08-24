package util;
import flixel.graphics.frames.FlxBitmapFont;
import flixel.math.FlxPoint;
import flixel.text.FlxBitmapText;
import flixel.text.FlxText.FlxTextAlign;
import flixel.FlxG;

/**
 * ...
 * @author x01010111
 */
class TwumpText extends FlxBitmapText
{
	var tempText:String;
	var textArray:Array<String>;
	var wiggleTimer:Int = 0;
	
	public function new(X:Float, Y:Float, TEXT:String = "NO TEXT", ?ALIGN:FlxTextAlign, WIDTH:Int = -1) 
	{
		var letters:String = "0123456789:,<>";
		var letterSize:FlxPoint = new FlxPoint(13, 18);
		var font:FlxBitmapFont = FlxBitmapFont.fromMonospace("assets/images/numbers.png", letters, letterSize);
		
		super(font);
		autoSize = false;
		WIDTH == -1? set_fieldWidth(FlxG.width): set_fieldWidth(WIDTH);
		ALIGN != null? alignment = ALIGN: alignment = FlxTextAlign.LEFT;
		tempText = TEXT;
		textArray = tempText.split("");
		lineSpacing = 0;
		letterSpacing = -1;
		
		setPosition(X, Y);
		scrollFactor.set();
	}
	
	override public function update(elapsed:Float):Void 
	{
		if (wiggleTimer == 0)
		{
			wiggleTimer = 3;
			offset.set(ZMath.randomRange( -1, 1), ZMath.randomRange( -1, 1));
		}
		else wiggleTimer--;
		super.update(elapsed);
	}
	
}