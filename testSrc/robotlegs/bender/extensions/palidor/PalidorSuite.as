package robotlegs.bender.extensions.palidor
{
	import robotlegs.bender.extensions.palidor.starlingIntegration.flowManager.impl.FlowManagerTest;
	import robotlegs.bender.extensions.palidor.starlingIntegration.starlingViewMap.impl.EventItemTest;
	import robotlegs.bender.extensions.palidor.starlingIntegration.starlingViewMap.impl.StarlingEventMapTest;
	import robotlegs.bender.extensions.palidor.starlingIntegration.starlingViewMap.impl.StarlingMediatorTest;
	import robotlegs.bender.extensions.palidor.starlingIntegration.starlingViewMap.impl.StarlingViewMapTest;
	import robotlegs.bender.extensions.palidor.starlingIntegration.starlingViewManager.impl.StarlingViewManagerTest;
	import robotlegs.bender.extensions.palidor.keyCommandMap.impl.KeyDispatcherTest;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class PalidorSuite
	{
		public var eventItemTest:EventItemTest;
		public var starlingEventMapTest:StarlingEventMapTest;
		public var starlingViewMapTest:StarlingViewMapTest;
		public var starlingMediatorTest:StarlingMediatorTest;
		public var starlingViewManagerTest:StarlingViewManagerTest;
		public var flowManagerTest:FlowManagerTest;
		public var keyDispatcherTest:KeyDispatcherTest;
	}
}
