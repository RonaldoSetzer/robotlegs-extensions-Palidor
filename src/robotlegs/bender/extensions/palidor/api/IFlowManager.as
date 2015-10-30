package robotlegs.bender.extensions.palidor.api
{
	public interface IFlowManager
	{
		function mapSetView( event:String, viewClass:Class ):void;

		function mapAddView( event:String, viewClass:Class ):void;
	}
}
