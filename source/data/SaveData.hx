package data;

import flixel.FlxG;
import haxe.Json;
import openfl.net.FileReference;
import sys.FileSystem;
import sys.io.File;

using StringTools;

class SaveData
{
	public static var fpsCounter:Bool = true;
	public static var lowEndConsole:Bool = false;

	public static function saveAll(path:String = 'portilizen', name:String = '')
	{
		var _file:FileReference;

		FlxG.save.data.fpsCounter = fpsCounter;
		FlxG.save.data.LED = lowEndConsole;

		if (FileSystem.exists('assets/data/saves'))
		{
			var json = {
				fps: fpsCounter,
				lowEndDevice: lowEndConsole
			};

			var data:String = Json.stringify(json);

			_file = new FileReference();
			// _file.save(data.trim(), 'assets/data/saves/$name.json');
		}

		// incase im dumb and dunno how to read .json files
		FlxG.save.bind(name, path);
		FlxG.save.flush();
	}

	public static function set(variable:Dynamic, value:Dynamic)
		variable = value;
}
