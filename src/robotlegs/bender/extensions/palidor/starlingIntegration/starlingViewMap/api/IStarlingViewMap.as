/**
 * ...
 * @author Ronaldo Santiago
 */
package robotlegs.bender.extensions.palidor.starlingIntegration.starlingViewMap.api
{
	import starling.display.DisplayObject;

	public interface IStarlingViewMap
	{
		function addStarlingView( view:DisplayObject ):void;

		function removeStarlingView( view:DisplayObject ):void;
	}
}
