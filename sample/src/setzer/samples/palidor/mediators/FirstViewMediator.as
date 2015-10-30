package setzer.samples.palidor.mediators
{
	import flash.utils.setTimeout;

	import robotlegs.bender.extensions.palidor.api.StarlingMediator;

	import setzer.samples.palidor.events.FlowEvent;

	public class FirstViewMediator extends StarlingMediator
	{
		override public function initialize():void
		{
			setTimeout( handlerTimerOut, 3000 );
		}

		private function handlerTimerOut():void
		{
			eventDispatcher.dispatchEvent( new FlowEvent( FlowEvent.SHOW_SECOND_VIEW ) );
		}
	}
}
