package;

import flixel.FlxG;
import flixel.FlxState;
import sprites.Player;

class PlayState extends FlxState
{
	var stcs:Player;

	override public function create()
	{
		stcs = new Player('');
		stcs.screenCenter(XY);
		stcs.state = 'idle';
		stcs.speed = 4;
		add(stcs);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		input();

		super.update(elapsed);
	}

	public function input()
	{
		stcs.state = 'idle';

		// states
		if (FlxG.keys.pressed.LEFT || FlxG.keys.pressed.RIGHT || FlxG.keys.pressed.UP || FlxG.keys.pressed.DOWN)
			stcs.state = 'walk';

		// actual stuff
		if (FlxG.keys.pressed.LEFT)
		{
			stcs.x -= stcs.speed;
			stcs.flipX = true;
		}
		else if (FlxG.keys.pressed.RIGHT)
		{
			stcs.x += stcs.speed;
			stcs.flipX = false;
		}

		if (FlxG.keys.pressed.UP)
			stcs.y -= stcs.speed;
		else if (FlxG.keys.pressed.DOWN)
			stcs.y += stcs.speed;
	}
}
