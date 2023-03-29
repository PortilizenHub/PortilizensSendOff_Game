package;

import flixel.FlxGame;
import openfl.display.FPS;
import openfl.display.Sprite;

class Main extends Sprite
{
	var fps:FPS;

	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, MenuState));

		fps = new FPS(2, 2);
		addChild(fps);
	}
}
