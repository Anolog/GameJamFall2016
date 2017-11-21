package
{

	import org.flixel.*;

	public class MenuState extends FlxState
	{
		
		private var devButton:FlxButton;
		private var Title:FlxText;
		
		
		private var GAME_TITLE:String = "Stephen Kostiw - 020 - Midterm" // SUBSTITUTE YOUR NAME AND SECTION NUMBER INTO THIS STRING
		
		
		override public function create():void
		{
			FlxG.bgColor =0xFF306230;
			
			Title = new FlxText(0, FlxG.height / 3, FlxG.width, GAME_TITLE);
			Title.alignment = "center";
			Title.color = 0xFF9BBC0F;
			
			//Title.alignment("center");
			add(Title);
			
			devButton = new FlxButton(FlxG.width/2-40,FlxG.height / 3 + 60, "Click To Play", onPlay);
			devButton.soundOver = null;  //replace with mouseOver sound
			devButton.color =0xFF9BBC0F;
			devButton.label.color = 0xFF306230;
			
			add(devButton);
			
			FlxG.mouse.show();
		}
		
		override public function update():void
		{
			super.update();	
		}
		
		protected function onPlay():void
		{
			devButton.exists = false;
			FlxG.switchState(new PlayState());
		}
		
		
	}
}

