package 
{

import flash.display.Sprite;
import mx.core.IFlexModuleFactory;
import mx.core.mx_internal;
import mx.styles.CSSStyleDeclaration;
import mx.styles.StyleManager;
import mx.skins.halo.DateChooserYearArrowSkin;
import mx.skins.halo.DateChooserMonthArrowSkin;
import mx.skins.halo.DateChooserIndicator;

[ExcludeClass]

public class _DateChooserStyle
{

    public static function init(fbs:IFlexModuleFactory):void
    {
        var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration("DateChooser");
    
        if (!style)
        {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("DateChooser", style, false);
        }
    
        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.prevMonthDisabledSkin = mx.skins.halo.DateChooserMonthArrowSkin;
                this.prevYearUpSkin = mx.skins.halo.DateChooserYearArrowSkin;
                this.backgroundColor = 0xffffff;
                this.nextYearOverSkin = mx.skins.halo.DateChooserYearArrowSkin;
                this.todayStyleName = "todayStyle";
                this.nextMonthDownSkin = mx.skins.halo.DateChooserMonthArrowSkin;
                this.cornerRadius = 4;
                this.nextMonthDisabledSkin = mx.skins.halo.DateChooserMonthArrowSkin;
                this.nextYearUpSkin = mx.skins.halo.DateChooserYearArrowSkin;
                this.nextMonthUpSkin = mx.skins.halo.DateChooserMonthArrowSkin;
                this.selectionIndicatorSkin = mx.skins.halo.DateChooserIndicator;
                this.headerColors = [0xe1e5eb, 0xf4f5f7];
                this.prevMonthOverSkin = mx.skins.halo.DateChooserMonthArrowSkin;
                this.nextYearDisabledSkin = mx.skins.halo.DateChooserYearArrowSkin;
                this.headerStyleName = "headerDateText";
                this.prevYearOverSkin = mx.skins.halo.DateChooserYearArrowSkin;
                this.rollOverIndicatorSkin = mx.skins.halo.DateChooserIndicator;
                this.prevMonthDownSkin = mx.skins.halo.DateChooserMonthArrowSkin;
                this.nextYearDownSkin = mx.skins.halo.DateChooserYearArrowSkin;
                this.prevMonthUpSkin = mx.skins.halo.DateChooserMonthArrowSkin;
                this.prevYearDownSkin = mx.skins.halo.DateChooserYearArrowSkin;
                this.nextMonthOverSkin = mx.skins.halo.DateChooserMonthArrowSkin;
                this.weekDayStyleName = "weekDayStyle";
                this.prevYearDisabledSkin = mx.skins.halo.DateChooserYearArrowSkin;
                this.todayIndicatorSkin = mx.skins.halo.DateChooserIndicator;
            };
        }
    }
}

}
