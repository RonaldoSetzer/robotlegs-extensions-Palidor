/**
 * ...
 * @author Ronaldo Santiago
 */
package robotlegs.bender.extensions.palidor.starlingIntegration.flowManager.impl
{
	import flash.utils.Dictionary;

	import org.swiftsuspenders.errors.InjectorError;

	import robotlegs.bender.extensions.palidor.starlingIntegration.flowManager.api.IFlowManager;
	import robotlegs.bender.extensions.palidor.starlingIntegration.flowManager.api.IViewMapping;
	import robotlegs.bender.extensions.palidor.starlingIntegration.starlingViewManager.api.IStarlingViewManager;

	import starling.events.Event;
	import starling.events.EventDispatcher;

	public class FlowManager implements IFlowManager
	{
		[Inject]
		public var eventDispatcher:EventDispatcher;

		[Inject]
		public var viewManager:IStarlingViewManager;

		private var _mappingEvents:Dictionary;

		public function FlowManager()
		{
			_mappingEvents = new Dictionary();
		}

		public function map( event:String ):IViewMapping
		{
			if ( _mappingEvents[event] )
				throw new InjectorError( "There is a view mapped to this event" );

			return new ViewMapping( event, this );
		}

		public function mapView( event:String, viewClass:Class ):void
		{
			_mappingEvents[event] = viewClass;
			eventDispatcher.addEventListener( event, onSetViewHandler )
		}

		public function mapFloatingView( event:String, viewClass:Class ):void
		{
			_mappingEvents[event] = viewClass;
			eventDispatcher.addEventListener( event, onAddFloatingViewHandler )
		}

		private function onSetViewHandler( event:Event ):void
		{
			event.stopImmediatePropagation();
			viewManager.setView( new _mappingEvents[event.type], true );
		}

		private function onAddFloatingViewHandler( event:Event ):void
		{
			event.stopImmediatePropagation();
			viewManager.addFloatingView( new _mappingEvents[event.type] );
		}
	}
}