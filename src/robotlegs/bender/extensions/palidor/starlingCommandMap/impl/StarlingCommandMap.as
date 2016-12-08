/**
 * ...
 * @author Ronaldo Santiago
 */
package robotlegs.bender.extensions.palidor.starlingCommandMap.impl
{
	import robotlegs.bender.extensions.commandCenter.dsl.ICommandMapper;
	import robotlegs.bender.extensions.commandCenter.dsl.ICommandUnmapper;
	import robotlegs.bender.extensions.commandCenter.impl.CommandTriggerMap;
	import robotlegs.bender.extensions.palidor.starlingCommandMap.api.IStarlingCommandMap;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IInjector;
	import robotlegs.bender.framework.api.ILogger;

	import starling.events.EventDispatcher;

	public class StarlingCommandMap implements IStarlingCommandMap
	{
		private const _mappingProcessors:Array = [];

		private var _injector:IInjector;
		private var _logger:ILogger;
		private var _dispatcher:EventDispatcher;
		private var _triggerMap:CommandTriggerMap;

		public function StarlingCommandMap( context:IContext, dispatcher:EventDispatcher )
		{
			_injector = context.injector;
			_logger = context.getLogger( this );
			_dispatcher = dispatcher;
			_triggerMap = new CommandTriggerMap( getKey, createTrigger );
		}

		public function map( type:String, eventClass:Class = null ):ICommandMapper
		{
			return getTrigger( type, eventClass ).createMapper();
		}

		public function unmap( type:String, eventClass:Class = null ):ICommandUnmapper
		{
			return getTrigger( type, eventClass ).createMapper();
		}

		public function addMappingProcessor( handler:Function ):IStarlingCommandMap
		{
			if ( _mappingProcessors.indexOf( handler ) == -1 )
				_mappingProcessors.push( handler );
			return this;
		}

		private function getTrigger( type:String, eventClass:Class ):StarlingCommandTrigger
		{
			return _triggerMap.getTrigger( type, eventClass ) as StarlingCommandTrigger;
		}

		private function createTrigger( type:String, eventClass:Class ):StarlingCommandTrigger
		{
			return new StarlingCommandTrigger( _injector, _dispatcher, type, eventClass, _mappingProcessors, _logger );
		}

		private function getKey( type:String, eventClass:Class ):String
		{
			return type + eventClass;
		}
	}
}
