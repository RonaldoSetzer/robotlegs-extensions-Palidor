package robotlegs.bender.extensions.palidor.starlingIntegration.starlingViewMap.impl
{
	import org.flexunit.Assert;
	import org.swiftsuspenders.Injector;

	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.mediatorMap.impl.MediatorMap;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.impl.Context;

	import starling.display.Stage;
	import starling.events.Event;

	public class StarlingViewMapTest
	{
		[Test]
		public function testRegisterStage():void
		{
			var injector:Injector = new Injector();
			injector.map( IContext ).toSingleton( Context );
			injector.map( IMediatorMap ).toSingleton( MediatorMap );

			var starlingViewMap:StarlingViewMap = new StarlingViewMap();
			injector.injectInto( starlingViewMap );

			var stage:Stage = new Stage( 1, 1 );
			starlingViewMap.registerStage( stage );

			Assert.assertTrue( stage.hasEventListener( Event.ADDED ) );
			Assert.assertTrue( stage.hasEventListener( Event.REMOVED ) );
		}
	}
}
