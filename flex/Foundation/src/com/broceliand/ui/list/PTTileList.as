package com.broceliand.ui.list {

import com.broceliand.ApplicationManager;
import com.broceliand.ui.util.NullSkin;

import mx.collections.ICollectionView;
import mx.controls.TileList;
import mx.controls.listClasses.IListItemRenderer;
import mx.core.UIComponent;
import mx.events.FlexEvent;


public class PTTileList extends TileList {
   
   public function PTTileList() {
      super();
      setStyle('borderSkin',null);
      setStyle('horizontalScrollPolicy',"off");
      focusEnabled = false;
      selectable = false;
      refreshScrollBarStyle();
      addEventListener(FlexEvent.UPDATE_COMPLETE, onUpdateComplete);
   }
   
   private function onUpdateComplete(event:FlexEvent):void {
      FixedSizeScrollThumb.replaceScrollThumb(verticalScrollBar);
   }
   
   private function refreshScrollBarStyle():void {
      setStyle('verticalScrollBarStyleName',"scrollBar");
   }
   
   public function invalidateVisibleItems():void {
      var topIndex:int = verticalScrollPosition;
      var numItemsInWindow:int = ICollectionView(dataProvider).length - maxVerticalScrollPosition;
      for (var i:int = 0; i<=numItemsInWindow; i++) {
         var renderer:IListItemRenderer = indexToItemRenderer(topIndex + i);
         if (renderer as UIComponent) {
            UIComponent(renderer).invalidateProperties();
         }
      }
   }
}
}