/**
 * ...
 * @author Ronaldo Santiago
 */
package robotlegs.bender.extensions.palidor.starlingIntegration.starlingViewMap.impl
{
	import robotlegs.bender.extensions.mediatorMap.api.IMediator;
	import robotlegs.bender.extensions.palidor.starlingIntegration.starlingViewMap.api.IStarlingEventMap;

	import starling.events.Event;
	import starling.events.EventDispatcher;

	public class StarlingMediator implements IMediator
	{
		[Inject]
		public var eventMap:IStarlingEventMap;

		[Inject]
		public var eventDispatcher:EventDispatcher;

		protected var _viewComponent:Object;

		public function get viewComponent():Object
		{
			return _viewComponent;
		}

		public function set viewComponent( view:Object ):void
		{
			_viewComponent = view;
		}

		public function initialize():void
		{
		}

		public function destroy():void
		{
		}

		public function postDestroy():void
		{
			eventMap.unmapListeners();
		}

		protected function addViewListener( eventString:String, listener:Function ):void
		{
			eventMap.mapListener( EventDispatcher( _viewComponent ), eventString, listener );
		}

		protected function addContextListener( eventString:String, listener:Function ):void
		{
			eventMap.mapListener( eventDispatcher, eventString, listener );
		}

		protected function removeViewListener( eventString:String, listener:Function ):void
		{
			eventMap.unmapListener( EventDispatcher( _viewComponent ), eventString, listener );
		}

		protected function removeContextListener( eventString:String, listener:Function ):void
		{
			eventMap.unmapListener( eventDispatcher, eventString, listener );
		}

		protected function dispatch( event:Event ):void
		{
			if ( event == null ) return;

			eventDispatcher.dispatchEvent( event );
		}
	}

}
