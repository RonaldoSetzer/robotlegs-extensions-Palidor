package robotlegs.bender.extensions.palidor.api
{

	import starling.events.EventDispatcher;

	public interface IEventMap
	{
		function mapListener( target:EventDispatcher, event:String, listener:Function ):void;

		function unmapListener( target:EventDispatcher, event:String, listener:Function ):void;

		function unmapListeners():void;

		function suspend():void;

		function resume():void;
	}
}
