package sprites;

import data.SaveData;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxSort;
import haxe.io.Path;

using StringTools;

class Player extends FlxSprite
{
	public var speed:Float = 0;
	public var state:String = 'idle';

	public var animList:Array<String> = ['idle', 'walk', 'damage'];

	public function new(version:String = '')
	{
		super(version);

		antialiasing = false;
		loadGraphic(Files.returnImageFile(Files.stcs + version), true, 16, 16);
		setGraphicSize(Std.int(width * 6));

		// should be in every iteration like this
		animation.add('idle', [0], 24);
		animation.add('walk', [0, 1, 0, 2], 12);
		animation.add('damage', [3, 4], 12);

		// add extra animations
		switch (version)
		{
			default:
				trace('stcs' + version + ' has no extra animations');
		}

		if (SaveData.lowEndConsole)
			visible = false;
	}

	override function update(elapsed:Float)
	{
		switch (state)
		{
			case 'idle':
				animation.play('idle');
			case 'walk':
				animation.play('walk');
			default:
				playAnimation(state);

				if (animation.finished)
					state = 'idle';
		}
		super.update(elapsed);
	}

	public function playAnimation(anim:String = 'damage')
	{
		state = '';
		animation.play(anim);
	}
}
