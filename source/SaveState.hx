package;

import data.SaveData;
import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxBar;

class SaveState extends FlxState
{
	var loadingTxt:FlxText;
	var percent:Int = 0;
	var task:String = '';
	var percentBar:FlxBar;

	override public function create()
	{
		loadingTxt = new FlxText(0, 0, 0, 'Loading$task Data');
		add(loadingTxt);

		percentBar = new FlxBar(0, 0, RIGHT_TO_LEFT, 100, 10, this, 'percent', 0, 100, true);
		percentBar.createFilledBar(0x000000, 0x00FF00);
		add(percentBar);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		// loadingTxt.setPosition((FlxG.width - loadingTxt.width) / 2, (FlxG.height - loadingTxt.height) / 2);

		if (SaveData.fpsCounter != FlxG.save.data.fpsCounter && FlxG.save.data.fpsCounter)
			SaveData.fpsCounter = FlxG.save.data.fpsCounter;

		super.update(elapsed);
	}
}
