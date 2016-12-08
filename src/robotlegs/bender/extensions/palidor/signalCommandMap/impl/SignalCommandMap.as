/**
 * ...
 * @author Ronaldo Santiago
 */
package robotlegs.bender.extensions.palidor.signalCommandMap.impl
{
	import robotlegs.bender.extensions.commandCenter.dsl.ICommandMapper;
	import robotlegs.bender.extensions.commandCenter.dsl.ICommandUnmapper;
	import robotlegs.bender.extensions.commandCenter.impl.CommandTriggerMap;
	import robotlegs.bender.extensions.palidor.signalCommandMap.api.ISignalCommandMap;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IInjector;
	import robotlegs.bender.framework.api.ILogger;

	public class SignalCommandMap implements ISignalCommandMap
	{
		private const _mappingProcessors:Array = [];

		private var _injector:IInjector;
		private var _triggerMap:CommandTriggerMap;
		private var _logger:ILogger;

		public function SignalCommandMap( context:IContext )
		{
			_injector = context.injector;
			_logger = context.getLogger( this );
			_triggerMap = new CommandTriggerMap( getKey, createTrigger );
		}

		public function map( signalClass:Class ):ICommandMapper
		{
			return getTrigger( signalClass ).createMapper();
		}

		public function unmap( signalClass:Class ):ICommandUnmapper
		{
			return getTrigger( signalClass ).createMapper();
		}

		public function addMappingProcessor( handler:Function ):ISignalCommandMap
		{
			if ( _mappingProcessors.indexOf( handler ) == -1 )
				_mappingProcessors.push( handler );

			return this;
		}

		private function getKey( signalClass:Class ):Object
		{
			return signalClass;
		}

		private function getTrigger( signalClass:Class ):SignalCommandTrigger
		{
			return _triggerMap.getTrigger( signalClass ) as SignalCommandTrigger
		}

		private function createTrigger( signalClass:Class ):SignalCommandTrigger
		{
			return new SignalCommandTrigger( _injector, signalClass, _mappingProcessors, _logger );
		}
	}
}