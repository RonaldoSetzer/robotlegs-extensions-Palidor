/**
 * ...
 * @author Ronaldo Santiago
 */
package robotlegs.bender.extensions.palidor.signalCommandMap.impl
{
	import org.osflash.signals.ISignal;

	import robotlegs.bender.extensions.commandCenter.api.CommandPayload;
	import robotlegs.bender.extensions.commandCenter.api.ICommandExecutor;
	import robotlegs.bender.extensions.commandCenter.api.ICommandMappingList;
	import robotlegs.bender.extensions.commandCenter.api.ICommandTrigger;
	import robotlegs.bender.extensions.commandCenter.impl.CommandExecutor;
	import robotlegs.bender.extensions.commandCenter.impl.CommandMapper;
	import robotlegs.bender.extensions.commandCenter.impl.CommandMappingList;
	import robotlegs.bender.framework.api.IInjector;
	import robotlegs.bender.framework.api.ILogger;

	public class SignalCommandTrigger implements ICommandTrigger
	{
		private var _signal:ISignal;
		private var _injector:IInjector;
		private var _signalClass:Class;
		private var _mappings:ICommandMappingList;
		private var _executor:ICommandExecutor;

		public function SignalCommandTrigger( injector:IInjector, signalClass:Class = null, processors:Array = null, logger:ILogger = null )
		{
			_injector = injector;
			_signalClass = signalClass;
			_mappings = new CommandMappingList( this, processors, logger );
			_executor = new CommandExecutor( injector, _mappings.removeMapping );
		}

		public function createMapper():CommandMapper
		{
			return new CommandMapper( _mappings );
		}

		public function activate():void
		{
			if ( !_injector.hasMapping( _signalClass ) )
				_injector.map( _signalClass ).asSingleton();
			_signal = _injector.getInstance( _signalClass );
			_signal.add( eventHandler );
		}

		public function deactivate():void
		{
			if ( _signal )
				_signal.remove( eventHandler );
		}

		public function toString():String
		{
			return String( _signalClass );
		}

		private function eventHandler( ...valueObjects ):void
		{
			var commandPayload:CommandPayload = new CommandPayload( valueObjects, _signal.valueClasses );
			_executor.executeCommands( _mappings.getList(), commandPayload );
		}
	}
}

