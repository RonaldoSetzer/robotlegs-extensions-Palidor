/**
 * ...
 * @author Ronaldo Santiago
 */
package robotlegs.bender.extensions.palidor
{
	import robotlegs.bender.extensions.palidor.signalCommandMap.api.ISignalCommandMap;
	import robotlegs.bender.extensions.palidor.signalCommandMap.impl.SignalCommandMap;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IExtension;
	import robotlegs.bender.framework.impl.UID;

	public class SignalCommandMapExtension implements IExtension
	{
		private const _uid:String = UID.create( SignalCommandMapExtension );

		public function extend( context:IContext ):void
		{
			context.injector.map( ISignalCommandMap ).toSingleton( SignalCommandMap );
		}

		public function toString():String
		{
			return _uid;
		}
	}
}
