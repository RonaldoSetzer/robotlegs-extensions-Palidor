/**
 * ...
 * @author Ronaldo Santiago
 */
package robotlegs.bender.extensions.palidor.starlingIntegration.flowManager.api
{
	public interface IViewMapping
	{
		function toFloatingView( viewClass:Class ):void;

		function toView( viewClass:Class ):void;
	}
}
