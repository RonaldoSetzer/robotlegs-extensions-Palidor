package robotlegs.bender.extensions.palidor.keyCommandMap.impl
{
	import org.flexunit.Assert;

	public class KeyDispatcherTest
	{
		private var keyDispatcher:MockKeyDispatcher;
		private var handler:Function;
		private var result:int;
		private var key:Object;

		[Before]
		public function setUp():void
		{
			keyDispatcher = new MockKeyDispatcher();
			result = 42;
			handler = function ():int
			{
				return result;
			};
			key = "test";
			keyDispatcher.add( key, handler );
		}

		[Test]
		public function testAdd():void
		{
			Assert.assertEquals( keyDispatcher.public_var_map()[key], handler );
		}

		[Test]
		public function testDispatch():void
		{
			Assert.assertEquals( keyDispatcher.public_var_map()[key](), result );
		}

		[Test]
		public function testRemove():void
		{
			keyDispatcher.remove( key );
			Assert.assertNull( keyDispatcher.public_var_map()[key] );
		}

		[After]
		public function tearDown():void
		{
			keyDispatcher = null;
			result = 0;
			handler = null;
			key = "";
		}
	}
}
