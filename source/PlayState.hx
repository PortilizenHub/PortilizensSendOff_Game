package;

import flixel.FlxG;
import flixel.FlxState;
import sprites.Player;

class PlayState extends FlxState
{
	var stcs:Player;
	var stcsState:String = 'idle';
	var stcsHT:Float = 4;

	override public function create()
	{
		stcs = new Player('');
		stcs.screenCenter(XY);
		stcs.playAnimation('idle');
		add(stcs);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		input();

		if (stcsHT > 0)
			stcsHT -= 0.1;

		super.update(elapsed);
	}

	public function input()
	{
		if (FlxG.keys.justPressed.SPACE)
		{
			stcs.playAnimation('dodge');
			stcsHT = 4;
			trace('DODGE!');
		}

		if (stcsHT < 1)
			stcs.playAnimation('idle');
	}
}
