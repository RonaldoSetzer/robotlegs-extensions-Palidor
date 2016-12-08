/**
 * ...
 * @author Ronaldo Santiago
 */
package robotlegs.bender.extensions.palidor.starlingIntegration.starlingViewMap.api
{
	import starling.events.EventDispatcher;

	public interface IStarlingEventMap
	{
		function mapListener( target:EventDispatcher, event:String, listener:Function ):void;

		function unmapListener( target:EventDispatcher, event:String, listener:Function ):void;

		function unmapListeners():void;

		function suspend():void;

		function resume():void;
	}
}
