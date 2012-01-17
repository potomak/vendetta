package
{
  import org.flixel.*;

  public class Player extends FlxSprite
  {
    [Embed(source = '../assets/player.png')] private var playerPNG:Class;

    public function Player(X:Number, Y:Number)
    {
      // As this extends FlxSprite we need to call super() to ensure all of the parent variables we need are created
      super(X, Y);

      // Load the player.png into this sprite.
      // The 2nd parameter tells Flixel it's a sprite sheet and it should chop it up into 16x18 sized frames.
      loadGraphic(playerPNG, true, true, 16, 18, true);

      // The sprite is 16x18 in size, but that includes a little feather of hair on its head which we don't want to include in collision checks.
      // We also shave 2 pixels off each side to make it slip through gaps easier. Changing the width/height does NOT change the visual sprite, just the bounding box used for physics.
      width = 10;
      height = 12;

      // Because we've shaved a few pixels off, we need to offset the sprite to compensate
      offset.x = 2;
      offset.y = 4;

      maxVelocity.x = 80;
      maxVelocity.y = 200;
      acceleration.y = 200;
      drag.x = maxVelocity.x*4;

      // The Animation sequences we need
      addAnimation("idle", [0], 0, false);
      addAnimation("walk", [0, 1, 0, 2], 10, true);
      addAnimation("jump", [1], 0, false);
      addAnimation("hurt", [4], 0, false);

      // By default the sprite is facing to the right.
      // Changing this tells Flixel to flip the sprite frames to show the left-facing ones instead.
      facing = FlxObject.RIGHT;
    }

    override public function update():void
    {
      super.update();

      if (x < 0)
      {
        x = 0;
      }

      if (velocity.x > 0)
      {
        facing = FlxObject.RIGHT;
      }
      else if (velocity.x < 0)
      {
        facing = FlxObject.LEFT;
      }

      if (touching == FlxObject.FLOOR)
      {
        if (velocity.x != 0)
        {
          play("walk");
        }
        else
        {
          play("idle");
        }
      }
      else if (velocity.y < 0)
      {
        play("jump");
      }
      
      // Player movement and controls
      acceleration.x = 0;
      
      if(FlxG.keys.LEFT) {
        acceleration.x = -maxVelocity.x*4;
      }
      
      if(FlxG.keys.RIGHT) {
        acceleration.x = maxVelocity.x*4;
      }
      
      if(FlxG.keys.justPressed("SPACE") && isTouching(FlxObject.FLOOR)) {
        velocity.y = -maxVelocity.y/2;
      }
    }

  }
}