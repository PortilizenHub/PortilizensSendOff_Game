package sprites;

import flixel.FlxSprite;

class Portraits extends FlxSprite
{
	var portrait:String = '';

	public function new(portrait:String)
	{
		if (portrait == null)
			this.portrait = 'N/A';

		super();
	}

	public function create()
	{
		if (Files.returnImageFile(portrait) != 'assets/images/N/A.png')
			loadGraphic(Files.returnImageFile(portrait), true, 64, 80);
		else
			makeGraphic(64, 80, 0xbe0dc4);
	}

	public function createAnimations(portraitName:String)
	{
		switch (portraitName)
		{
			case 'stcs':
				animation.add('normal', [0]);
				animation.add('pissed', [1]);
				animation.add('confused', [2]);
				animation.add('angry', [3]);
				animation.add('shocked', [4]);
		}
	}
}
