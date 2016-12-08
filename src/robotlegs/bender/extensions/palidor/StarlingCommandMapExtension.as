/**
 * ...
 * @author Ronaldo Santiago
 */
package robotlegs.bender.extensions.palidor
{
	import robotlegs.bender.extensions.palidor.starlingCommandMap.api.IStarlingCommandMap;
	import robotlegs.bender.extensions.palidor.starlingCommandMap.impl.StarlingCommandMap;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IExtension;
	import robotlegs.bender.framework.impl.UID;

	public class StarlingCommandMapExtension implements IExtension
	{
		private const _uid:String = UID.create( StarlingCommandMapExtension );

		public function extend( context:IContext ):void
		{
			context.injector.map( IStarlingCommandMap ).toSingleton( StarlingCommandMap );
		}

		public function toString():String
		{
			return _uid;
		}
	}
}
