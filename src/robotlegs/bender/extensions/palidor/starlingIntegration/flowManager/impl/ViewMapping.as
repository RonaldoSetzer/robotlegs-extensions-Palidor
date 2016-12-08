/**
 * ...
 * @author Ronaldo Santiago
 */
package robotlegs.bender.extensions.palidor.starlingIntegration.flowManager.impl
{
	import robotlegs.bender.extensions.palidor.starlingIntegration.flowManager.api.IViewMapping;

	public class ViewMapping implements IViewMapping
	{
		private var _flowManager:FlowManager;
		private var _event:String;

		public function ViewMapping( event:String, flowManager:FlowManager )
		{
			_event = event;
			_flowManager = flowManager;
		}

		public function toFloatingView( viewClass:Class ):void
		{
			_flowManager.mapFloatingView( _event, viewClass );
		}

		public function toView( viewClass:Class ):void
		{
			_flowManager.mapView( _event, viewClass );
		}
	}
}