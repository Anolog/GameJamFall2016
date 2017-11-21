package entities.enemies 
{
	import entities.player.Player;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author ...
	 */
	public class BaseEnemy extends FlxSprite
	{
		
		public var RUN_SPEED:int 	= 100;
		public var GRAVITY:int 		= 500;
		public var JUMP_SPEED:int 	= 350;
		
		public var isPatrolling:Boolean;
		
				
		public function BaseEnemy( X:int = 0, Y:int = 0 ) 
		{
			super(X * 32, Y * 32);
			
			drag.x = RUN_SPEED * 4;
			acceleration.y = GRAVITY;
			maxVelocity.x = RUN_SPEED;
			maxVelocity.y = JUMP_SPEED;
			
			active = false;
		}
		
		override public function update():void
		{
			if (isPatrolling)
				patrol();
				
			super.update();
		}
		
		
		public function onHit(_player:Player):void
		{

				
		}
		
		public function patrol():void
		{
			
			if ( facing == LEFT )
			{
				if ( !PlayState.level.map.overlapsPoint( new FlxPoint(x - width / 2, y + height + 1) ) )
				{
					facing = RIGHT;
				}
			}
			else
			{
				if ( !PlayState.level.map.overlapsPoint( new FlxPoint(x + width + width / 2, y + height + 1) ) )
				{
					facing = LEFT;
				}
			}
			
			
			
			if ( facing == LEFT )
			{
				acceleration.x = -drag.x;
				if ( isTouching(LEFT) )
				{
					facing = RIGHT;
				}
			}
			else
			{
				acceleration.x = drag.x;
				if ( isTouching(RIGHT) )
				{
					facing = LEFT;
				}
			}
			
		}
	}
	
		
}