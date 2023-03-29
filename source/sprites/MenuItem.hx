package sprites;

import flixel.FlxSprite;

class MenuItem extends FlxSprite
{
	public function new(id:String = 'play')
	{
		loadGraphic(Files.returnImageFile('mainMenu/main_menu_assets'), true, 128, 64);
		animation.add('play', [0]);
		animation.add('options', [1]);

		animation.play(id);

		super();
	}
}
