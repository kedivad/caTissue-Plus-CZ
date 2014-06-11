package 
{

import flash.display.Sprite;
import mx.core.IFlexModuleFactory;
import mx.core.mx_internal;
import mx.styles.CSSStyleDeclaration;
import mx.styles.StyleManager;
import mx.skins.halo.DefaultDragImage;

[ExcludeClass]

public class _DragManagerStyle
{
    [Embed(_resolvedSource='C:/Program Files (x86)/Adobe/Flex Builder 3/sdks/2.0.1/frameworks/libs/framework.swc$Assets.swf', source='C:/Program Files (x86)/Adobe/Flex Builder 3/sdks/2.0.1/frameworks/libs/framework.swc$Assets.swf', symbol='mx.skins.cursor.DragLink', _line='642', _file='C:/Program Files (x86)/Adobe/Flex Builder 3/sdks/2.0.1/frameworks/libs/framework.swc$defaults.css', _pathsep='true')]
    private static var _embed_css_Assets_swf_mx_skins_cursor_DragLink_659039490:Class;
    [Embed(_resolvedSource='C:/Program Files (x86)/Adobe/Flex Builder 3/sdks/2.0.1/frameworks/libs/framework.swc$Assets.swf', source='C:/Program Files (x86)/Adobe/Flex Builder 3/sdks/2.0.1/frameworks/libs/framework.swc$Assets.swf', symbol='mx.skins.cursor.DragReject', _line='644', _file='C:/Program Files (x86)/Adobe/Flex Builder 3/sdks/2.0.1/frameworks/libs/framework.swc$defaults.css', _pathsep='true')]
    private static var _embed_css_Assets_swf_mx_skins_cursor_DragReject_1311952623:Class;
    [Embed(_resolvedSource='C:/Program Files (x86)/Adobe/Flex Builder 3/sdks/2.0.1/frameworks/libs/framework.swc$Assets.swf', source='C:/Program Files (x86)/Adobe/Flex Builder 3/sdks/2.0.1/frameworks/libs/framework.swc$Assets.swf', symbol='mx.skins.cursor.DragCopy', _line='640', _file='C:/Program Files (x86)/Adobe/Flex Builder 3/sdks/2.0.1/frameworks/libs/framework.swc$defaults.css', _pathsep='true')]
    private static var _embed_css_Assets_swf_mx_skins_cursor_DragCopy_659301049:Class;
    [Embed(_resolvedSource='C:/Program Files (x86)/Adobe/Flex Builder 3/sdks/2.0.1/frameworks/libs/framework.swc$Assets.swf', source='C:/Program Files (x86)/Adobe/Flex Builder 3/sdks/2.0.1/frameworks/libs/framework.swc$Assets.swf', symbol='mx.skins.cursor.DragMove', _line='643', _file='C:/Program Files (x86)/Adobe/Flex Builder 3/sdks/2.0.1/frameworks/libs/framework.swc$defaults.css', _pathsep='true')]
    private static var _embed_css_Assets_swf_mx_skins_cursor_DragMove_659079453:Class;

    public static function init(fbs:IFlexModuleFactory):void
    {
        var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration("DragManager");
    
        if (!style)
        {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("DragManager", style, false);
        }
    
        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.copyCursor = _embed_css_Assets_swf_mx_skins_cursor_DragCopy_659301049;
                this.moveCursor = _embed_css_Assets_swf_mx_skins_cursor_DragMove_659079453;
                this.rejectCursor = _embed_css_Assets_swf_mx_skins_cursor_DragReject_1311952623;
                this.linkCursor = _embed_css_Assets_swf_mx_skins_cursor_DragLink_659039490;
                this.defaultDragImageSkin = mx.skins.halo.DefaultDragImage;
            };
        }
    }
}

}
