package robotlegs.bender.extensions.palidor.starlingIntegration.starlingViewManager.impl
{
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;

	public class MockStarlingViewManager extends StarlingViewManager
	{
		public function public_var_root():DisplayObjectContainer
		{
			return _root;
		}

		public function public_var_floatingViews():Vector.<DisplayObject>
		{
			return _floatingViews;
		}
		public function public_var_currentView():DisplayObject
		{
			return _currentView;
		}
	}
}
