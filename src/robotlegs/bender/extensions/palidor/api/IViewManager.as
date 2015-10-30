package robotlegs.bender.extensions.palidor.api
{
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;

	public interface IViewManager
	{
		function addView( view:DisplayObject ):DisplayObject;

		function setView( view:DisplayObject, disposeLastView:Boolean = false ):DisplayObject;

		function removeView( view:DisplayObject, dispose:Boolean = false ):void;

		function removeAll( dispose:Boolean = false ):void;

		function get root():DisplayObjectContainer;


	}
}
