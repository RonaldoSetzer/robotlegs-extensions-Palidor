/**
 * ...
 * @author Ronaldo Santiago
 */
package robotlegs.bender.extensions.palidor.keyCommandMap.impl
{
	import robotlegs.bender.extensions.commandCenter.dsl.ICommandMapper;
	import robotlegs.bender.extensions.commandCenter.dsl.ICommandUnmapper;
	import robotlegs.bender.extensions.commandCenter.impl.CommandTriggerMap;
	import robotlegs.bender.extensions.palidor.keyCommandMap.api.IKeyCommandMap;
	import robotlegs.bender.extensions.palidor.keyCommandMap.api.IKeyDispatcher;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IInjector;
	import robotlegs.bender.framework.api.ILogger;

	public class KeyCommandMap implements IKeyCommandMap
	{
		private const _mappingProcessors:Array = [];

		private var _injector:IInjector;
		private var _triggerMap:CommandTriggerMap;
		private var _logger:ILogger;
		private var _dispatcher:IKeyDispatcher;

		public function KeyCommandMap( context:IContext, dispatcher:IKeyDispatcher )
		{
			_dispatcher = dispatcher;
			_injector = context.injector;
			_logger = context.getLogger( this );
			_triggerMap = new CommandTriggerMap( getKey, createTrigger );
		}

		public function map( key:Object ):ICommandMapper
		{
			return getTrigger( key ).createMapper();
		}

		public function unmap( key:Object ):ICommandUnmapper
		{
			return getTrigger( key ).createMapper();
		}

		public function addMappingProcessor( handler:Function ):IKeyCommandMap
		{
			if ( _mappingProcessors.indexOf( handler ) == -1 )
				_mappingProcessors.push( handler );

			return this;
		}

		private function getKey( key:Object ):String
		{
			return String( key );
		}

		private function getTrigger( key:Object ):KeyCommandTrigger
		{
			return _triggerMap.getTrigger( key ) as KeyCommandTrigger
		}

		private function createTrigger( key:Object ):KeyCommandTrigger
		{
			return new KeyCommandTrigger( _injector, _dispatcher, key, _mappingProcessors, _logger );
		}
	}
}
