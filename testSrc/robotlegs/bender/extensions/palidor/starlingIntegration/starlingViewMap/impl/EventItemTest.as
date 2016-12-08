package robotlegs.bender.extensions.palidor.starlingIntegration.starlingViewMap.impl
{
	import org.flexunit.Assert;

	import starling.events.Event;
	import starling.events.EventDispatcher;

	public class EventItemTest
	{
		private static var eventType:String;
		private static var eventDispatcher:EventDispatcher;
		private static var eventItem:EventItem;
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
			eventItem = new EventItem( eventDispatcher, eventType, handler );
		}

		[Test]
		public function testApplyEventListener():void
		{
			Assert.assertFalse( eventDispatcher.hasEventListener( eventType ) );

			eventItem.applyEventListener();

			Assert.assertTrue( eventDispatcher.hasEventListener( eventType ) );
		}

		[Test]
		public function testEquals():void
		{
			Assert.assertTrue( eventItem.equals( eventDispatcher, eventType, handler ) );
			Assert.assertFalse( eventItem.equals( new EventDispatcher(), eventType, handler ) );
			Assert.assertFalse( eventItem.equals( eventDispatcher, Event.ADDED, handler ) );
		}

		[Test]
		public function testRemoveEventListener():void
		{
			eventItem.applyEventListener();
			eventItem.removeEventListener();
			Assert.assertFalse( eventDispatcher.hasEventListener( eventType ) );
		}

		[After]
		public function tearDown():void
		{
			eventItem = null;
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
