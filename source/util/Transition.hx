package util;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.text.FlxText;
import flixel.util.FlxColor;

/**
 * ...
 * @author x01010111
 */
class Transition extends FlxSubState
{
	
	var prompt:Bool = false;
	var win:Bool = false;
	
	public function new(IN:Bool, WIN:Bool = false, LOSE:Bool = false) 
	{
		super();
		if (WIN || LOSE) prompt = true;
		else if (IN) transIn();
		else if (!IN) transOut();
		
		if (WIN)
		{
			win = true;
			var inst:FlxText = new FlxText(0, FlxG.height * 0.45, FlxG.width, "YOU WON. WHO CARES. PRESS A BUTTON");
			inst.setFormat(null, 16, 0xffffffff, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
			add(inst);
		}
		if (LOSE)
		{
			var inst:FlxText = new FlxText(0, FlxG.height * 0.45, FlxG.width, "YOU LOST. YOU SUCK. PRESS A BUTTON");
			inst.setFormat(null, 16, 0xffffffff, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
			add(inst);
		}
	}
	
	override public function update(elapsed:Float):Void 
	{
		if (prompt)
		{
			if (TState.c.a_just_pressed() || TState.c.b_just_pressed())
			{
				prompt = false;
				transOut();
			}
		}
		super.update(elapsed);
	}
	
	var pink:Bool = true;
	
	public function transIn():Void
	{
		for (y in 0...8)
		{
			for (x in 0...10)
			{
				var s = new FlxSprite(x * 32, y * 32);
				pink ? s.makeGraphic(32, 32, 0xfff07a9b) : s.makeGraphic(32, 32, 0xfff8bfb2);
				pink ? pink = false : pink = true;
				s.scrollFactor.set();
				add(s);
				new FlxTimer().start(Math.random()).onComplete = function(t:FlxTimer):Void { FlxTween.tween(s.scale, { x:0, y:0 }, 0.25); }
			}
			pink ? pink = false : pink = true;
		}
		
		new FlxTimer().start(1.25).onComplete = function(t:FlxTimer):Void { close(); }
	}
	
	public function transOut():Void
	{
		for (y in 0...8)
		{
			for (x in 0...10)
			{
				var s = new FlxSprite(x * 32, y * 32);
				pink ? s.makeGraphic(32, 32, 0xfff07a9b) : s.makeGraphic(32, 32, 0xfff8bfb2);
				pink ? pink = false : pink = true;
				s.scrollFactor.set();
				s.scale.set();
				add(s);
				new FlxTimer().start(Math.random()).onComplete = function(t:FlxTimer):Void { FlxTween.tween(s.scale, { x:1, y:1 }, 0.25); }
			}
			pink ? pink = false : pink = true;
		}
		
		new FlxTimer().start(1.25).onComplete = function(t:FlxTimer):Void { FlxG.switchState(new MenuState()); }
	}
	
}