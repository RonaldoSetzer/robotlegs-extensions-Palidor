/**
 * ...
 * @author Ronaldo Santiago
 */
package robotlegs.bender.extensions.palidor.starlingIntegration.starlingViewMap.impl
{
	import starling.events.EventDispatcher;

	public class EventItem
	{
		public var target:EventDispatcher;
		public var event:String;
		public var handler:Function;

		public function EventItem( target:EventDispatcher, event:String, handler:Function )
		{
			this.target = target;
			this.event = event;
			this.handler = handler;
		}

		public function equals( target:EventDispatcher, event:String, handler:Function ):Boolean
		{
			return (this.target == target && this.event == event && this.handler == handler)
		}

		public function applyEventListener():void
		{
			target.addEventListener( event, handler );
		}

		public function removeEventListener():void
		{
			target.removeEventListener( event, handler );
		}
	}
}