package com.broceliand.ui.list {
   import flash.events.Event;
   
   import mx.controls.scrollClasses.ScrollBar;
   import mx.controls.scrollClasses.ScrollThumb;
   import mx.core.mx_internal;
   import mx.events.ResizeEvent;
   import mx.styles.StyleProxy;
   
   use namespace mx_internal;
   
   public class FixedSizeScrollThumb extends ScrollThumb {
      private var isActualSizeSet : Boolean = false;
      public static const MIN_SCROLL_THUMB_HEIGHT_FOR_NOTES:Number = 30;
      public static const MIN_SCROLL_THUMB_HEIGHT_FOR_NOVELTIES:Number = 30;
      
      public function FixedSizeScrollThumb() {
         super(); 
         buttonMode = true;
         focusEnabled = false;
      }
      
      public static function replaceScrollThumb(scrollBar : ScrollBar) : ScrollThumb {
         
         if (scrollBar != null && scrollBar.scrollThumb != null) {          	
            if (!(scrollBar.scrollThumb is FixedSizeScrollThumb)) {
               
               scrollBar.removeChild(scrollBar.scrollThumb);
               
               var fixedSizeScrollThumb : FixedSizeScrollThumb = new FixedSizeScrollThumb();
               fixedSizeScrollThumb.x = scrollBar.scrollThumb.x;
               fixedSizeScrollThumb.y = scrollBar.scrollThumb.y;
               
               fixedSizeScrollThumb.styleName = new StyleProxy(scrollBar, null);
               fixedSizeScrollThumb.upSkinName = "thumbUpSkin";
               fixedSizeScrollThumb.overSkinName = "thumbOverSkin";
               fixedSizeScrollThumb.downSkinName = "thumbDownSkin";
               fixedSizeScrollThumb.iconName = "thumbIcon";
               fixedSizeScrollThumb.skinName = "thumbSkin";
               
               scrollBar.scrollThumb = fixedSizeScrollThumb;
               scrollBar.addChildAt(fixedSizeScrollThumb, scrollBar.getChildIndex(scrollBar.downArrow));
               
               return fixedSizeScrollThumb;
            }
            else {                 
               return scrollBar.scrollThumb;
            }
         }
         else {
            return null;
         }
      }
      
      public override function setActualSize(w : Number, h : Number): void {      	
         var oldWidth : Number = width;
         var oldHeight : Number = height;
         var thumbWidth : Number = w;
         var thumbHeight : Number = h;
         
         if (h < MIN_SCROLL_THUMB_HEIGHT_FOR_NOTES)
            thumbHeight = MIN_SCROLL_THUMB_HEIGHT_FOR_NOTES;
         
         if (thumbHeight != height)    
            isActualSizeSet = false;
         
         if (!isActualSizeSet && !isNaN(thumbWidth) && !isNaN(thumbHeight)) {
            isActualSizeSet = true;
            
            _width = thumbWidth;
            _height = thumbHeight;
            
            dispatchEvent(new Event("widthChanged"));
            dispatchEvent(new Event("heightChanged"));
            
            invalidateDisplayList();
            var resizeEvent : ResizeEvent = new ResizeEvent(ResizeEvent.RESIZE);
            resizeEvent.oldWidth = 0;
            resizeEvent.oldHeight = oldHeight;
            dispatchEvent(resizeEvent);
         } 
      }
      
   }
}