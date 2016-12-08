package setzer.samples.palidor.mediators
{
	import robotlegs.bender.extensions.palidor.starlingIntegration.starlingViewMap.impl.StarlingMediator;
	
	import setzer.samples.palidor.views.FirstPopup;
	
	import starling.events.Event;

	public class FirstPopupMediator extends StarlingMediator
	{
		override public function initialize():void
		{
			eventMap.mapListener( FirstPopup( viewComponent ).button , Event.TRIGGERED, onClickHandler )
		}
		
		private function onClickHandler( e:Event ):void
		{
			FirstPopup( viewComponent ).destroy();
		}

		override public function destroy():void
		{
			eventMap.unmapListeners();
		}
	}
}
