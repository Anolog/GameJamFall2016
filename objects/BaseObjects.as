package objects 
{
	import air.update.utils.VersionUtils;
	import entities.player.Player;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author ...
	 */
	public class BaseObjects extends FlxSprite
	{
		
		public function BaseObjects( X:int = 0, Y:int = 0 ) 
		{
			super( X * 32, Y * 32 );
		}
		
		public function onHit( _player:Player ):void
		{
			
		}
		
	}

}