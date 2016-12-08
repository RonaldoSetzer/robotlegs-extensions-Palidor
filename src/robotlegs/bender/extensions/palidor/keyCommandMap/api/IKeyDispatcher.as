/**
 * ...
 * @author Ronaldo Santiago
 */
package robotlegs.bender.extensions.palidor.keyCommandMap.api
{
	public interface IKeyDispatcher
	{
		function add( key:Object, handler:Function ):void;

		function remove( key:Object ):void;

		function dispatch( key:Object ):void;
	}
}
