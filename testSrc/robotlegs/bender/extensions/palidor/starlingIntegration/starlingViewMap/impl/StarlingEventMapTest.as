package robotlegs.bender.extensions.palidor.starlingIntegration.starlingViewMap.impl
{
	import flash.events.Event;

	import org.flexunit.Assert;

	import starling.events.EventDispatcher;

	public class StarlingEventMapTest
	{
		private static var eventType:String;
		private static var eventDispatcher:EventDispatcher;
		private static var eventMap:StarlingEventMap;
		private static var handler:Function;

		[BeforeClass]
		public static function setUpClass():void
		{
			eventType = Event.COMPLETE;
			handler = function ( e:Event ):void
			{
			};
			eventDispatcher = new EventDispatcher();
		}

		[Before]
		public function setUp():void
		{
			eventDispatcher.removeEventListeners();
			eventMap = new StarlingEventMap();
		}

		[Test]
		public function testSuspend():void
		{
			eventMap.mapListener( eventDispatcher, eventType, handler );
			eventMap.mapListener( eventDispatcher, Event.ADDED, handler );
			eventMap.suspend();

			Assert.assertFalse( eventDispatcher.hasEventListener( eventType ) );
			Assert.assertFalse( eventDispatcher.hasEventListener( eventType ) );
		}

		[Test]
		public function testResume():void
		{
			eventMap.mapListener( eventDispatcher, eventType, handler );
			eventMap.mapListener( eventDispatcher, Event.ADDED, handler );
			eventMap.suspend();
			eventMap.resume();

			Assert.assertTrue( eventDispatcher.hasEventListener( eventType ) );
			Assert.assertTrue( eventDispatcher.hasEventListener( eventType ) );
		}

		[Test]
		public function testUnmapListeners():void
		{
			eventMap.mapListener( eventDispatcher, eventType, handler );
			eventMap.mapListener( eventDispatcher, Event.ADDED, handler );
			eventMap.unmapListeners();

			Assert.assertFalse( eventDispatcher.hasEventListener( eventType ) );
			Assert.assertFalse( eventDispatcher.hasEventListener( eventType ) );
		}

		[Test]
		public function testUnmapListener():void
		{
			eventMap.mapListener( eventDispatcher, eventType, handler );
			eventMap.unmapListener( eventDispatcher, eventType, handler );
			Assert.assertFalse( eventDispatcher.hasEventListener( eventType ) );
		}

		[Test]
		public function testMapListener():void
		{
			eventMap.mapListener( eventDispatcher, eventType, handler );
			Assert.assertTrue( eventDispatcher.hasEventListener( eventType ) );
		}

		[Test]
		public function testMapListener_suspend():void
		{
			eventMap.suspend();
			eventMap.mapListener( eventDispatcher, eventType, handler );
			Assert.assertFalse( eventDispatcher.hasEventListener( eventType ) );

			eventMap.resume();
			Assert.assertTrue( eventDispatcher.hasEventListener( eventType ) );
		}

		[After]
		public function tearDown():void
		{
			eventMap = null;
		}

		[AfterClass]
		public static function tearDownClass():void
		{
			eventType = null;
			handler = null;
			eventDispatcher = null;
		}
	}
}
