package robotlegs.bender.extensions.palidor
{
	import robotlegs.bender.extensions.matching.instanceOfType;
	import robotlegs.bender.extensions.palidor.api.IEventMap;
	import robotlegs.bender.extensions.palidor.api.IFlowManager;
	import robotlegs.bender.extensions.palidor.api.IStarlingViewMap;
	import robotlegs.bender.extensions.palidor.api.IViewManager;
	import robotlegs.bender.extensions.palidor.impl.EventMap;
	import robotlegs.bender.extensions.palidor.impl.FlowManager;
	import robotlegs.bender.extensions.palidor.impl.StarlingViewMap;
	import robotlegs.bender.extensions.palidor.impl.ViewManager;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IExtension;
	import robotlegs.bender.framework.api.ILogger;
	import robotlegs.bender.framework.impl.UID;

	import starling.core.Starling;
	import starling.display.DisplayObjectContainer;
	import starling.events.Event;
	import starling.events.EventDispatcher;

	public class PalidorIntegrationExtension implements IExtension
	{
		private const _uid:String = UID.create( PalidorIntegrationExtension );

		private var _starling:Starling;
		private var _logger:ILogger;
		private var _viewManager:ViewManager;
		private var _starlingViewMap:StarlingViewMap;

		public function extend( context:IContext ):void
		{
			_logger = context.getLogger( this );

			context.injector.map( EventDispatcher ).asSingleton();
			context.injector.map( IViewManager ).toSingleton( ViewManager );
			context.injector.map( IStarlingViewMap ).toSingleton( StarlingViewMap );
			context.injector.map( IFlowManager ).toSingleton( FlowManager );
			context.injector.map( IEventMap ).toType( EventMap );

			_viewManager = context.injector.getInstance( IViewManager );
			_starlingViewMap = context.injector.getInstance( IStarlingViewMap );
			context.injector.getInstance( IFlowManager );

			context.addConfigHandler( instanceOfType( Starling ), handlerStarling );
		}

		private function handlerStarling( $starling:Starling ):void
		{
			_starling = $starling;
			if ( _starling.root == null )
			{
				_logger.debug( "Starling instance does not have a root created yet" );
				_starling.addEventListener( Event.ROOT_CREATED, onRootCreatedHandler )
			} else
			{
				onRootCreatedHandler();
			}
		}

		private function onRootCreatedHandler( e:Event = null ):void
		{
			if ( e ) _starling.removeEventListener( Event.ROOT_CREATED, onRootCreatedHandler );

			_viewManager.init( DisplayObjectContainer( _starling.root ) );
			_starlingViewMap.registerStage( _starling.stage );
		}

		public function toString():String
		{
			return _uid;
		}
	}
}
