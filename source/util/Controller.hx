package util;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.input.gamepad.FlxGamepad;
import flixel.input.gamepad.FlxGamepadInputID;
import flixel.input.gamepad.id.XBox360ID;

/**
 * ...
 * @author x01010111
 */
class Controller extends FlxObject
{
	
	var joypad:FlxGamepad;
	
	public function new() 
	{
		super();
		joypad = FlxG.gamepads.firstActive;
	}
	
	var deadzone = 0.2;
	
	public function HAxis():Float
	{
		var v = 0.0;
		if (FlxG.keys.pressed.LEFT || FlxG.keys.pressed.A || joypad != null && joypad.getXAxis(FlxGamepadInputID.LEFT_ANALOG_STICK) <= -deadzone || joypad != null && joypad.pressed.DPAD_LEFT) v--;
		if (FlxG.keys.pressed.RIGHT || FlxG.keys.pressed.D || joypad != null && joypad.getXAxis(FlxGamepadInputID.LEFT_ANALOG_STICK) >= deadzone || joypad != null && joypad.pressed.DPAD_RIGHT) v++;
		return v;
	}
	
	public function a_just_pressed():Bool
	{
		return FlxG.keys.justPressed.X || FlxG.keys.justPressed.K || joypad != null && joypad.justPressed.A;
	}
	
	public function b_just_pressed():Bool
	{
		return FlxG.keys.justPressed.C || FlxG.keys.justPressed.L || joypad != null && joypad.justPressed.B || joypad != null && joypad.justPressed.X;
	}
	
	public function a_pressed():Bool
	{
		return FlxG.keys.pressed.X || FlxG.keys.pressed.K || joypad != null && joypad.pressed.A;
	}
	
	public function b_pressed():Bool
	{
		return FlxG.keys.pressed.C || FlxG.keys.pressed.L || joypad != null && joypad.pressed.B || joypad != null && joypad.pressed.X;
	}
	
	public function down_pressed():Bool
	{
		return FlxG.keys.pressed.DOWN || FlxG.keys.pressed.S || joypad != null && joypad.getYAxis(FlxGamepadInputID.LEFT_ANALOG_STICK) > deadzone || joypad != null && joypad.pressed.DPAD_DOWN;
	}
	
	public function up_pressed():Bool
	{
		return FlxG.keys.pressed.UP || FlxG.keys.pressed.W || joypad != null && joypad.getYAxis(FlxGamepadInputID.LEFT_ANALOG_STICK) < -deadzone || joypad != null && joypad.pressed.DPAD_DOWN;
	}
	
}