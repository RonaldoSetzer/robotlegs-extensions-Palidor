package setzer.samples.palidor
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	import robotlegs.bender.bundles.palidor.PalidorBundle;
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.impl.Context;
	
	import setzer.samples.palidor.setup.SamplePalidorConfig;
	import setzer.samples.palidor.views.StarlingView;
	
	import starling.core.Starling;

	public class SamplePalidor extends Sprite
	{

		public function SamplePalidor()
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.frameRate = 60;
			stage.color = 0xFFFFFF;

			addEventListener( Event.ADDED_TO_STAGE, onAddedToStageHandler );
		}

		private function onAddedToStageHandler( e:Event ):void
		{
			var starling:Starling = new Starling( StarlingView, stage, new Rectangle( 0, 0, stage.stageWidth, stage.stageHeight) );
			starling.nativeStage.frameRate = 60;
			starling.start();

			const robotlegsContext:IContext = new Context()
					.install( PalidorBundle )
					.configure( SamplePalidorConfig, new ContextView( this ), starling );

		}
	}
}
