






package
{
import flash.display.Sprite;
import mx.core.IFlexModuleFactory;
import mx.binding.ArrayElementWatcher;
import mx.binding.FunctionReturnWatcher;
import mx.binding.IWatcherSetupUtil;
import mx.binding.PropertyWatcher;
import mx.binding.RepeaterComponentWatcher;
import mx.binding.RepeaterItemWatcher;
import mx.binding.XMLWatcher;
import mx.binding.Watcher;

[ExcludeClass]
[Mixin]
public class _Components_SingleNodeCustomFormulaNodeWatcherSetupUtil extends Sprite
    implements mx.binding.IWatcherSetupUtil
{
    public function _Components_SingleNodeCustomFormulaNodeWatcherSetupUtil()
    {
        super();
    }

    public static function init(fbs:IFlexModuleFactory):void
    {
        import Components.SingleNodeCustomFormulaNode;
        (Components.SingleNodeCustomFormulaNode).watcherSetupUtil = new _Components_SingleNodeCustomFormulaNodeWatcherSetupUtil();
    }

    public function setup(target:Object,
                          propertyGetter:Function,
                          bindings:Array,
                          watchers:Array):void
    {
        import mx.core.UIComponentDescriptor;
        import mx.core.DeferredInstanceFromClass;
        import mx.utils.ObjectProxy;
        import flash.events.MouseEvent;
        import flash.utils.IExternalizable;
        import mx.core.ClassFactory;
        import mx.rpc.events.ResultEvent;
        import mx.core.IFactory;
        import mx.containers.VBox;
        import mx.controls.Button;
        import mx.core.DeferredInstanceFromFunction;
        import mx.utils.UIDUtil;
        import mx.rpc.events.FaultEvent;
        import flash.events.EventDispatcher;
        import Components.DAGConstants;
        import mx.containers.HBox;
        import mx.binding.BindingManager;
        import mx.controls.Label;
        import mx.core.IDeferredInstance;
        import mx.controls.Menu;
        import mx.core.IPropertyChangeNotifier;
        import flash.events.IEventDispatcher;
        import mx.events.PropertyChangeEvent;
        import mx.events.MenuEvent;
        import mx.core.mx_internal;
        import mx.events.FlexEvent;
        import mx.containers.Box;
        import flash.events.Event;

        var tempWatcher:mx.binding.Watcher;

        // writeWatcher id=1 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[1] = new mx.binding.PropertyWatcher("customFormulaString",
            {
                propertyChange: true
            }
                                                                 );


        // writeWatcherBottom id=1 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        // writePropertyWatcherBottom id=1 size=1
        watchers[1].addListener(bindings[0]);
        watchers[1].propertyGetter = propertyGetter;
        watchers[1].updateParent(target);

 






        bindings[0].uiComponentWatcher = 1;
        bindings[0].execute();
    }
}

}
