package setzer.samples.palidor.views
{
	import starling.display.Quad;
	import starling.display.Sprite;

	public class StarlingView extends Sprite
	{
		public function StarlingView()
		{
			var q:Quad = new Quad(100,100,0xFF0000);
			addChild(q);
		}
	}
}
