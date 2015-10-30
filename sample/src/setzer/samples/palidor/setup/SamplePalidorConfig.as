package setzer.samples.palidor.setup
{
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.palidor.api.IFlowManager;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IContext;

	import setzer.samples.palidor.events.FlowEvent;
	import setzer.samples.palidor.mediators.SecondViewMediator;
	import setzer.samples.palidor.mediators.FirstPopupMediator;
	import setzer.samples.palidor.mediators.FirstViewMediator;
	import setzer.samples.palidor.views.SecondView;
	import setzer.samples.palidor.views.FirstPopup;
	import setzer.samples.palidor.views.FirstView;

	import starling.events.EventDispatcher;

	public class SamplePalidorConfig implements IConfig
	{
		[Inject]
		public var eventDispatcher:EventDispatcher;

		[Inject]
		public var mediatorMap:IMediatorMap;

		[Inject]
		public var context:IContext;

		[Inject]
		public var flowManager:IFlowManager;

		public function configure():void
		{
			context.afterInitializing( init );
		}

		public function init():void
		{
			mapMediators();
			mapFlowManager();

			eventDispatcher.dispatchEvent( new FlowEvent( FlowEvent.SHOW_FIRST_VIEW ) );
		}

		public function mapMediators():void
		{
			mediatorMap.map( FirstView ).toMediator( FirstViewMediator );
			mediatorMap.map( SecondView ).toMediator( SecondViewMediator );
			mediatorMap.map( FirstPopup ).toMediator( FirstPopupMediator );
		}

		public function mapFlowManager():void
		{
			flowManager.mapSetView( FlowEvent.SHOW_FIRST_VIEW, FirstView );
			flowManager.mapSetView( FlowEvent.SHOW_SECOND_VIEW, SecondView );
			flowManager.mapAddView( FlowEvent.SHOW_FIRST_POPUP, FirstPopup );
		}
	}
}
