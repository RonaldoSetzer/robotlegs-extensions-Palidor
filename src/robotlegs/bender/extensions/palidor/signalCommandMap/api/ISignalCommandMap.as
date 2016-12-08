/**
 * ...
 * @author Ronaldo Santiago
 */
package robotlegs.bender.extensions.palidor.signalCommandMap.api
{
	import robotlegs.bender.extensions.commandCenter.dsl.ICommandMapper;
	import robotlegs.bender.extensions.commandCenter.dsl.ICommandUnmapper;

	public interface ISignalCommandMap
	{
		function map( signalClass:Class ):ICommandMapper;

		function unmap( signalClass:Class ):ICommandUnmapper;

		function addMappingProcessor( handler:Function ):ISignalCommandMap;
	}
}
