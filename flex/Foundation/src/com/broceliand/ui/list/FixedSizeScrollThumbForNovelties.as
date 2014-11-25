package com.broceliand.ui.list {
   import com.broceliand.assets.PearlDeckAssets;
   
   import flash.events.Event;
   
   import mx.controls.scrollClasses.ScrollBar;
   import mx.controls.scrollClasses.ScrollThumb;
   import mx.core.mx_internal;
   import mx.events.ResizeEvent;
   import mx.styles.StyleProxy;
   
   use namespace mx_internal;
   
   public class FixedSizeScrollThumbForNovelties extends ScrollThumb {
      private var isActualSizeSet : Boolean = false;
      public static const MIN_SCROLL_THUMB_HEIGHT_FOR_NOVELTIES:Number = 100;
      
      public function FixedSizeScrollThumbForNovelties() {
         super(); 
         buttonMode = true;
         focusEnabled = false;
      }
      
      public static function replaceScrollThumb(scrollBar : ScrollBar) : ScrollThumb {
         
         if (scrollBar != null) {          	
            if (!(scrollBar.scrollThumb is FixedSizeScrollThumbForNovelties)) {
               
               scrollBar.removeChild(scrollBar.scrollThumb);
               
               var fixedSizeScrollThumbForNovelties : FixedSizeScrollThumbForNovelties = new FixedSizeScrollThumbForNovelties();
               fixedSizeScrollThumbForNovelties.x = scrollBar.scrollThumb.x;
               fixedSizeScrollThumbForNovelties.y = scrollBar.scrollThumb.y;
               
               fixedSizeScrollThumbForNovelties.styleName = new StyleProxy(scrollBar, null);
               fixedSizeScrollThumbForNovelties.upSkinName = "thumbUpSkin";
               fixedSizeScrollThumbForNovelties.overSkinName = "thumbOverSkin";
               fixedSizeScrollThumbForNovelties.downSkinName = "thumbDownSkin";
               fixedSizeScrollThumbForNovelties.iconName = "thumbIcon";
               fixedSizeScrollThumbForNovelties.skinName = "thumbSkin";
               
               
               
               
               
               
               
               
               scrollBar.scrollTrack.skinName = "trackSkin";
               scrollBar.scrollTrack.upSkinName = "trackSkin";
               scrollBar.scrollTrack.overSkinName = "trackSkin";
               scrollBar.scrollTrack.downSkinName = "trackSkin";
               scrollBar.scrollTrack.disabledSkinName = "trackSkin";
               
               scrollBar.scrollThumb = fixedSizeScrollThumbForNovelties;
               scrollBar.scrollTrack.width = 16;
               scrollBar.addChildAt(fixedSizeScrollThumbForNovelties, scrollBar.getChildIndex(scrollBar.downArrow));
               
               return fixedSizeScrollThumbForNovelties;
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
         var thumbWidth : Number = 16;
         var thumbHeight : Number = h;
         
         if (h < MIN_SCROLL_THUMB_HEIGHT_FOR_NOVELTIES)
            thumbHeight = MIN_SCROLL_THUMB_HEIGHT_FOR_NOVELTIES;
         
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
            resizeEvent.oldWidth = oldWidth;
            resizeEvent.oldHeight = oldHeight;
            dispatchEvent(resizeEvent);
         } 
      }
      
   }
}