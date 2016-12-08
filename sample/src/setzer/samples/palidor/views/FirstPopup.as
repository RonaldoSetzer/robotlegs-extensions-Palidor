package setzer.samples.palidor.views
{
	import flash.text.TextFormatAlign;
	
	import setzer.utils.Assets;
	
	import starling.display.Button;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.text.TextField;

	public class FirstPopup extends Sprite
	{
		private var _button:Button;
		
		public function FirstPopup()
		{
			var background:Quad = Assets.getQuadBackground( 0x000000 );
			background.alpha = .8;
			addChild( background );
			
			_button = Assets.getButton( "CLOSE\nPOPUP" );
			_button.alignPivot();
			_button.y = 280;
			_button.x = 250;
			addChild( _button );
			
			var textField:TextField = Assets.getTextField( "[FIRST POPUP]" );
			textField.alignPivot();
			textField.hAlign = TextFormatAlign.CENTER;
			textField.color = 0xFFFFFF;
			textField.x = 250;
			textField.y = 120;
			addChild( textField );
		}
		
		public function destroy():void
		{
			removeFromParent(true);
		}
		
		public function get button():Button
		{
			return _button;
		}
	}
}
