package entities.player 
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	import org.flixel.FlxTimer;
	/**
	 * ...
	 * @author 
	 */
	
	 
	public class Player extends FlxSprite
	{
		[Embed(source = "../../data/art/player.png")] private var spritesheet:Class;
		
		public var GRAVITY:int 		= 500;
		public var RUN_SPEED:int 	= 200;
		public var JUMP_SPEED:int 	= 350;
		
		public var playerHealth:int;
		public var isOnGround:Boolean;
		public var playerLives:int = 2;
		
		
		
		public function Player() 
		{
			super(128,932);
			
			loadGraphic(spritesheet, true, true);
			
			addAnimation("idle", [0]);
			addAnimation("walk", [0, 1], 12, true);
			addAnimation("jump", [2]);
			
			acceleration.y = GRAVITY;
			drag.x = RUN_SPEED * 4;
			
			maxVelocity.x = RUN_SPEED;
			maxVelocity.y = JUMP_SPEED;
			
			playerHealth = 3;
			
		}
		
		public override function update():void
		{
			
			if (y >= 1000)
			{
				kill();
				playerLives -= 1;
				
				PlayState.timer = new FlxTimer();
				
				PlayState.timer.start(3, 0);
				
				if (playerLives == 0)
				{
					PlayState.timer.start(3, 0, PlayState.resetGame);
				}
				
				else 
				{
					FlxG.switchState(new PlayState());
				}
			}
			
			if ( acceleration.x != 0 )
			{
				if (facing == RIGHT)
				{
					acceleration.x -= drag.x;
					if ( acceleration.x >= 0 )
					{
						acceleration.x = 0;
					}
				}
				else
				{
					acceleration.x += drag.x;
					if ( acceleration.x <= 0 )
					{
						acceleration.x = 0;
					}
				}
			}
			
			if (FlxG.keys.LEFT)
			{
				if(isOnGround)
					play("walk");
					
				facing = LEFT;
				acceleration.x = -drag.x;
			}
			
			if (FlxG.keys.RIGHT)
			{
				if(isOnGround)
					play("walk");
					
				facing = RIGHT;
				acceleration.x = drag.x;
			}
			
			if ( FlxG.keys.justPressed("Z") && isOnGround)
			{
				play("jump");
				velocity.y = -JUMP_SPEED;
				isOnGround = false;
			}
			
			
			if ( !velocity.x && !velocity.y )
			{
				play("idle");
			}
			
			if ( !velocity.y && isTouching( DOWN ) )
			{
				isOnGround = true;
			}
			
			if ( velocity.y )
			{
				isOnGround = false;
			}
			
			super.update();
		}

		
		public function dealDamage( _damage:int = 1 ):void
		{
			if ( flickering == false )
			{
				playerHealth -= _damage;
				flicker(1);
			}
			
			if ( playerHealth <= 0 )
			{
				playerLives -= 1;
				kill();
				
				if (playerLives == 0)
				{	
				
					PlayState.timer = new FlxTimer();
				
					PlayState.timer.start(3, 0, PlayState.resetGame);
				}
				
				else
				{
					PlayState.timer = new FlxTimer();
				
					PlayState.timer.start(3, 0);
					FlxG.switchState(new PlayState());
				}
				
				
			}
		}
	}
}