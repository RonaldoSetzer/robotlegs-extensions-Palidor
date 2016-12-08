/**
 * ...
 * @author Ronaldo Santiago
 */
package robotlegs.bender.extensions.palidor.starlingIntegration.starlingViewManager.impl
{
	import robotlegs.bender.extensions.palidor.starlingIntegration.starlingViewManager.api.IStarlingViewManager;

	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;

	public class StarlingViewManager implements IStarlingViewManager
	{
		protected var _root:DisplayObjectContainer;
		protected var _floatingViews:Vector.<DisplayObject>;
		protected var _currentView:DisplayObject;

		public function registerRootContainer( displayObjectContainer:DisplayObjectContainer ):void
		{
			_root = displayObjectContainer;
			_floatingViews = new Vector.<DisplayObject>;
		}

		public function addFloatingView( view:DisplayObject ):DisplayObject
		{
			if ( _floatingViews.indexOf( view ) == -1 )
			{
				_floatingViews.push( view );
				_root.addChild( view );
			}
			return view;
		}

		public function removeFloatingView( view:DisplayObject, dispose:Boolean = false ):void
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
				removeFloatingView( view, dispose );
			}
			removeCurrentView( dispose );
		}

		public function setView( view:DisplayObject, disposeLastView:Boolean = false ):DisplayObject
		{
			removeCurrentView( disposeLastView );

			_currentView = view;

			_root.addChildAt( _currentView, 0 );

			return _currentView;
		}

		public function removeCurrentView( dispose:Boolean ):void
		{
			if ( _root && _currentView )
				_root.removeChild( _currentView, dispose );
		}

		public function get root():DisplayObjectContainer
		{
			return _root;
		}
	}
}
