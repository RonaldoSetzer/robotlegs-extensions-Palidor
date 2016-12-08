/**
 * ...
 * @author Ronaldo Santiago
 */
package robotlegs.bender.extensions.palidor.keyCommandMap.api
{
	import robotlegs.bender.extensions.commandCenter.dsl.ICommandMapper;
	import robotlegs.bender.extensions.commandCenter.dsl.ICommandUnmapper;

	public interface IKeyCommandMap
	{
		function map( key:Object ):ICommandMapper;

		function unmap( key:Object ):ICommandUnmapper;

		function addMappingProcessor( handler:Function ):IKeyCommandMap;
	}
}
