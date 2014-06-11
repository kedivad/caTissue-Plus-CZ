package 
{

import flash.display.Sprite;
import mx.core.IFlexModuleFactory;
import mx.core.mx_internal;
import mx.styles.CSSStyleDeclaration;
import mx.styles.StyleManager;
import mx.skins.halo.ComboBoxArrowSkin;

[ExcludeClass]

public class _ComboBoxStyle
{

    public static function init(fbs:IFlexModuleFactory):void
    {
        var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration("ComboBox");
    
        if (!style)
        {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("ComboBox", style, false);
        }
    
        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.downSkin = mx.skins.halo.ComboBoxArrowSkin;
                this.overSkin = mx.skins.halo.ComboBoxArrowSkin;
                this.editableDownSkin = mx.skins.halo.ComboBoxArrowSkin;
                this.cornerRadius = 5;
                this.editableDisabledSkin = mx.skins.halo.ComboBoxArrowSkin;
                this.paddingLeft = 5;
                this.paddingRight = 5;
                this.upSkin = mx.skins.halo.ComboBoxArrowSkin;
                this.fontWeight = "bold";
                this.editableUpSkin = mx.skins.halo.ComboBoxArrowSkin;
                this.leading = 0;
                this.editableOverSkin = mx.skins.halo.ComboBoxArrowSkin;
                this.arrowButtonWidth = 22;
                this.dropDownStyleName = "comboDropDown";
                this.disabledSkin = mx.skins.halo.ComboBoxArrowSkin;
            };
        }
    }
}

}
