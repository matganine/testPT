package com.broceliand.ui.list {
   
   import com.broceliand.ApplicationManager;
   import com.broceliand.ui.util.NullSkin;
   
   import mx.collections.ICollectionView;
   import mx.controls.HorizontalList;
   import mx.controls.listClasses.IListItemRenderer;
   import mx.core.UIComponent;
   import mx.events.FlexEvent;
   
   
   public class PTHorizontalList extends HorizontalList {
      
      public function PTHorizontalList() {
         super();
         setStyle('borderSkin',null);
         focusEnabled = false;
         selectable = false;
         refreshScrollBarStyle();
         addEventListener(FlexEvent.UPDATE_COMPLETE, onUpdateComplete);
      }
      
      private function onUpdateComplete(event:FlexEvent):void {
         FixedSizeScrollThumb.replaceScrollThumb(horizontalScrollBar);
      }
      
      private function refreshScrollBarStyle():void {
         setStyle('horizontalScrollBarStyleName',"scrollBarH");
      }   
   }
}