package;

import data.SaveData;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.math.FlxRandom;
import flixel.tweens.FlxTween;
import sprites.Files;
import sprites.Player;

class PlayState extends FlxState
{
	var stcs:Player;
	var ghost:FlxSprite;

	override public function create()
	{
		stcs = new Player('');
		stcs.screenCenter(XY);
		stcs.state = 'idle';
		stcs.speed = 4;
		add(stcs);

		ghost = new FlxSprite(60, 60, Files.returnImageFile('ghost'));
		ghost.setGraphicSize(Std.int(ghost.width * 6));
		add(ghost);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		input();
		ghostScript();

		super.update(elapsed);
	}

	public function input()
	{
		stcs.state = 'idle';

		if (!FlxG.keys.pressed.LEFT || !FlxG.keys.pressed.RIGHT || !FlxG.keys.pressed.UP || !FlxG.keys.pressed.DOWN)
		{
			if (stcs.speed > 4)
				stcs.speed -= 0.6;
		}

		// states
		if (FlxG.keys.pressed.LEFT || FlxG.keys.pressed.RIGHT || FlxG.keys.pressed.UP || FlxG.keys.pressed.DOWN)
			stcs.state = 'walk';

		// actual stuff
		if (FlxG.keys.pressed.LEFT)
		{
			stcs.x -= stcs.speed;
			stcs.flipX = true;
			stcs.speed += 0.6;
		}
		else if (FlxG.keys.pressed.RIGHT)
		{
			stcs.x += stcs.speed;
			stcs.flipX = false;
			stcs.speed += 0.6;
		}

		if (FlxG.keys.pressed.UP)
		{
			stcs.y -= stcs.speed;
			stcs.speed += 0.6;
		}
		else if (FlxG.keys.pressed.DOWN)
		{
			stcs.y += stcs.speed;
			stcs.speed += 0.6;
		}

		if (stcs.speed > 4.6)
			stcs.speed = 4.6;
	}

	public function ghostScript()
	{
		FlxTween.tween(ghost,
			{x: FlxG.random.int(Std.int(stcs.x) - 40, Std.int(stcs.x) + 20), y: FlxG.random.int(Std.int(stcs.y) - 40, Std.int(stcs.y) + 20)}, 0.6);

		if (ghost.overlaps(stcs, true))
			FlxG.resetState();
	}
}
