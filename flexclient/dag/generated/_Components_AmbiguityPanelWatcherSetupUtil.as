






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
public class _Components_AmbiguityPanelWatcherSetupUtil extends Sprite
    implements mx.binding.IWatcherSetupUtil
{
    public function _Components_AmbiguityPanelWatcherSetupUtil()
    {
        super();
    }

    public static function init(fbs:IFlexModuleFactory):void
    {
        import Components.AmbiguityPanel;
        (Components.AmbiguityPanel).watcherSetupUtil = new _Components_AmbiguityPanelWatcherSetupUtil();
    }

    public function setup(target:Object,
                          propertyGetter:Function,
                          bindings:Array,
                          watchers:Array):void
    {
        import mx.core.UIComponentDescriptor;
        import mx.binding.utils.BindingUtils;
        import mx.containers.Panel;
        import mx.core.DeferredInstanceFromClass;
        import mx.collections.ArrayCollection;
        import mx.utils.ObjectProxy;
        import flash.events.MouseEvent;
        import mx.controls.Spacer;
        import mx.containers.ControlBar;
        import mx.controls.DataGrid;
        import Components.CheckBoxItemRenderer;
        import mx.rpc.events.ResultEvent;
        import mx.core.ClassFactory;
        import mx.controls.CheckBox;
        import mx.core.IFactory;
        import mx.controls.Button;
        import mx.core.DeferredInstanceFromFunction;
        import mx.utils.UIDUtil;
        import Components.DAGPath;
        import flash.events.EventDispatcher;
        import mx.controls.Alert;
        import mx.binding.BindingManager;
        import mx.managers.PopUpManager;
        import mx.core.IDeferredInstance;
        import mx.core.IPropertyChangeNotifier;
        import flash.events.IEventDispatcher;
        import mx.events.PropertyChangeEvent;
        import mx.controls.dataGridClasses.DataGridColumn;
        import mx.core.mx_internal;
        import mx.events.FlexEvent;
        import mx.events.CollectionEvent;
        import flash.events.Event;

        var tempWatcher:mx.binding.Watcher;

        // writeWatcher id=1 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[1] = new mx.binding.PropertyWatcher("pathList",
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
