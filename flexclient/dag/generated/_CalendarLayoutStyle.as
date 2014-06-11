package 
{

import flash.display.Sprite;
import mx.core.IFlexModuleFactory;
import mx.core.mx_internal;
import mx.styles.CSSStyleDeclaration;
import mx.styles.StyleManager;

[ExcludeClass]

public class _CalendarLayoutStyle
{

    public static function init(fbs:IFlexModuleFactory):void
    {
        var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration("CalendarLayout");
    
        if (!style)
        {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("CalendarLayout", style, false);
        }
    
        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.paddingTop = 6;
                this.todayColor = 0x818181;
                this.color = 0x2b333c;
                this.cellHeightPadding = 6;
                this.textAlign = "center";
                this.verticalGap = 6;
                this.horizontalGap = 7;
                this.cellWidthPadding = 6;
                this.paddingLeft = 6;
                this.paddingBottom = 10;
                this.paddingRight = 6;
            };
        }
    }
}

}
