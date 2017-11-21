package
{

	import entities.enemies.BaseEnemy;
	import entities.player.Player;
	import levels.LevelOne;
	import objects.BaseObjects;
	import org.flixel.*;

	public class PlayState extends FlxState
	{
		public var player:Player;
		public static var level:LevelOne;
		
		public static var timer:FlxTimer;
		
		
		override public function create():void
		{
			FlxG.visualDebug = true;
			
			level = new LevelOne();
			add(level);
			
			player = new Player();
			add(player);

			FlxG.camera.follow(player, 1);
			FlxG.camera.setBounds(0, 0, level.map.width, level.map.height, true);
		}
		
		override public function update():void
		{
			
			updateCollision();
			updateActiveSprites();
			
			super.update();
			
		}
		
		public function updateCollision():void
		{
			FlxG.collide(player, level.map);
			FlxG.collide(player, level.levelEnemies, onEnemyHit);
			
			FlxG.collide(level.levelEnemies, level.map);
			FlxG.collide(level.levelEnemies, level.levelEnemies);

		}
		
		public function updateActiveSprites():void
		{
			for ( var i:int = 0; i < level.levelEnemies.length; i++ )
			{
				if ( FlxU.getDistance(new FlxPoint(player.x, player.y), new FlxPoint(level.levelEnemies.members[i].x, level.levelEnemies.members[i].y)) < 400 )
				{
					level.levelEnemies.members[i].active = true;
				}
				else
				{
					level.levelEnemies.members[i].active = false;
				}
			}
			
		}
		
			
		public static function resetGame( _timer:FlxTimer ):void
		{
			FlxG.switchState( new MenuState() );
		}
		
		public function onEnemyHit( _player:Player, _enemy:BaseEnemy ):void
		{
			_enemy.onHit( _player );
		}
	}
		
}

