package robotlegs.bender.extensions.palidor.starlingIntegration.starlingViewMap.impl
{
	import org.flexunit.Assert;
	import org.swiftsuspenders.Injector;

	import robotlegs.bender.extensions.palidor.starlingIntegration.starlingViewMap.api.IStarlingEventMap;

	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.EventDispatcher;

	public class StarlingMediatorTest
	{
		private static var injector:Injector;

		private static var mediator:MockStarlingMediator;
		private static var view:Sprite;
		private static var eventType:String;
		private static var handler:Function;

		[BeforeClass]
		public static function setUpClass():void
		{
			injector = new Injector();
			injector.map( EventDispatcher ).asSingleton();
			injector.map( IStarlingEventMap ).toType( StarlingEventMap );

			eventType = Event.COMPLETE;
			handler = function ( e:Event ):void
			{
			};
		}

		[Before]
		public function setUp():void
		{
			mediator = new MockStarlingMediator();
			injector.injectInto( mediator );

			view = new Sprite();
			mediator.viewComponent = view;
		}

		[Test]
		public function testAddContextListener():void
		{
			mediator.public_addContextListener( eventType, handler );
			Assert.assertTrue( mediator.eventDispatcher.hasEventListener( eventType ) );
		}

		[Test]
		public function testAddViewListener():void
		{
			mediator.public_addViewListener( eventType, handler );
			Assert.assertTrue( view.hasEventListener( eventType ) );
		}

		[Test]
		public function testRemoveContextListener():void
		{
			mediator.public_addContextListener( eventType, handler );
			mediator.public_removeContextListener( eventType, handler );
			Assert.assertFalse( mediator.eventDispatcher.hasEventListener( eventType ) );
		}

		[Test]
		public function testRemoveViewListener():void
		{
			mediator.public_addViewListener( eventType, handler );
			mediator.public_removeViewListener( eventType, handler );
			Assert.assertFalse( view.hasEventListener( eventType ) );
		}

		[Test]
		public function testDispatch():void
		{
			var hasDispatched:Boolean = false;
			mediator.eventDispatcher.addEventListener(Event.COMPLETE,function ( e:Event ):void
			{
				hasDispatched = true;
			});
			mediator.public_dispatch( new Event(Event.COMPLETE) );
			Assert.assertTrue( hasDispatched );
		}

		[After]
		public function tearDown():void
		{
			mediator.eventDispatcher.removeEventListeners();
			mediator = null;
			view = null;
		}

		[AfterClass]
		public static function tearDownClass():void
		{
			injector = null;
		}
	}
}
