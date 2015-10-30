package robotlegs.bender.extensions.palidor.impl
{
	import robotlegs.bender.extensions.palidor.api.EventItem;
	import robotlegs.bender.extensions.palidor.api.IEventMap;

	import starling.events.EventDispatcher;

	public class EventMap implements IEventMap
	{
		private var _map:Vector.<EventItem>;
		private var _suspended:Boolean;

		public function EventMap()
		{
			_map = new Vector.<EventItem>();
			_suspended = false;
		}

		public function mapListener( target:EventDispatcher, event:String, listener:Function ):void
		{
			if ( getIndex( target, event, listener ) != -1 ) return;

			var eventItem:EventItem = new EventItem( target, event, listener );
			_map.push( eventItem );

			if ( !_suspended ) eventItem.addEventListener();
		}

		public function unmapListener( target:EventDispatcher, event:String, listener:Function ):void
		{
			var index:int = getIndex( target, event, listener );

			if ( index == -1 ) return;

			target.removeEventListener( event, listener );
			_map.splice( index, 1 );
		}

		public function unmapListeners():void
		{
			var eventItem:EventItem;
			while ( _map.length > 0 )
			{
				eventItem = _map.pop();
				eventItem.removeEventListener();
			}
		}

		private function getIndex( target:EventDispatcher, event:String, listener:Function ):int
		{
			var total:int = _map.length;
			var item:EventItem;

			for ( var i:int = 0; i < total; i++ )
			{
				item = _map[i];
				if ( item.equals( target, event, listener ) ) return i;
			}

			return -1;
		}

		public function suspend():void
		{
			if ( _suspended ) return;

			_suspended = true;

			for each ( var item:EventItem in _map )
			{
				item.removeEventListener();
			}
		}

		public function resume():void
		{
			if ( !_suspended ) return;

			_suspended = false;

			for each ( var item:EventItem in _map )
			{
				item.addEventListener();
			}
		}
	}
}