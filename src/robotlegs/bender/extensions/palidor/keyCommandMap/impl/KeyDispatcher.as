/**
 * ...
 * @author Ronaldo Santiago
 */
package robotlegs.bender.extensions.palidor.keyCommandMap.impl
{
	import flash.utils.Dictionary;

	import robotlegs.bender.extensions.palidor.keyCommandMap.api.IKeyDispatcher;

	public class KeyDispatcher implements IKeyDispatcher
	{
		protected var _map:Dictionary;

		public function KeyDispatcher()
		{
			_map = new Dictionary();
		}

		public function add( key:Object, handler:Function ):void
		{
			_map[key] = handler;
		}

		public function remove( key:Object ):void
		{
			delete _map[key];
		}

		public function dispatch( key:Object ):void
		{
			if ( _map[key] ) _map[key]();
		}
	}
}
