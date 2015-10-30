package robotlegs.bender.extensions.palidor
{
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;

	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.extensions.matching.instanceOfType;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.ILogger;
	import robotlegs.bender.framework.impl.UID;

	import starling.core.Starling;
	import starling.events.Event;

	public class PalidorStageSyncExtension
	{
		private const _uid:String = UID.create( PalidorStageSyncExtension );

		private var _context:IContext;

		private var _contextView:DisplayObjectContainer;

		private var _logger:ILogger;

		private var _hasStarlingRootCreated:Boolean;
		private var _starling:Starling;

		public function extend( context:IContext ):void
		{
			_context = context;
			_logger = context.getLogger( this );

			_context.addConfigHandler( instanceOfType( ContextView ), handleContextView );
			_context.addConfigHandler( instanceOfType( Starling ), handlerStarling );
		}

		private function handlerStarling( s:Starling ):void
		{
			_starling = s;
			if ( _starling.root == null )
			{
				_starling.addEventListener( starling.events.Event.ROOT_CREATED, onRootCreatedHandler );
			} else
			{
				onRootCreatedHandler();
			}
		}

		private function onRootCreatedHandler( e:starling.events.Event = null ):void
		{
			if ( e ) _starling.removeEventListener( starling.events.Event.ROOT_CREATED, onRootCreatedHandler );

			_hasStarlingRootCreated = true;

			initializeContext();
		}

		private function handleContextView( contextView:ContextView ):void
		{
			if ( _contextView )
			{
				_logger.warn( 'A contextView has already been installed, ignoring {0}', [contextView.view] );
				return;
			}
			_contextView = contextView.view;
			if ( _contextView.stage )
			{
				initializeContext();
			} else
			{
				_logger.debug( "Context view is not yet on stage. Waiting..." );
				_contextView.addEventListener( flash.events.Event.ADDED_TO_STAGE, onAddedToStage );
			}
		}

		private function onAddedToStage( event:flash.events.Event ):void
		{
			_contextView.removeEventListener( flash.events.Event.ADDED_TO_STAGE, onAddedToStage );
			initializeContext();
		}

		private function initializeContext():void
		{
			if ( _hasStarlingRootCreated == false ) return;

			_logger.debug( "Context view is now on stage. Initializing context..." );
			_context.initialize();
			_contextView.addEventListener( flash.events.Event.REMOVED_FROM_STAGE, onRemovedFromStage );
		}

		private function onRemovedFromStage( event:flash.events.Event ):void
		{
			_logger.debug( "Context view has left the stage. Destroying context..." );
			_contextView.removeEventListener( flash.events.Event.REMOVED_FROM_STAGE, onRemovedFromStage );
			_context.destroy();
		}

		public function toString():String
		{
			return _uid;
		}
	}
}
