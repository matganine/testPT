package com.broceliand.ui.list
{
   import com.broceliand.ui.util.NullSkin;
   import com.broceliand.util.GenericAction;
   
   import mx.collections.ICollectionView;
   import mx.controls.List;
   import mx.controls.listClasses.IListItemRenderer;
   import mx.core.UIComponent;
   import mx.events.FlexEvent;

   public class PTList extends List implements IPTList {

      public static const VERTICAL_SCROLL_LOCATION_RIGHT:String = "right";
      public static const VERTICAL_SCROLL_LOCATION_LEFT:String = "left";

      protected var _dynamicHeight:Boolean;
      protected var _dynamicMaxHeight:Boolean; 
      protected var _itemMinHeight:uint;
      protected var mustResize:Boolean;
      protected var _verticalScrollLocation:String;
      protected var _shadowBottom:ListShadow;
      protected var _shadowTop:ListShadow;
      protected var _verticalScrollBarCreated:Boolean;
      protected var _showOnlyScrollArrows:Boolean;

      public function PTList() {
         super();
         _dynamicHeight = true;
         _itemMinHeight = 0;
         _verticalScrollLocation = VERTICAL_SCROLL_LOCATION_RIGHT;
         variableRowHeight = true;
         selectable = false;
         focusEnabled = false;
         setStyle('borderSkin',null);
         setStyle('focusSkin', NullSkin);
         setStyle('horizontalScrollPolicy',"off");
         refreshScrollBarStyle();
         addEventListener(FlexEvent.UPDATE_COMPLETE, onUpdateComplete);
      }

      override public function set dataProvider(value:Object):void{
         super.dataProvider = value;
         if(_dynamicHeight) {
            refreshHeight();
         }
      }

      public function set showOnlyScrollArrows(value:Boolean):void {
         if(value != _showOnlyScrollArrows) {
            _showOnlyScrollArrows = value;
            refreshScrollBarStyle();
         }
      }

      private function refreshScrollBarStyle():void {
         if(_showOnlyScrollArrows) {
            setStyle('verticalScrollBarStyleName',"scrollBarOnlyArrows");
         }else{
            setStyle('verticalScrollBarStyleName',"scrollBar");
		 }
      }

      public function focusLastItem():void{
         verticalScrollPosition = 0;
      }
      public function focusFirstItem():void{
         verticalScrollPosition = maxVerticalScrollPosition;
      }

      public function purgeList():void {
         purgeItemRenderers();
      }

      public function forceMeasure():void {
         measure();
      }
      override protected function measure():void {

         super.measure();

         if(mustResize) {
            mustResize = false;

            if(_dynamicMaxHeight && _itemMinHeight) {
               var itemsVisible:Number = Math.floor(maxHeight / _itemMinHeight);
               maxHeight = itemsVisible * _itemMinHeight;
            }

            var listHeight:Number = 0;
            if(collection) {
               var length:int = collection.length;
               var minListHeight:int = _itemMinHeight * length;
               if(minListHeight >= maxHeight) {
                  listHeight = maxHeight;
                  measuredMinHeight = minListHeight;
               }else{
                  listHeight = measureHeightOfItems(0, length);
               }
            }
            height = (listHeight > maxHeight)?maxHeight:listHeight;
         }
      }

      public function refreshHeight():void{
         mustResize = true;
         invalidateSize();
      }

      override public function set maxHeight(value:Number):void {
         if(value != super.maxHeight) {
            super.maxHeight = value;
            if(_dynamicHeight || _dynamicMaxHeight) {
               refreshHeight();
            }
         }
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
      }
      private function addListenerToVerticalScrollBar():void{
         refreshShadows();
         verticalScrollBar.addEventListener(FlexEvent.SHOW, onShowScrollBar);
         verticalScrollBar.addEventListener(FlexEvent.HIDE, onHideScrollBar);
      }
      private function onShowScrollBar(event:FlexEvent):void{
         refreshShadows();
      }
      private function onHideScrollBar(event:FlexEvent):void{
         refreshShadows();
      }
      private function refreshShadows():void{
         if(isVerticalScrollBarVisible()) {
            if(_shadowTop) {
               _shadowTop.displayShadow = true;
               _shadowTop.width = width - verticalScrollBar.width;
            }
            if(_shadowBottom) {
               _shadowBottom.displayShadow = true;
               _shadowBottom.width = width - verticalScrollBar.width;
            }
         }else{
            if(_shadowTop) _shadowTop.displayShadow = false;
            if(_shadowBottom) _shadowBottom.displayShadow = false;
         }
      }

      public function isVerticalScrollBarVisible():Boolean {
         return (verticalScrollBar && verticalScrollBar.visible);
      }

      private function forceScrollBarToLeft():void{
         if(verticalScrollBar && verticalScrollBar.visible) {
            verticalScrollBar.x = 2;
         }
      }
      protected function onUpdateComplete(event:FlexEvent):void {
         if(_verticalScrollLocation == VERTICAL_SCROLL_LOCATION_LEFT) {
            forceScrollBarToLeft();
         }
         FixedSizeScrollThumb.replaceScrollThumb(verticalScrollBar);
      }

      public function set dynamicHeight(value:Boolean):void{
         _dynamicHeight = value;
      }
      public function get dynamicHeight():Boolean{
         return _dynamicHeight;
      }

      public function set dynamicMaxHeight(value:Boolean):void{
         _dynamicMaxHeight = value;
      }
      public function get dynamicMaxHeight():Boolean{
         return _dynamicMaxHeight;
      }

      public function set itemMinHeight(value:uint):void{
         _itemMinHeight = value;
      }
      public function get itemMinHeight():uint{
         return _itemMinHeight;
      }

      public function set verticalScrollLocation(value:String):void{
         if(value != VERTICAL_SCROLL_LOCATION_LEFT && value != VERTICAL_SCROLL_LOCATION_RIGHT) {
            return;
         }
         _verticalScrollLocation = value;
      }
      public function get verticalScrollLocation():String{
         return _verticalScrollLocation;
      }

      public function set shadowBottom(value:ListShadow):void{
         _shadowBottom = value;
      }
      public function set shadowTop(value:ListShadow):void{
         _shadowTop = value;
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
      
      public function ensureItemVisible(itemIndex:int,topIndex:int, afterUpdateEvent:Boolean=false):Boolean{
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
      
      override public function scrollToIndex(index:int):Boolean
      {
          var newVPos:int;
          newVPos = Math.max(0,Math.min(index,maxVerticalScrollPosition));;
          verticalScrollPosition = newVPos;
          return true;
      }
   }
}