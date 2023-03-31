package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class LoadingState extends FlxState
{
	var curSel:Int = 0;
	var options:Array<String> = ['new game', 'load'];
	var grp:FlxTypedGroup<FlxText>;

	override public function create()
	{
		grp = new FlxTypedGroup<FlxText>();

		for (i in 0...options.length)
		{
			var txt:FlxText = new FlxText(0, 200 * (i + 1), 0, options[i], 32);
			txt.screenCenter(X);
			txt.ID = i;
			grp.add(txt);
		}

		add(grp);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		if (FlxG.keys.justReleased.UP || FlxG.keys.justReleased.W)
			curSel -= 1;
		if (FlxG.keys.justReleased.DOWN || FlxG.keys.justReleased.S)
			curSel += 1;

		if (curSel > options.length - 1)
			curSel = 0;
		if (curSel < 0)
			curSel = options.length - 1;

		grp.forEach(function(txt:FlxText)
		{
			txt.color = FlxColor.WHITE;

			if (txt.ID == curSel)
				txt.color = FlxColor.YELLOW;
		});

		super.update(elapsed);
	}
}
