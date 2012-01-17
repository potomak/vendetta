package
{
  import org.flixel.*;

  public class Level extends FlxTilemap
  {
    // Design your platformer level with 1s and 0s (at 40x30 to fill 320x240 screen)
    [Embed(source = "../assets/level.csv", mimeType = "application/octet-stream")] public var levelCSV:Class;

    public function Level()
    {
      super();

      // Create a new tilemap using our level CSV
      loadMap(new levelCSV, FlxTilemap.ImgAuto, 0, 0, FlxTilemap.AUTO);
      follow();
    }
  }
}