package 
{

import flash.display.Sprite;
import mx.core.IFlexModuleFactory;
import mx.core.mx_internal;
import mx.styles.CSSStyleDeclaration;
import mx.styles.StyleManager;
import mx.skins.halo.DataGridColumnDropIndicator;
import mx.skins.halo.DataGridSortArrow;
import mx.skins.halo.DataGridColumnResizeSkin;
import mx.skins.halo.DataGridHeaderSeparator;

[ExcludeClass]

public class _DataGridStyle
{
    [Embed(_resolvedSource='C:/Program Files (x86)/Adobe/Flex Builder 3/sdks/2.0.1/frameworks/libs/framework.swc$Assets.swf', source='C:/Program Files (x86)/Adobe/Flex Builder 3/sdks/2.0.1/frameworks/libs/framework.swc$Assets.swf', symbol='cursorStretch', _line='522', _file='C:/Program Files (x86)/Adobe/Flex Builder 3/sdks/2.0.1/frameworks/libs/framework.swc$defaults.css', _pathsep='true')]
    private static var _embed_css_Assets_swf_cursorStretch_1083426850:Class;

    public static function init(fbs:IFlexModuleFactory):void
    {
        var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration("DataGrid");
    
        if (!style)
        {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("DataGrid", style, false);
        }
    
        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.sortArrowSkin = mx.skins.halo.DataGridSortArrow;
                this.columnDropIndicatorSkin = mx.skins.halo.DataGridColumnDropIndicator;
                this.columnResizeSkin = mx.skins.halo.DataGridColumnResizeSkin;
                this.stretchCursor = _embed_css_Assets_swf_cursorStretch_1083426850;
                this.alternatingItemColors = [0xf7f7f7, 0xffffff];
                this.headerStyleName = "dataGridStyles";
                this.headerSeparatorSkin = mx.skins.halo.DataGridHeaderSeparator;
                this.headerColors = [0xffffff, 0xe6e6e6];
                this.headerDragProxyStyleName = "headerDragProxyStyle";
                this.verticalGridLineColor = 0xcccccc;
            };
        }
    }
}

}
