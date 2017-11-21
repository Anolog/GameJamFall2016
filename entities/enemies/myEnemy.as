package entities.enemies 
{
	
	import entities.player.Player;
	/**
	 * ...
	 * @author ...
	 */
	public class myEnemy extends BaseEnemy
	{
		//Embed here
		[Embed(source = "../../data/art/slime.png")] private var spritesheet:Class;
		public function myEnemy(X:int = 0, Y:int = 0) 
		{
			super(X, Y);
			
			loadGraphic(spritesheet, true, true);
			
			addAnimation( "idle", [1] );
			addAnimation( "walk", [ 0, 1 ], 12, true );
			
			play("walk");
			
			isPatrolling = true;
		}
		
		override public function onHit( _player:Player ):void
		{
			if ( _player.isTouching( DOWN ) && this.isTouching( UP ) )
			{
				_player.velocity.y = -_player.JUMP_SPEED / 3;
				_player.isOnGround = false;
				_player.play("jump");
				
				kill();
			}
			else
			{
				_player.dealDamage();
			}
		}
		
	}
		

}