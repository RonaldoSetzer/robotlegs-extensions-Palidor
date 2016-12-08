package setzer.samples.palidor.mediators
{
	import robotlegs.bender.extensions.palidor.starlingIntegration.starlingViewMap.impl.StarlingMediator;
	
	import setzer.samples.palidor.events.FlowEvent;
	import setzer.samples.palidor.views.SecondView;
	
	import starling.events.Event;

	public class SecondViewMediator extends StarlingMediator
	{
		override public function initialize():void
		{
			eventMap.mapListener( SecondView( viewComponent ).button , Event.TRIGGERED, onClickHandler )
		}
		
		private function onClickHandler( e:Event ):void
		{
			eventDispatcher.dispatchEvent( new FlowEvent( FlowEvent.SHOW_FIRST_POPUP ) ); 
		}
		
		override public function destroy():void
		{
			eventMap.unmapListeners();
		}
	}
}
