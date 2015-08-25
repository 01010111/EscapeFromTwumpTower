package stuff;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.math.FlxPoint;
import haxe.io.BufferInput;
/**
 * ...
 * @author x01010111
 */
class ArmyMan extends Exploder
{
	
	var hitbox:FlxObject;
	var timer:Int = 0;
	var bulletTimer:Int = 0;
	
	public function new(P:FlxPoint) 
	{
		super(P);
		loadGraphic("assets/images/armyman.png", true, 24, 24);
		setSize(12, 16);
		offset.set(6, 8);
		hitbox = new FlxObject(0, 0, 14, 10);
		PlayState.instance.add(hitbox);
		setFacingFlip(FlxObject.LEFT, true, false);
		setFacingFlip(FlxObject.RIGHT, false, false);
		drag.set(200, 200);
		destructable = true;
	}
	
	override public function update(elapsed:Float):Void 
	{
		if (isOnScreen())
		{
			if (bulletTimer > 0) bulletTimer--;
			if (timer > 0) timer--;
			hitbox.setPosition(x - 1, y + 8);
			if (PlayState.instance.theDonul.getMidpoint().x < getMidpoint().x)
			{
				facing = FlxObject.LEFT;
			}
			else 
			{
				facing = FlxObject.RIGHT;
			}
			
			if (!heldSwitch)
			{
				if (FlxG.overlap(hitbox, PlayState.instance.theDonul))
				{
					PlayState.instance.theDonul.hurt(1);
				}
				if (PlayState.instance.theDonul.y < y - 2 && Math.abs(PlayState.instance.theDonul.y - y) < 64) jump();
				if (bulletTimer == 0)
				{
					shoot();
					bulletTimer = 120;
				}
			}
			super.update(elapsed);
		}
	}
	
	function jump():Void
	{
		if (isTouching(FlxObject.FLOOR) && timer <= 0)
		{
			FlxG.sound.play("assets/sounds/jump.mp3", 0.2);
			velocity.y = -200;
			timer = 100;
		}
	}
	
	function shoot():Void
	{
		FlxG.sound.play("assets/sounds/shooot.mp3", 0.5);
		var b = facing == FlxObject.LEFT? new Bullet(FlxPoint.get(x - 10, y + 8), -60) : new Bullet(FlxPoint.get(x + width + 10, y + 8), 60);
	}
	
	override public function kill():Void 
	{
		hitbox.kill();
		if (PlayState.instance.theDonul.health < 4) var h = new Heart(getMidpoint());
		super.kill();
	}
	
}