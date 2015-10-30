package robotlegs.bender.bundles.palidor
{
	import robotlegs.bender.extensions.contextView.ContextViewExtension;
	import robotlegs.bender.extensions.contextView.ContextViewListenerConfig;
	import robotlegs.bender.extensions.directCommandMap.DirectCommandMapExtension;
	import robotlegs.bender.extensions.enhancedLogging.InjectableLoggerExtension;
	import robotlegs.bender.extensions.enhancedLogging.TraceLoggingExtension;
	import robotlegs.bender.extensions.eventCommandMap.EventCommandMapExtension;
	import robotlegs.bender.extensions.eventDispatcher.EventDispatcherExtension;
	import robotlegs.bender.extensions.localEventMap.LocalEventMapExtension;
	import robotlegs.bender.extensions.mediatorMap.MediatorMapExtension;
	import robotlegs.bender.extensions.modularity.ModularityExtension;
	import robotlegs.bender.extensions.viewManager.StageCrawlerExtension;
	import robotlegs.bender.extensions.viewManager.StageObserverExtension;
	import robotlegs.bender.extensions.viewManager.ViewManagerExtension;
	import robotlegs.bender.extensions.viewProcessorMap.ViewProcessorMapExtension;
	import robotlegs.bender.extensions.vigilance.VigilanceExtension;
	import robotlegs.bender.framework.api.IBundle;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.LogLevel;
	import robotlegs.bender.extensions.palidor.PalidorContextViewExtension;
	import robotlegs.bender.extensions.palidor.PalidorIntegrationExtension;
	import robotlegs.bender.extensions.palidor.PalidorStageSyncExtension;

	public class PalidorBundle implements IBundle
	{
		public function extend( context:IContext ):void
		{
			context.logLevel = LogLevel.DEBUG;

			context.install( TraceLoggingExtension, VigilanceExtension, InjectableLoggerExtension, ContextViewExtension, PalidorContextViewExtension,//Setzer
					EventDispatcherExtension, ModularityExtension, DirectCommandMapExtension, EventCommandMapExtension, LocalEventMapExtension, ViewManagerExtension, StageObserverExtension, MediatorMapExtension, ViewProcessorMapExtension, StageCrawlerExtension, PalidorIntegrationExtension,//Setzer
					PalidorStageSyncExtension//Setzer
			);

			context.configure( ContextViewListenerConfig );
		}
	}
}
