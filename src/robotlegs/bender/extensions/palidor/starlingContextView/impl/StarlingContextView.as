/**
 * ...
 * @author Ronaldo Santiago
 */
package robotlegs.bender.extensions.palidor.starlingContextView.impl
{
	import robotlegs.bender.extensions.palidor.starlingContextView.api.IStarlingContextView;

	import starling.display.DisplayObjectContainer;

	public class StarlingContextView implements IStarlingContextView
	{
		private var _view:DisplayObjectContainer;

		public function get view():DisplayObjectContainer
		{
			return _view;
		}

		public function set view( value:DisplayObjectContainer ):void
		{
			_view = value;
		}
	}
}
