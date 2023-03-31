package;

import flixel.FlxG;
import flixel.FlxState;
import sprites.Portraits;

class PlayState extends FlxState
{
	public static var act:Int = 0;

	public var main:Portraits;
	public var second:Portraits;
	public var third:Portraits;

	override public function create()
	{
		trace(FlxG.save);
		data.Save.save();

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
