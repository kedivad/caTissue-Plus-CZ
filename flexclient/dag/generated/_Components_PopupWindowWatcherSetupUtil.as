






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
public class _Components_PopupWindowWatcherSetupUtil extends Sprite
    implements mx.binding.IWatcherSetupUtil
{
    public function _Components_PopupWindowWatcherSetupUtil()
    {
        super();
    }

    public static function init(fbs:IFlexModuleFactory):void
    {
        import Components.PopupWindow;
        (Components.PopupWindow).watcherSetupUtil = new _Components_PopupWindowWatcherSetupUtil();
    }

    public function setup(target:Object,
                          propertyGetter:Function,
                          bindings:Array,
                          watchers:Array):void
    {
        import mx.core.UIComponentDescriptor;
        import mx.core.DeferredInstanceFromClass;
        import mx.collections.ArrayCollection;
        import mx.utils.ObjectProxy;
        import mx.events.CloseEvent;
        import mx.utils.StringUtil;
        import flash.events.MouseEvent;
        import Components.DAGNode;
        import flash.events.FocusEvent;
        import mx.controls.Spacer;
        import mx.containers.TitleWindow;
        import mx.validators.StringValidator;
        import mx.rpc.events.ResultEvent;
        import mx.core.ClassFactory;
        import mx.core.IFactory;
        import mx.containers.VBox;
        import mx.controls.Button;
        import mx.core.DeferredInstanceFromFunction;
        import mx.controls.DateChooser;
        import mx.controls.List;
        import mx.controls.DateField;
        import mx.utils.UIDUtil;
        import mx.rpc.events.FaultEvent;
        import flash.events.EventDispatcher;
        import Components.CustomFormulaNode;
        import mx.controls.Alert;
        import mx.containers.HBox;
        import mx.binding.BindingManager;
        import mx.managers.PopUpManager;
        import mx.events.ValidationResultEvent;
        import mx.controls.Label;
        import mx.core.IDeferredInstance;
        import mx.core.IPropertyChangeNotifier;
        import flash.events.IEventDispatcher;
        import mx.events.PropertyChangeEvent;
        import mx.formatters.DateFormatter;
        import mx.core.mx_internal;
        import mx.controls.TextInput;
        import mx.events.FlexEvent;
        import mx.formatters.Formatter;
        import mx.events.DropdownEvent;
        import mx.events.ListEvent;
        import flash.events.Event;
        import mx.controls.ComboBox;
        import mx.controls.PopUpButton;

        var tempWatcher:mx.binding.Watcher;

        // writeWatcher id=4 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[4] = new mx.binding.PropertyWatcher("secondEntityLabel",
            {
                propertyChange: true
            }
                                                                 );

        // writeWatcher id=5 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[5] = new mx.binding.PropertyWatcher("relationalLabel",
            {
                propertyChange: true
            }
                                                                 );

        // writeWatcher id=6 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[6] = new mx.binding.PropertyWatcher("timeValueLabel",
            {
                propertyChange: true
            }
                                                                 );

        // writeWatcher id=1 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[1] = new mx.binding.PropertyWatcher("customColumnName",
            {
                propertyChange: true
            }
                                                                 );

        // writeWatcher id=7 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[7] = new mx.binding.PropertyWatcher("timeIntrvalLabel",
            {
                propertyChange: true
            }
                                                                 );

        // writeWatcher id=12 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[12] = new mx.binding.PropertyWatcher("myArray5",
            {
                propertyChange: true
            }
                                                                 );

        // writeWatcher id=3 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[3] = new mx.binding.PropertyWatcher("arithmeticLabel",
            {
                propertyChange: true
            }
                                                                 );

        // writeWatcher id=2 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[2] = new mx.binding.PropertyWatcher("firstEntityLabel",
            {
                propertyChange: true
            }
                                                                 );

        // writeWatcher id=8 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[8] = new mx.binding.PropertyWatcher("myArray1",
            {
                propertyChange: true
            }
                                                                 );

        // writeWatcher id=13 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[13] = new mx.binding.PropertyWatcher("buttonLabel",
            {
                propertyChange: true
            }
                                                                 );

        // writeWatcher id=9 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[9] = new mx.binding.PropertyWatcher("myArray2",
            {
                propertyChange: true
            }
                                                                 );

        // writeWatcher id=10 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[10] = new mx.binding.PropertyWatcher("myArray3",
            {
                propertyChange: true
            }
                                                                 );

        // writeWatcher id=11 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[11] = new mx.binding.PropertyWatcher("myArray4",
            {
                propertyChange: true
            }
                                                                 );


        // writeWatcherBottom id=4 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        // writePropertyWatcherBottom id=4 size=1
        watchers[4].addListener(bindings[3]);
        watchers[4].propertyGetter = propertyGetter;
        watchers[4].updateParent(target);

 





        // writeWatcherBottom id=5 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        // writePropertyWatcherBottom id=5 size=1
        watchers[5].addListener(bindings[4]);
        watchers[5].propertyGetter = propertyGetter;
        watchers[5].updateParent(target);

 





        // writeWatcherBottom id=6 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        // writePropertyWatcherBottom id=6 size=1
        watchers[6].addListener(bindings[5]);
        watchers[6].propertyGetter = propertyGetter;
        watchers[6].updateParent(target);

 





        // writeWatcherBottom id=1 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        // writePropertyWatcherBottom id=1 size=1
        watchers[1].addListener(bindings[0]);
        watchers[1].propertyGetter = propertyGetter;
        watchers[1].updateParent(target);

 





        // writeWatcherBottom id=7 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        // writePropertyWatcherBottom id=7 size=2
        tempWatcher = watchers[7];
        tempWatcher.addListener(bindings[6]);
        tempWatcher.addListener(bindings[13]);
        watchers[7].propertyGetter = propertyGetter;
        watchers[7].updateParent(target);

 





        // writeWatcherBottom id=12 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        // writePropertyWatcherBottom id=12 size=2
        tempWatcher = watchers[12];
        tempWatcher.addListener(bindings[11]);
        tempWatcher.addListener(bindings[12]);
        watchers[12].propertyGetter = propertyGetter;
        watchers[12].updateParent(target);

 





        // writeWatcherBottom id=3 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        // writePropertyWatcherBottom id=3 size=1
        watchers[3].addListener(bindings[2]);
        watchers[3].propertyGetter = propertyGetter;
        watchers[3].updateParent(target);

 





        // writeWatcherBottom id=2 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        // writePropertyWatcherBottom id=2 size=1
        watchers[2].addListener(bindings[1]);
        watchers[2].propertyGetter = propertyGetter;
        watchers[2].updateParent(target);

 





        // writeWatcherBottom id=8 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        // writePropertyWatcherBottom id=8 size=1
        watchers[8].addListener(bindings[7]);
        watchers[8].propertyGetter = propertyGetter;
        watchers[8].updateParent(target);

 





        // writeWatcherBottom id=13 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        // writePropertyWatcherBottom id=13 size=1
        watchers[13].addListener(bindings[14]);
        watchers[13].propertyGetter = propertyGetter;
        watchers[13].updateParent(target);

 





        // writeWatcherBottom id=9 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        // writePropertyWatcherBottom id=9 size=1
        watchers[9].addListener(bindings[8]);
        watchers[9].propertyGetter = propertyGetter;
        watchers[9].updateParent(target);

 





        // writeWatcherBottom id=10 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        // writePropertyWatcherBottom id=10 size=1
        watchers[10].addListener(bindings[9]);
        watchers[10].propertyGetter = propertyGetter;
        watchers[10].updateParent(target);

 





        // writeWatcherBottom id=11 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        // writePropertyWatcherBottom id=11 size=1
        watchers[11].addListener(bindings[10]);
        watchers[11].propertyGetter = propertyGetter;
        watchers[11].updateParent(target);

 






        bindings[0].uiComponentWatcher = 1;
        bindings[0].execute();
        bindings[1].uiComponentWatcher = 2;
        bindings[1].execute();
        bindings[2].uiComponentWatcher = 3;
        bindings[2].execute();
        bindings[3].uiComponentWatcher = 4;
        bindings[3].execute();
        bindings[4].uiComponentWatcher = 5;
        bindings[4].execute();
        bindings[5].uiComponentWatcher = 6;
        bindings[5].execute();
        bindings[6].uiComponentWatcher = 7;
        bindings[6].execute();
        bindings[7].uiComponentWatcher = 8;
        bindings[7].execute();
        bindings[8].uiComponentWatcher = 9;
        bindings[8].execute();
        bindings[9].uiComponentWatcher = 10;
        bindings[9].execute();
        bindings[10].uiComponentWatcher = 11;
        bindings[10].execute();
        bindings[11].uiComponentWatcher = 12;
        bindings[11].execute();
        bindings[12].uiComponentWatcher = 12;
        bindings[12].execute();
        bindings[13].uiComponentWatcher = 7;
        bindings[13].execute();
        bindings[14].uiComponentWatcher = 13;
        bindings[14].execute();
    }
}

}
