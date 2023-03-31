package data;

import flixel.FlxG;
import flixel.util.FlxSave;

class Save
{
	public static function save()
	{
		FlxG.save.bind("SFS", 'portilizen');
		FlxG.save.flush();
	}
}
