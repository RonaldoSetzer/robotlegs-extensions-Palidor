package robotlegs.bender.extensions.palidor.starlingIntegration.starlingViewManager.impl
{
	import org.flexunit.Assert;

	import starling.display.Sprite;

	public class StarlingViewManagerTest
	{
		private var viewManager:MockStarlingViewManager;
		private var rootView:Sprite;
		private var view:Sprite;

		[Before]
		public function setUp():void
		{
			rootView = new Sprite();
			view = new Sprite();
			viewManager = new MockStarlingViewManager();
			viewManager.registerRootContainer( rootView );
			viewManager.setView( view );
		}

		[Test]
		public function testRegisterRootContainer():void
		{
			Assert.assertEquals( viewManager.root, rootView );
		}

		[Test]
		public function testSetView():void
		{
			var newView:Sprite = new Sprite();
			viewManager.setView( newView );

			Assert.assertEquals( viewManager.public_var_currentView(), newView );
			Assert.assertTrue( viewManager.public_var_root().contains( newView ) );
			Assert.assertFalse( viewManager.public_var_root().contains( view ) );
		}

		[Test]
		public function testAddFloatingView():void
		{
			var floatingView:Sprite = new Sprite();

			viewManager.addFloatingView( floatingView );

			Assert.assertEquals( viewManager.public_var_root().getChildIndex( view ), 0 );
			Assert.assertEquals( viewManager.public_var_root().getChildIndex( floatingView ), 1 );
			Assert.assertEquals( viewManager.public_var_floatingViews().length, 1 );

			viewManager.addFloatingView( new Sprite() );

			Assert.assertEquals( viewManager.public_var_floatingViews().length, 2 );
		}

		[Test]
		public function testRemoveCurrentView():void
		{
			viewManager.removeCurrentView( view );

			Assert.assertFalse( viewManager.public_var_root().contains( view ) );
		}

		[Test]
		public function testRemoveFloatingView():void
		{
			var floatingView:Sprite = new Sprite();

			viewManager.addFloatingView( floatingView );
			viewManager.removeFloatingView( floatingView );

			Assert.assertFalse( viewManager.public_var_root().contains( floatingView ) );
			Assert.assertEquals( viewManager.public_var_floatingViews().length, 0  );
		}

		[Test]
		public function testRemoveAll():void
		{
			viewManager.addFloatingView( new Sprite() );
			viewManager.removeAll();

			Assert.assertEquals( viewManager.public_var_root().numChildren, 0 );
		}

		[After]
		public function tearDown():void
		{
			viewManager = null;
			rootView = null;
			view = null;
		}
	}
}
