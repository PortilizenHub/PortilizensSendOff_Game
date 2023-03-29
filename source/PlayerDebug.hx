package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import sprites.Player;

class PlayerDebug extends FlxState
{
	var curAnim:String = 'idle';
	var curAnimTXT:FlxText;

	var stcs:Player;
	var animList:Array<String> = ['idle'];

	var curSel:Int = 0;

	var version:String = '';

	public function new(ver:String = '')
	{
		version = ver;

		super();
	}

	override public function create()
	{
		stcs = new Player(version);
		stcs.screenCenter(XY);
		stcs.state = 'idle';
		stcs.speed = 4;
		add(stcs);

		animList = stcs.animList;
		curAnim = animList[curSel];

		curAnimTXT = new FlxText(0, 0, 0, curAnim, 32);
		curAnimTXT.screenCenter(XY);
		curAnimTXT.y -= 60;
		add(curAnimTXT);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		curAnim = animList[curSel];

		curAnimTXT.text = curAnim;
		curAnimTXT.screenCenter(XY);
		curAnimTXT.y -= 60;

		stcs.state = curAnim;

		if (FlxG.keys.justReleased.LEFT)
			curSel -= 1;
		if (FlxG.keys.justReleased.RIGHT)
			curSel += 1;

		if (curSel > (animList.length - 1))
			curSel = animList.length - 1;
		if (curSel < 0)
			curSel = 0;

		if (FlxG.keys.justReleased.BACKSPACE)
			FlxG.switchState(new PlayState());

		super.update(elapsed);
	}
}
