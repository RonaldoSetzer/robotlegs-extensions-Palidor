/**
 * ...
 * @author Ronaldo Santiago
 */
package robotlegs.bender.extensions.palidor
{
	import robotlegs.bender.extensions.palidor.keyCommandMap.api.IKeyCommandMap;
	import robotlegs.bender.extensions.palidor.keyCommandMap.api.IKeyDispatcher;
	import robotlegs.bender.extensions.palidor.keyCommandMap.impl.KeyCommandMap;
	import robotlegs.bender.extensions.palidor.keyCommandMap.impl.KeyDispatcher;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IExtension;
	import robotlegs.bender.framework.impl.UID;

	public class KeyCommandMapExtension implements IExtension
	{
		private const _uid:String = UID.create( KeyCommandMapExtension );

		public function extend( context:IContext ):void
		{
			context.injector.map( IKeyDispatcher ).toSingleton( KeyDispatcher );
			context.injector.map( IKeyCommandMap ).toSingleton( KeyCommandMap );
		}

		public function toString():String
		{
			return _uid;
		}
	}
}
