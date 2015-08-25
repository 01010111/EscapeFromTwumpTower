package;

import flixel.util.FlxSave;

/**
 * Handy, pre-built Registry class that can be used to store 
 * references to objects and other things for quick-access. Feel
 * free to simply ignore it or change it in any way you like.
 */
class Reg
{
	public static var bestMin:Int = 59;
	public static var bestSec:Int = 59;
	public static var bestMSc:Int = 59;
	public static var bestSaf:Int = 0;
	public static var bestGld:Int = 0;
	
	public static var _save:FlxSave;
	
	public static function initSave():Void
	{
		_save = new FlxSave();
		_save.bind("WILD_TWUMP_DATA");
		if (_save.data.bestMin != null) load();
	}
	
	public static function load():Void
	{
		bestMin = _save.data.bestMin;
		bestSec = _save.data.bestSec;
		bestMSc = _save.data.bestMSc;
		bestSaf = _save.data.bestSaf;
		bestGld = _save.data.bestGld;
	}
	
	public static function save():Void
	{
		_save.data.bestMin = bestMin;
		_save.data.bestSec = bestSec;
		_save.data.bestMSc = bestMSc;
		_save.data.bestSaf = bestSaf;
		_save.data.bestGld = bestGld;
	}
	
}