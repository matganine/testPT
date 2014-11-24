package com.broceliand.ui.list
{
   import com.broceliand.util.GenericAction;
   
   import mx.collections.ICollectionView;
   import mx.containers.VBox;
   import mx.core.Repeater;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   
   public class PTRepeater extends VBox implements IPTList
   {
      private static const MIN_HEIGHT_TO_SHOW_SCROLL_THUMB:Number = 80;
      
      protected var _shadowBottom:ListShadow;
      protected var _shadowTop:ListShadow;      
      protected var _verticalScrollBarCreated:Boolean;
            
      public function PTRepeater() {
         super();
         setStyle('borderSkin',null);
         setStyle('horizontalScrollPolicy',"off");
         setStyle('verticalGap',0);         
      }
      
      protected function get innerRepeater():Repeater {
         return null;
      }
      
      override public function set percentWidth(value:Number):void {
         super.percentWidth = value;
         if(innerRepeater) {
            innerRepeater.percentWidth = value;
         }
      }

      public function set dataProvider(value:Object):void {
         if(innerRepeater) {
            innerRepeater.dataProvider = value;
         }
      }
      
      public function get dataProvider():Object {
         if(innerRepeater) {
            return innerRepeater.dataProvider;
         }
         return null;
      }

      public function focusLastItem():void {
         verticalScrollPosition = 0;
      }
      public function focusFirstItem():void {
         verticalScrollPosition = maxVerticalScrollPosition;
      }
      
      public function purgeList():void {
         innerRepeater.mx_internal::createdComponents = new Array();
      }
      
      override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void{
         super.updateDisplayList(unscaledWidth, unscaledHeight);
         if(verticalScrollBar && !_verticalScrollBarCreated) {
            addListenerToVerticalScrollBar();
            _verticalScrollBarCreated = true;
         }
         else if(!verticalScrollBar && _verticalScrollBarCreated) {
            refreshShadows();
            _verticalScrollBarCreated = false;
         }
         if(verticalScrollBar && _verticalScrollBarCreated) {
            if(unscaledHeight < MIN_HEIGHT_TO_SHOW_SCROLL_THUMB) {
               setStyle('verticalScrollBarStyleName',"scrollBarOnlyArrows");
            }else{
               setStyle('verticalScrollBarStyleName',"scrollBar");  
			}
         }
      }      
      private function addListenerToVerticalScrollBar():void{
         refreshShadows();
         verticalScrollBar.addEventListener(FlexEvent.SHOW, onShowScrollBar);
         verticalScrollBar.addEventListener(FlexEvent.HIDE, onHideScrollBar);
      }
      protected function onShowScrollBar(event:FlexEvent):void{
         refreshShadows();
      }
      private function onHideScrollBar(event:FlexEvent):void{
         refreshShadows();
      }
      private function refreshShadows():void{
         if(isVerticalScrollBarVisible()) {
            if(_shadowTop) {
               _shadowTop.displayShadow = true;
               _shadowTop.width = width - verticalScrollBar.measuredWidth;
            }
            if(_shadowBottom) {
               _shadowBottom.displayShadow = true;
               _shadowBottom.width = width - verticalScrollBar.measuredWidth;
            }
         }else {
            if(_shadowTop) _shadowTop.displayShadow = false;
            if(_shadowBottom) _shadowBottom.displayShadow = false;
         }
      }
            
      public function isVerticalScrollBarVisible():Boolean {
         return (verticalScrollBar && verticalScrollBar.visible);
      }
      
      public function set shadowBottom(value:ListShadow):void{
         _shadowBottom = value;
      }
      public function set shadowTop(value:ListShadow):void{
         _shadowTop = value;
      }
      
      
      public function ensureItemVisible(itemIndex:int,topIndex:int, afterUpdateEvent:Boolean=false):Boolean{
         if (!dataProvider) {
            return false;
         }
         var targetScrollPosition:int = -1;
         var numItemsInWindow:int = ICollectionView(dataProvider).length - maxVerticalScrollPosition;
         var middleIndex:int = numItemsInWindow/2;
         if (itemIndex < topIndex) {
            targetScrollPosition = Math.max(0, itemIndex - middleIndex);
         } else if (itemIndex >= topIndex + numItemsInWindow) {
            targetScrollPosition = itemIndex - middleIndex+1  ;
         }else{
            targetScrollPosition = Math.min(topIndex,maxVerticalScrollPosition);
         }
         if (targetScrollPosition >=0) {
            if (afterUpdateEvent) {
               var action:GenericAction = new GenericAction(null, this, scrollToIndex, targetScrollPosition);
               addEventListener(FlexEvent.UPDATE_COMPLETE, action.performActionOnFirstEvent);
            } else {
               if (!scrollToIndex(targetScrollPosition)) {
                  scrollToIndex(0);
                  scrollToIndex(targetScrollPosition);
               }
            }
            return true;
         }
         return false;
      }
      
      private function scrollToIndex(index:int):Boolean {
         var newVPos:int;
         newVPos = Math.max(0,Math.min(index,maxVerticalScrollPosition));
         verticalScrollPosition = newVPos;
         return true;
      }
      
   }
}