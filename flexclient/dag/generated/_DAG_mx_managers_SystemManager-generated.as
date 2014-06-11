package {
import mx.managers.SystemManager;
import flash.utils.*;
import flash.system.ApplicationDomain;
import mx.core.IFlexModuleFactory;
import mx.core.IFlexModule;
public class _DAG_mx_managers_SystemManager extends mx.managers.SystemManager implements IFlexModuleFactory {
  public function _DAG_mx_managers_SystemManager() {
      super();
}
override public function create(... params):Object
{
  if ((params.length == 0) || (params[0] is String))
  {
    var mainClassName:String = null;
    if (params.length == 0) mainClassName = 'DAG';
    else mainClassName = String(params[0]);
    var clazz:Class = Class(getDefinitionByName(mainClassName));
    if (clazz != null)
    {
      var inst:Object = new clazz();
      if (inst is IFlexModule)
      {
         (IFlexModule(inst)).moduleFactory = this;
      }
      return inst;
    }
    else return null;
  }
  else return super.create.apply(this, params);
}
  override public function info():Object { return {
"currentDomain": ApplicationDomain.currentDomain,
"creationComplete" : "initApp()",
"dragDrop" : "onDragDrop(event)",
"dragEnter" : "doDragEnter(event)",
"dragExit" : "onDragExit(event)",
"layout" : "vertical",
"mainClassName" : "DAG",
"mixins" : ["_DAG_FlexInit", "_richTextEditorTextAreaStyleStyle", "_alertButtonStyleStyle", "_ControlBarStyle", "_textAreaVScrollBarStyleStyle", "_headerDateTextStyle", "_DateChooserStyle", "_TitleWindowStyle", "_globalStyle", "_comboDropDownStyle", "_ListBaseStyle", "_todayStyleStyle", "_AlertStyle", "_windowStylesStyle", "_ApplicationStyle", "_ToolTipStyle", "_CursorManagerStyle", "_opaquePanelStyle", "_TextInputStyle", "_errorTipStyle", "_ApplicationControlBarStyle", "_dateFieldPopupStyle", "_MenuStyle", "_ComboBoxStyle", "_dataGridStylesStyle", "_DataGridStyle", "_headerDragProxyStyleStyle", "_activeTabStyleStyle", "_PanelStyle", "_DragManagerStyle", "_ContainerStyle", "_windowStatusStyle", "_ScrollBarStyle", "_textAreaHScrollBarStyleStyle", "_plainStyle", "_activeButtonStyleStyle", "_MenuBarStyle", "_CheckBoxStyle", "_DateFieldStyle", "_ButtonStyle", "_CalendarLayoutStyle", "_DataGridItemRendererStyle", "_weekDayStyleStyle", "_Components_PopupWindowWatcherSetupUtil", "_Components_CustomFormulaNodeWatcherSetupUtil", "_Components_SingleNodeCustomFormulaNodeWatcherSetupUtil", "_Components_singleNodeTQWidowWatcherSetupUtil", "_Components_AmbiguityPanelWatcherSetupUtil", "_Components_DAGNodeWatcherSetupUtil"]
,
"paddingBottom" : "0",
"paddingLeft" : "0",
"paddingRight" : "0",
"paddingTop" : "0"}; }
}}
