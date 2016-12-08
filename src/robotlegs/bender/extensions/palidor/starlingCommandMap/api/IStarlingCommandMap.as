/**
 * ...
 * @author Ronaldo Santiago
 */
package robotlegs.bender.extensions.palidor.starlingCommandMap.api
{
	import robotlegs.bender.extensions.commandCenter.dsl.ICommandMapper;
	import robotlegs.bender.extensions.commandCenter.dsl.ICommandUnmapper;

	public interface IStarlingCommandMap
	{
		function map( type:String, eventClass:Class = null ):ICommandMapper;

		function unmap( type:String, eventClass:Class = null ):ICommandUnmapper;

		function addMappingProcessor( handler:Function ):IStarlingCommandMap;
	}
}
