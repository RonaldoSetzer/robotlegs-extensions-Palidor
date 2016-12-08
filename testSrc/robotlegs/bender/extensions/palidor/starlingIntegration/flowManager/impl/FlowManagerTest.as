package robotlegs.bender.extensions.palidor.starlingIntegration.flowManager.impl
{
	import org.flexunit.Assert;
	import org.swiftsuspenders.Injector;

	import robotlegs.bender.extensions.palidor.starlingIntegration.starlingViewManager.api.IStarlingViewManager;
	import robotlegs.bender.extensions.palidor.starlingIntegration.starlingViewManager.impl.StarlingViewManager;

	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.EventDispatcher;

	public class FlowManagerTest
	{
		private static var injector:Injector;

		private static var flowManager:FlowManager;

		[BeforeClass]
		public static function setUpClass():void
		{
			injector = new Injector();
			injector.map( EventDispatcher ).asSingleton();
			injector.map( IStarlingViewManager ).toType( StarlingViewManager );

		}

		[Before]
		public function setUp():void
		{
			flowManager = new FlowManager();
			injector.injectInto( flowManager );

			StarlingViewManager( flowManager.viewManager ).registerRootContainer( new Sprite() );
			flowManager.eventDispatcher.removeEventListeners();
		}

		[Test]
		public function testMapView():void
		{
			flowManager.map( "mockView" ).toView( MockView );
			flowManager.eventDispatcher.dispatchEvent( new Event( "mockView" ) );

			Assert.assertTrue( flowManager.viewManager.root.getChildAt( 0 ) is MockView );
		}

		[Test]
		public function testMapFloatingView():void
		{
			StarlingViewManager( flowManager.viewManager ).setView(new MockView());

			flowManager.map( "mockFloatingView" ).toFloatingView( MockFloatingView );
			flowManager.eventDispatcher.dispatchEvent( new Event( "mockFloatingView" ) );

			Assert.assertFalse( flowManager.viewManager.root.getChildAt( 0 ) is MockFloatingView );
			Assert.assertTrue( flowManager.viewManager.root.getChildAt( 1 ) is MockFloatingView );
		}

		[After]
		public function tearDown():void
		{
			flowManager = null;
		}

		[AfterClass]
		public static function tearDownClass():void
		{
			injector = null;
		}


	}
}
