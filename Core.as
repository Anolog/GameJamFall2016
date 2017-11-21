package

{

	import org.flixel.*;

	[SWF(width="320", height="288", backgroundColor="#000000")]

	[Frame(factoryClass="Preloader")]



	public class Core extends FlxGame
	{

		public function Core()
		{

			super(160,144,MenuState,2, 60, 60);
			forceDebugger = true;
		}

	}

}

