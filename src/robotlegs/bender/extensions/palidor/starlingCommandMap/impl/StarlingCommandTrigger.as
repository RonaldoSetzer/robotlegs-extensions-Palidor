/**
 * ...
 * @author Ronaldo Santiago
 */
package robotlegs.bender.extensions.palidor.starlingCommandMap.impl
{
	import robotlegs.bender.extensions.commandCenter.api.CommandPayload;
	import robotlegs.bender.extensions.commandCenter.api.ICommandExecutor;
	import robotlegs.bender.extensions.commandCenter.api.ICommandMappingList;
	import robotlegs.bender.extensions.commandCenter.api.ICommandTrigger;
	import robotlegs.bender.extensions.commandCenter.impl.CommandExecutor;
	import robotlegs.bender.extensions.commandCenter.impl.CommandMapper;
	import robotlegs.bender.extensions.commandCenter.impl.CommandMappingList;
	import robotlegs.bender.framework.api.IInjector;
	import robotlegs.bender.framework.api.ILogger;

	import starling.events.Event;
	import starling.events.EventDispatcher;

	public class StarlingCommandTrigger implements ICommandTrigger
	{
		private var _dispatcher:EventDispatcher;
		private var _type:String;
		private var _eventClass:Class;
		private var _mappings:ICommandMappingList;
		private var _executor:ICommandExecutor;

		public function StarlingCommandTrigger( injector:IInjector, dispatcher:EventDispatcher, type:String, eventClass:Class = null, processors:Array = null, logger:ILogger = null )
		{
			_dispatcher = dispatcher;
			_type = type;
			_eventClass = eventClass;
			_mappings = new CommandMappingList( this, processors, logger );
			_executor = new CommandExecutor( injector, _mappings.removeMapping );
		}

		public function createMapper():CommandMapper
		{
			return new CommandMapper( _mappings );
		}

		public function activate():void
		{
			_dispatcher.addEventListener( _type, eventHandler );
		}

		public function deactivate():void
		{
			_dispatcher.removeEventListener( _type, eventHandler );
		}

		public function toString():String
		{
			return _eventClass + " with selector '" + _type + "'";
		}

		private function eventHandler( event:Event ):void
		{
			const eventConstructor:Class = event["constructor"] as Class;
			var payloadEventClass:Class;

			if ( eventConstructor == _eventClass || (!_eventClass) )
			{
				payloadEventClass = eventConstructor;
			} else if ( _eventClass == Event )
			{
				payloadEventClass = _eventClass;
			} else
			{
				return;
			}
			_executor.executeCommands( _mappings.getList(), new CommandPayload( [event], [payloadEventClass] ) );
		}
	}
}
