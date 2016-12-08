/**
 * ...
 * @author Ronaldo Santiago
 */
package robotlegs.bender.extensions.palidor
{
	import robotlegs.bender.extensions.matching.instanceOfType;
	import robotlegs.bender.extensions.palidor.starlingContextView.api.IStarlingContextView;
	import robotlegs.bender.extensions.palidor.starlingContextView.impl.StarlingContextView;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IExtension;
	import robotlegs.bender.framework.api.ILogger;
	import robotlegs.bender.framework.impl.UID;

	import starling.core.Starling;
	import starling.display.DisplayObjectContainer;
	import starling.events.Event;

	public class StarlingContextViewExtension implements IExtension
	{
		private const _uid:String = UID.create( StarlingContextViewExtension );

		private var _logger:ILogger;

		private var _starling:Starling;
		private var _starlingContext:StarlingContextView;

		public function extend( context:IContext ):void
		{
			_logger = context.getLogger( this );

			context.injector.map( IStarlingContextView ).toSingleton( StarlingContextView );

			_starlingContext = context.injector.getInstance( IStarlingContextView );

			context.addConfigHandler( instanceOfType( Starling ), handlerStarling );
		}

		private function handlerStarling( s:Starling ):void
		{
			_starling = s;
			if ( _starling.root == null )
			{
				_logger.debug( "Starling instance does not have created a root yet" );
				_starling.addEventListener( Event.ROOT_CREATED, onRootCreatedHandler )
			} else
			{
				onRootCreatedHandler();
			}
		}

		private function onRootCreatedHandler( e:Event = null ):void
		{
			if ( e ) _starling.removeEventListener( Event.ROOT_CREATED, onRootCreatedHandler );

			_starlingContext.view = DisplayObjectContainer( _starling.root );
			_logger.debug( "Attached {0} as view in StarlingContextView", [_starlingContext.view] );
		}

		public function toString():String
		{
			return _uid;
		}
	}
}
