package 
{

import flash.display.Sprite;
import mx.core.IFlexModuleFactory;
import mx.core.mx_internal;
import mx.styles.CSSStyleDeclaration;
import mx.styles.StyleManager;
import mx.skins.halo.CheckBoxIcon;

[ExcludeClass]

public class _CheckBoxStyle
{

    public static function init(fbs:IFlexModuleFactory):void
    {
        var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration("CheckBox");
    
        if (!style)
        {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("CheckBox", style, false);
        }
    
        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.downSkin = null;
                this.overSkin = null;
                this.disabledIcon = mx.skins.halo.CheckBoxIcon;
                this.selectedDisabledSkin = null;
                this.upIcon = mx.skins.halo.CheckBoxIcon;
                this.selectedDownIcon = mx.skins.halo.CheckBoxIcon;
                this.selectedUpSkin = null;
                this.overIcon = mx.skins.halo.CheckBoxIcon;
                this.upSkin = null;
                this.fontWeight = "normal";
                this.selectedDownSkin = null;
                this.selectedUpIcon = mx.skins.halo.CheckBoxIcon;
                this.selectedOverIcon = mx.skins.halo.CheckBoxIcon;
                this.selectedDisabledIcon = mx.skins.halo.CheckBoxIcon;
                this.textAlign = "left";
                this.disabledSkin = null;
                this.downIcon = mx.skins.halo.CheckBoxIcon;
                this.selectedOverSkin = null;
            };
        }
    }
}

}
