package setzer.samples.palidor.views
{
	import flash.text.TextFormatAlign;
	
	import setzer.utils.Assets;
	
	import starling.display.Button;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.text.TextField;

	public class SecondView extends Sprite
	{
		private var _button:Button;
		
		public function SecondView()
		{
			var background:Quad = Assets.getQuadBackground(0x000000);
			addChild( background );
			
			_button = Assets.getButton( "SHOW\nFIRST POPUP" );
			_button.y = 300;
			_button.x = 20;
			addChild( _button );
			
			var logo:Quad = Assets.getImageLogos();
			logo.alignPivot();
			logo.x = 250;
			logo.y = 185;
			addChild( logo );
			
			var textField:TextField = Assets.getTextField( "[SECOND VIEW]" );
			textField.alignPivot();
			textField.hAlign = TextFormatAlign.CENTER;
			textField.x = 250;
			textField.y = 60;
			textField.color = 0xFFFFFF;
			addChild( textField );
		}

		public function get button():Button
		{
			return _button;
		}
	}
}
