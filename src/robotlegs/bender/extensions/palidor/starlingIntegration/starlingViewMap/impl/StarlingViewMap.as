/**
 * ...
 * @author Ronaldo Santiago
 */
package robotlegs.bender.extensions.palidor.starlingIntegration.starlingViewMap.impl
{
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.palidor.starlingIntegration.starlingViewMap.api.IStarlingViewMap;

	import starling.display.DisplayObject;
	import starling.display.Stage;
	import starling.events.Event;

	public class StarlingViewMap implements IStarlingViewMap
	{
		[Inject]
		public var mediatorMap:IMediatorMap;

		public function registerStage( stage:Stage ):void
		{
			stage.addEventListener( Event.ADDED, onStarlingAdded );
			stage.addEventListener( Event.REMOVED, onStarlingRemoved );
		}

		public function addStarlingView( view:DisplayObject ):void
		{
			mediatorMap.mediate( view );
		}

		public function removeStarlingView( view:DisplayObject ):void
		{
			mediatorMap.unmediate( view );
		}

		private function onStarlingAdded( event:Event ):void
		{
			event.stopImmediatePropagation();
			addStarlingView( event.target as DisplayObject );
		}

		private function onStarlingRemoved( event:Event ):void
		{
			event.stopImmediatePropagation();
			removeStarlingView( event.target as DisplayObject );
		}
	}
}