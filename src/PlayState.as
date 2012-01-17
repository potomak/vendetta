package
{
  import org.flixel.*;

  public class PlayState extends FlxState
  {
    public var level:Level;
    public var player:Player;
    public var floor:FlxTileblock;

    override public function create():void
    {
      // Set the background color to light gray (0xAARRGGBB)
      FlxG.bgColor = 0xffaaaaaa;

      // Create a new tilemap using our level CSV
      level = new Level();
      add(level);

      // Create player
      player = new Player(FlxG.width/2 - 5, 0);
      add(player);

      var camera:FlxCamera = new FlxCamera(0, 0, FlxG.width, FlxG.height);
      camera.follow(player);
      // this sets the limits of where the camera goes so that it doesn't show what's outside of the tilemap
      camera.setBounds(0, 0, level.width, level.height);
      FlxG.addCamera(camera);
    }

    override public function update():void
    {
      // Updates all the objects appropriately
      super.update();

      // Finally, bump the player up against the level
      FlxG.collide(level, player);
    }
  }
}
