package setzer.samples.palidor.events
{
	import starling.events.Event;

	public class FlowEvent extends Event
	{
		public static const SHOW_FIRST_VIEW:String = "showFirstView";
		public static const SHOW_SECOND_VIEW:String = "showSecondView";

		public static const SHOW_FIRST_POPUP:String = "showFirstPopup";

		public function FlowEvent( type:String, bubbles:Boolean = false, data:Object = null )
		{
			super( type, bubbles, data );
		}
	}
}
