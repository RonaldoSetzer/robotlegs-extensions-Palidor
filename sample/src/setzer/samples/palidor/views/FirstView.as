package setzer.samples.palidor.views
{
	import flash.text.TextFormatAlign;
	
	import setzer.utils.Assets;
	
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.text.TextField;

	public class FirstView extends Sprite
	{
		public function FirstView()
		{
			var background:Quad = Assets.getQuadBackground();
			addChild( background );
			
			var logo:Quad = Assets.getImageSetzer();
			logo.alignPivot();
			logo.x = 250;
			logo.y = 185;
			addChild( logo );
			
			var textField:TextField = Assets.getTextField( "First View" );
			textField.alignPivot();
			textField.hAlign = TextFormatAlign.CENTER;
			textField.x = 250;
			textField.y = 60;
			addChild( textField );
		}
	}
}
