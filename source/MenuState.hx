package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxAxes;
import flixel.util.FlxColor;
import util.TState;

class MenuState extends TState
{
	var pink = true;
	
	override public function create():Void 
	{
		super.create();
		
		for (y in 0...8)
		{
			for (x in 0...10)
			{
				var s = new FlxSprite(x * 32, y * 32);
				pink ? s.makeGraphic(32, 32, 0xfff07a9b) : s.makeGraphic(32, 32, 0xfff8bfb2);
				pink ? pink = false : pink = true;
				s.scrollFactor.set();
				add(s);
			}
			pink ? pink = false : pink = true;
		}
		var title:FlxSprite = new FlxSprite(0, 0, "assets/images/title.png");
		title.screenCenter(FlxAxes.XY);
		title.scale.set();
		add(title);
		title.angle = -10;
		FlxTween.tween(title.scale, { x:2, y:2 }, 0.4, { ease:FlxEase.backOut } ).onComplete = function(t:FlxTween):Void { FlxTween.tween(title.scale, { x:1.5, y:1.5 }, 3, { type:FlxTween.PINGPONG, ease:FlxEase.sineInOut } ); }
		FlxTween.tween(title, { angle:10 }, 2, { ease:FlxEase.sineInOut, type:FlxTween.PINGPONG } );
		
		var inst:FlxText = new FlxText(0, FlxG.height * 0.9, FlxG.width, "SQUAT AND PULL YOU DEGENERATE");
		inst.setFormat(null, 8, 0xffffffff, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(inst);
	}
	
	override public function update(elapsed:Float):Void 
	{
		if (TState.c.down_pressed() && TState.c.b_just_pressed())
		{
			FlxG.switchState(new PlayState());
		}
		super.update(elapsed);
	}
	
}