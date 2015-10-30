package robotlegs.bender.extensions.palidor.api
{
	import starling.display.DisplayObject;

	public interface IStarlingViewMap
	{
		function addStarlingView( view:DisplayObject ):void;

		function removeStarlingView( view:DisplayObject ):void;
	}
}
