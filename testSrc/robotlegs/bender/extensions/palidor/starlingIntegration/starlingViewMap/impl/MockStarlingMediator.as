package robotlegs.bender.extensions.palidor.starlingIntegration.starlingViewMap.impl
{
	import starling.events.Event;

	public class MockStarlingMediator extends StarlingMediator
	{
		public function public_addViewListener( eventString:String, listener:Function ):void
		{
			addViewListener( eventString, listener );
		}

		public function public_addContextListener( eventString:String, listener:Function ):void
		{
			addContextListener( eventString, listener );
		}

		public function public_removeViewListener( eventString:String, listener:Function ):void
		{
			removeViewListener( eventString, listener );
		}

		public function public_removeContextListener( eventString:String, listener:Function ):void
		{
			removeContextListener( eventString, listener );
		}

		public function public_dispatch( event:Event ):void
		{
			dispatch( event );
		}
	}
}
