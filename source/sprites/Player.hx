package sprites;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxSort;
import haxe.io.Path;

using StringTools;

class Player extends FlxSprite
{
	var holdTimer:Float = 0;
	var hFrame:Int = 0;

	public var state:String = '';

	public function new(version:String = '')
	{
		super(version);

		antialiasing = false;

		loadGraphic(Files.returnImageFile(Files.stcs + version), true, 16, 16);
		setGraphicSize(Std.int(width * 6));

		// should be in every iteration like this
		animation.add('idle', [0], 24);

		// add extra animations
		switch (version)
		{
			default:
				trace('stcs' + version + ' has no extra animations');
		}
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}

	public function playAnimation(anim:String = 'idle', ?ht:Float = 4)
	{
		holdTimer = ht;

		animation.play(anim);
	}
}
