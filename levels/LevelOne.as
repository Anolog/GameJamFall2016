package levels 
{
	import entities.enemies.myEnemy;
	import org.flixel.FlxGroup;
	import org.flixel.FlxTilemap;
	import org.flixel.system.FlxTile;
	/**
	 * ...
	 * @author 
	 */
	public class LevelOne extends FlxGroup
	{
		[Embed(source = "../data/leveldata/mapCSV_Core_Map.csv", mimeType = "application/octet-stream")] private var csv:Class;
		[Embed(source = "../data/leveldata/mapCSV_Core_Decorations.csv", mimeType = "application/octet-stream")] private var decorationsCSV:Class;
		[Embed(source = "../data/leveldata/mapCSV_Core_Objects.csv", mimeType = "application/octet-stream")] private var objectsCSV:Class;
		[Embed(source = "../data/leveldata/mapCSV_Core_Enemies.csv", mimeType = "application/octet-stream")] private var enemiesCSV:Class;
		
		
		[Embed(source = "../data/art/BasicTileset.png")] private var tileset:Class;
		
		public var map:FlxTilemap;
		public var decorations:FlxTilemap;
		public var objectMap:FlxTilemap;
		public var enemyMap:FlxTilemap;
		
		public var levelObjects:FlxGroup;
		public var levelEnemies:FlxGroup;
		
		public function LevelOne() 
		{
			super();
			
			map = new FlxTilemap();
			map.loadMap(new csv, tileset, 32, 32);
			add(map);
			
			decorations = new FlxTilemap();
			decorations.loadMap(new decorationsCSV, tileset, 32, 32);
			add(decorations);
			
			objectMap = new FlxTilemap();
			objectMap.loadMap(new objectsCSV, tileset, 32, 32);
			
			enemyMap = new FlxTilemap();
			enemyMap.loadMap( new enemiesCSV, tileset, 32, 32 );
			
			loadLevelDetails();			
			
		}
		
		public function loadLevelDetails():void
		{
			loadLevelObjects();
			loadLevelEnemies();
		}
		
		public function loadLevelObjects():void
		{
			levelObjects = new FlxGroup();
			
			for ( var _y:int = 0; _y < objectMap.heightInTiles; _y++ )
			{
				for ( var _x:int = 0; _x < objectMap.widthInTiles; _x++ )
				{
					if ( objectMap.getTile( _x, _y ) != 0 )
					{
						switch( objectMap.getTile( _x, _y ) )
						{
							// INSERT CASES FOR EACH PICKUP OBJECT HERE
								
						}
					}
				}
			}
			
			add(levelObjects);
		}
		
		public function loadLevelEnemies():void
		{
			levelEnemies = new FlxGroup();
			
			for ( var _y:int = 0; _y < enemyMap.heightInTiles; _y++ )
			{
				for ( var _x:int = 0; _x < enemyMap.widthInTiles; _x++ )
				{
					if ( enemyMap.getTile( _x, _y ) != 0 )
					{
						switch( enemyMap.getTile( _x, _y ) )
						{
							case 8:
								levelEnemies.add(new myEnemy( _x, _y) );
								break;
						}
					}
				}
			}
			
			add(levelEnemies);
		}
		
	}

}