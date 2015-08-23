package stuff;
import flixel.addons.effects.FlxWaveSprite.FlxWaveMode;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.util.FlxSpriteUtil;
import util.TState;

/**
 * ...
 * @author x01010111
 */
class Twump extends Exploder
{
	var pullBox:FlxObject;
	
	public var dolly:FlxObject;
	
	public function new(P:FlxPoint) 
	{
		super(P, true);
		loadGraphic("assets/images/twump.png", true, 32, 32);
		setSize(12, 16);
		offset.set(10, 16);
		animation.add("idle", [0, 1, 2, 3], 8);
		animation.add("run", [4, 5, 6, 7, 8, 9, 10, 11], 16);
		animation.add("jump", [25]);
		animation.add("squat", [12]);
		animation.add("pull", [13]);
		animation.add("hold_idle", [16]);
		animation.add("hold_run", [17, 18, 19, 20, 21, 22, 23, 24], 16);
		animation.add("hold_jump", [18]);
		animation.add("hold_squat", [16]);
		animation.add("held", [26]);
		animation.add("hurt", [26, 27]);
		animation.add("point", [28, 29, 30, 31, 31, 31, 31], 16, false);
		setFacingFlip(FlxObject.LEFT, true, false);
		setFacingFlip(FlxObject.RIGHT, false, false);
		pullBox = new FlxObject(0, 0, 4, 4);
		PlayState.instance.add(pullBox);
		dolly = new FlxObject(x, y, 1, 1);
		PlayState.instance.add(dolly);
	}
	
	var dollyTarget = 0.0;
	
	override public function update(elapsed:Float):Void 
	{
		held = false;
		pullBox.setPosition(x + 4, y + height + 2);
		control();
		super.update(elapsed);
		held = false;
		if (hurtTimer > 0)
		{
			hurtTimer--;
		}
		else if (hurtTimer == 0)
		{
			hurtTimer--;
			FlxSpriteUtil.flicker(this);
		}
	}
	
	var hurtTimer = -1;
	var speed = 80;
	var jumpForce = 240;
	var holding = false;
	var strength = 1;
	
	function control():Void
	{
		held = false;
		var h:String = "";
		if (holding) h = "hold_";
		if (velocity.x < 0) facing = FlxObject.LEFT;
		if (velocity.x > 0) facing = FlxObject.RIGHT;
		
		if (hurtTimer <= 0)
		{
			if (!TState.c.down_pressed()) velocity.x = TState.c.HAxis() * speed;
			else if (isTouching(FlxObject.FLOOR)) velocity.x = 0;
			
			if (isTouching(FlxObject.FLOOR))
			{
				if (velocity.x == 0) 
				{
					TState.c.down_pressed()? animation.play(h + "squat") : animation.play(h + "idle");
				}
				else animation.play(h + "run");
				if (TState.c.a_just_pressed()) jump();
			}
			else animation.play(h + "jump");
			
			if (animation.curAnim.name == "squat")
			{
				if (TState.c.b_pressed())
				{
					animation.play("pull");
					checkPulling();
				}
			}
			
			if (holding)
			{
				if (TState.c.b_just_pressed())
				{
					held = false;
					throwThing();
				}
			}
		}
		else animation.play("hurt");
	}
	
	function jump():Void
	{
		velocity.y = -jumpForce;
	}
	
	function checkPulling():Void
	{
		FlxG.overlap(pullBox, PlayState.instance.stuff, pullThing);
	}
	
	function pullThing(pB:FlxObject, t:Exploder):Void
	{
		if (t.weight <= 0) 
		{
			holding = true;
			t.held = true;
		}
		else t.weight -= strength;
	}
	
	function throwThing():Void
	{
		holding = false;
		for (thing in PlayState.instance.stuff)
		{
			if (thing.held)
			{
				if (!thing.constructor)
				{
					facing == FlxObject.LEFT ? thing.velocity.set( -200, -200) : thing.velocity.set(200, -200);
				}
				else
				{
					thing.y = y - thing.height + 16;
					thing.velocity.y = 50;
					jump();
				}
				thing.held = false;
				thing.bounce = true;
			}
		}
	}
	
	override public function hurt(Damage:Float):Void 
	{
		if (!FlxSpriteUtil.isFlickering(this) && animation.curAnim.name != "hurt")
		{
			super.hurt(Damage);
			hurtTimer = 60;
		}
		jump();
	}
	
}