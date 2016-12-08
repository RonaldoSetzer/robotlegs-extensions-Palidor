/**
 * ...
 * @author Ronaldo Santiago
 */
package robotlegs.bender.extensions.palidor.starlingContextView.api
{
	import starling.display.DisplayObjectContainer;

	public interface IStarlingContextView
	{
		function get view():DisplayObjectContainer;

		function set view( value:DisplayObjectContainer ):void;
	}
}
