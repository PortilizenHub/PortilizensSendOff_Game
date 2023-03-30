package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.effects.chainable.FlxWaveEffect;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import openfl.filters.ShaderFilter;
import sprites.Files;

class MenuState extends FlxState
{
	public var menuBtnGrp:FlxTypedGroup<FlxSprite>;
	public var menuOpt:Array<String> = ['play', 'options'];

	var curSel:Int = 0;

	override public function create()
	{
		menuBtnGrp = new FlxTypedGroup<FlxSprite>();

		for (i in 0...menuOpt.length)
		{
			var menuBtn:FlxSprite = new FlxSprite(40, (80 * (i + 1)) + 30);
			menuBtn.loadGraphic(Files.returnImageFile(Files.returnImageFile('main_menu_assets')), true, 128, 64);
			menuBtn.animation.add('play', [0]);
			menuBtn.animation.add('options', [1]);
			menuBtn.animation.play(menuOpt[i]);
			menuBtn.alpha = 1;
			menuBtn.ID = i;
			menuBtnGrp.add(menuBtn);
		}

		add(menuBtnGrp);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		if (FlxG.keys.justReleased.UP || FlxG.keys.justReleased.W)
			curSel -= 1;
		if (FlxG.keys.justReleased.DOWN || FlxG.keys.justReleased.S)
			curSel += 1;

		if (curSel > menuOpt.length - 1)
			curSel = 0;
		if (curSel < 0)
			curSel = menuOpt.length - 1;

		menuBtnGrp.forEachAlive(function(menuBtn:FlxSprite)
		{
			var speed:Float = 0.08;

			if (curSel == menuBtn.ID)
				menuBtn.alpha = 1;
			else if (curSel != menuBtn.ID)
				menuBtn.alpha = 0.4;

			// too slow
			// menuBtnTween(curSel == menuBtn.ID, speed, menuBtn);

			// trace(menuBtn.alpha + ' - ' + menuBtn.ID);
		});

		if (FlxG.keys.justReleased.ENTER)
			FlxG.switchState(new PlayState());

		super.update(elapsed);
	}

	public function menuBtnTween(seleced:Bool, speed:Float, obj:FlxSprite)
	{
		if (seleced)
			FlxTween.tween(obj, {alpha: 1}, speed);
		else
			FlxTween.tween(obj, {alpha: 0.4}, speed);
	}
}
