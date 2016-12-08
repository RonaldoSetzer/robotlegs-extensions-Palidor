package setzer.utils
{
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.text.TextField;
	import starling.textures.Texture;

	public class Assets
	{
		[Embed(source="/../assets/setzer_logo.png")]
		public static var SetzerImage:Class;

		[Embed(source="/../assets/robotlegs_starling.png")]
		public static var RobotlegsStarlingImage:Class;

		[Embed(source="/../assets/button_large_down.png")]
		public static var ButtonLargeDown:Class;
		
		[Embed(source="/../assets/button_large_up.png")]
		public static var ButtonLargeUp:Class;
		
		
		public static function getButton( text:String = "" ):Button
		{
			var textureUp:Texture = Texture.fromBitmap( new ButtonLargeUp() );
			var textureDown:Texture = Texture.fromBitmap( new ButtonLargeDown() );
			
			return new Button( textureUp, text, textureDown );
		}
		
		public static function getTextField( text:String = "" ):TextField
		{
			return new TextField( 300, 100, text, "Verdana", 24, 0x000000 );
		}
		
		public static function getImageLogos():Image
		{
			var texture:Texture = Texture.fromBitmap( new RobotlegsStarlingImage() );
			
			return new Image( texture );
		}
		
		public static function getImageSetzer():Image
		{
			var texture:Texture = Texture.fromBitmap( new SetzerImage() );
			
			return new Image( texture );
		}
		
		public static function getQuadBackground( color:int= 0xFFFFFF ):Quad
		{
			return new Quad(500,375,color );
		}
	}
}