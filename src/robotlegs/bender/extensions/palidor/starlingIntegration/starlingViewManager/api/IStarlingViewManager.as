/**
 * ...
 * @author Ronaldo Santiago
 */
package robotlegs.bender.extensions.palidor.starlingIntegration.starlingViewManager.api
{
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;

	public interface IStarlingViewManager
	{
		function addFloatingView( view:DisplayObject ):DisplayObject;

		function setView( view:DisplayObject, disposeLastView:Boolean = false ):DisplayObject;

		function removeFloatingView( view:DisplayObject, dispose:Boolean = false ):void;

		function removeCurrentView( dispose:Boolean ):void;

		function removeAll( dispose:Boolean = false ):void;

		function get root():DisplayObjectContainer;
	}
}
