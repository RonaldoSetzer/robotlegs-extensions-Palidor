package robotlegs.bender.extensions.palidor.impl
{
	import robotlegs.bender.extensions.palidor.api.IViewManager;

	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;

	public class ViewManager implements IViewManager
	{
		private var _root:DisplayObjectContainer;
		private var _floatingViews:Vector.<DisplayObject>;
		private var _currentView:DisplayObject;

		public function init( displayObjectContainer:DisplayObjectContainer ):void
		{
			_root = displayObjectContainer;
			_floatingViews = new Vector.<DisplayObject>;
		}

		public function addView( view:DisplayObject ):DisplayObject
		{
			if ( _floatingViews.indexOf( view ) == -1 )
			{
				_floatingViews.push( view );
				_root.addChild( view );
			}
			return view;
		}

		public function removeView( view:DisplayObject, dispose:Boolean = false ):void
		{
			var index:int = _floatingViews.indexOf( view );

			if ( index == -1 ) return;

			_floatingViews.splice( index, 1 );
			_root.removeChild( view, dispose );
		}

		public function removeAll( dispose:Boolean = false ):void
		{
			for each ( var view:DisplayObject in _floatingViews )
			{
				removeView( view, dispose );
			}
		}

		public function setView( view:DisplayObject, disposeLastView:Boolean = false ):DisplayObject
		{
			removeLastView( disposeLastView );

			_currentView = view;

			_root.addChild( _currentView );

			return _currentView;
		}

		private function removeLastView( dispose:Boolean ):void
		{
			if ( _root )
				_root.removeChild( _currentView, dispose );
		}

		public function get root():DisplayObjectContainer
		{
			return _root;
		}
	}

}
