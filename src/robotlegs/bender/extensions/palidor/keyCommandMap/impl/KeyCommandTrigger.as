/**
 * ...
 * @author Ronaldo Santiago
 */
package robotlegs.bender.extensions.palidor.keyCommandMap.impl
{
	import robotlegs.bender.extensions.commandCenter.api.ICommandExecutor;
	import robotlegs.bender.extensions.commandCenter.api.ICommandMappingList;
	import robotlegs.bender.extensions.commandCenter.api.ICommandTrigger;
	import robotlegs.bender.extensions.commandCenter.impl.CommandExecutor;
	import robotlegs.bender.extensions.commandCenter.impl.CommandMapper;
	import robotlegs.bender.extensions.commandCenter.impl.CommandMappingList;
	import robotlegs.bender.extensions.palidor.keyCommandMap.api.IKeyDispatcher;
	import robotlegs.bender.framework.api.IInjector;
	import robotlegs.bender.framework.api.ILogger;

	public class KeyCommandTrigger implements ICommandTrigger
	{
		private var _dispatcher:IKeyDispatcher;
		private var _key:Object;
		private var _eventClass:Class;
		private var _mappings:ICommandMappingList;
		private var _executor:ICommandExecutor;

		public function KeyCommandTrigger( injector:IInjector, dispatcher:IKeyDispatcher, key:Object, processors:Array = null, logger:ILogger = null )
		{
			_dispatcher = dispatcher;
			_key = key;
			_mappings = new CommandMappingList( this, processors, logger );
			_executor = new CommandExecutor( injector, _mappings.removeMapping );
		}

		public function createMapper():CommandMapper
		{
			return new CommandMapper( _mappings );
		}

		public function activate():void
		{
			_dispatcher.add( _key, eventHandler );
		}

		public function deactivate():void
		{
			_dispatcher.remove( _key );
		}

		public function toString():String
		{
			return _eventClass + " with selector '" + _key + "'";
		}

		private function eventHandler():void
		{
			_executor.executeCommands( _mappings.getList() );
		}
	}
}
