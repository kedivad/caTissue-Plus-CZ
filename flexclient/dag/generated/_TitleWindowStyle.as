package 
{

import flash.display.Sprite;
import mx.core.IFlexModuleFactory;
import mx.core.mx_internal;
import mx.styles.CSSStyleDeclaration;
import mx.styles.StyleManager;

[ExcludeClass]

public class _TitleWindowStyle
{
    [Embed(_resolvedSource='C:/Program Files (x86)/Adobe/Flex Builder 3/sdks/2.0.1/frameworks/libs/framework.swc$Assets.swf', source='C:/Program Files (x86)/Adobe/Flex Builder 3/sdks/2.0.1/frameworks/libs/framework.swc$Assets.swf', symbol='CloseButtonDisabled', _line='1408', _file='C:/Program Files (x86)/Adobe/Flex Builder 3/sdks/2.0.1/frameworks/libs/framework.swc$defaults.css', _pathsep='true')]
    private static var _embed_css_Assets_swf_CloseButtonDisabled_1602829017:Class;
    [Embed(_resolvedSource='C:/Program Files (x86)/Adobe/Flex Builder 3/sdks/2.0.1/frameworks/libs/framework.swc$Assets.swf', source='C:/Program Files (x86)/Adobe/Flex Builder 3/sdks/2.0.1/frameworks/libs/framework.swc$Assets.swf', symbol='CloseButtonOver', _line='1410', _file='C:/Program Files (x86)/Adobe/Flex Builder 3/sdks/2.0.1/frameworks/libs/framework.swc$defaults.css', _pathsep='true')]
    private static var _embed_css_Assets_swf_CloseButtonOver_923319567:Class;
    [Embed(_resolvedSource='C:/Program Files (x86)/Adobe/Flex Builder 3/sdks/2.0.1/frameworks/libs/framework.swc$Assets.swf', source='C:/Program Files (x86)/Adobe/Flex Builder 3/sdks/2.0.1/frameworks/libs/framework.swc$Assets.swf', symbol='CloseButtonDown', _line='1409', _file='C:/Program Files (x86)/Adobe/Flex Builder 3/sdks/2.0.1/frameworks/libs/framework.swc$defaults.css', _pathsep='true')]
    private static var _embed_css_Assets_swf_CloseButtonDown_231842877:Class;
    [Embed(_resolvedSource='C:/Program Files (x86)/Adobe/Flex Builder 3/sdks/2.0.1/frameworks/libs/framework.swc$Assets.swf', source='C:/Program Files (x86)/Adobe/Flex Builder 3/sdks/2.0.1/frameworks/libs/framework.swc$Assets.swf', symbol='CloseButtonUp', _line='1411', _file='C:/Program Files (x86)/Adobe/Flex Builder 3/sdks/2.0.1/frameworks/libs/framework.swc$defaults.css', _pathsep='true')]
    private static var _embed_css_Assets_swf_CloseButtonUp_149565048:Class;

    public static function init(fbs:IFlexModuleFactory):void
    {
        var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration("TitleWindow");
    
        if (!style)
        {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("TitleWindow", style, false);
        }
    
        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.closeButtonDisabledSkin = _embed_css_Assets_swf_CloseButtonDisabled_1602829017;
                this.paddingTop = 4;
                this.dropShadowEnabled = true;
                this.backgroundColor = 0xffffff;
                this.closeButtonOverSkin = _embed_css_Assets_swf_CloseButtonOver_923319567;
                this.closeButtonUpSkin = _embed_css_Assets_swf_CloseButtonUp_149565048;
                this.closeButtonDownSkin = _embed_css_Assets_swf_CloseButtonDown_231842877;
                this.cornerRadius = 8;
                this.paddingLeft = 4;
                this.paddingBottom = 4;
                this.paddingRight = 4;
            };
        }
    }
}

}
