package robotlegs.bender.extensions.palidor.impl
{
	import robotlegs.bender.extensions.palidor.api.IStarlingContextView;

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
