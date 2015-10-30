package robotlegs.bender.extensions.palidor.impl
{
	import flash.utils.Dictionary;

	import robotlegs.bender.extensions.palidor.api.IFlowManager;
	import robotlegs.bender.extensions.palidor.api.IViewManager;

	import starling.events.Event;
	import starling.events.EventDispatcher;

	public class FlowManager implements IFlowManager
	{
		[Inject]
		public var eventDispatcher:EventDispatcher;

		[Inject]
		public var viewManager:IViewManager;

		private var _mappingEvents:Dictionary;

		public function FlowManager()
		{
			_mappingEvents = new Dictionary();
		}

		public function mapSetView( event:String, viewClass:Class ):void
		{
			_mappingEvents[event] = viewClass;
			eventDispatcher.addEventListener( event, onSetViewHandler )
		}

		public function mapAddView( event:String, viewClass:Class ):void
		{
			_mappingEvents[event] = viewClass;
			eventDispatcher.addEventListener( event, onAddViewHandler )
		}

		private function onSetViewHandler( event:Event ):void
		{
			event.stopImmediatePropagation();
			viewManager.setView( new _mappingEvents[event.type], true );
		}

		private function onAddViewHandler( event:Event ):void
		{
			event.stopImmediatePropagation();
			viewManager.addView( new _mappingEvents[event.type] );
		}
	}
}
