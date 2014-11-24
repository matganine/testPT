package com.broceliand.ui.list {
import com.broceliand.ui.customization.avatar.AvatarManager;

import flash.display.Graphics;

import mx.core.UIComponent;


public class PTTileListAutoResize extends PTTileList {
   
   private static const SCROLLBAR_WIDTH:int = 26;
   
   private var _rowHeight:int = 80;
   private var _columnWidth:int = 80;
   private var _nbColumns:int = 1;
   private var _nbRows:int = 1;
   private var _sizesChanged:Boolean = false;
   private var _useDynamicSizes:Boolean = false;
   private var _background:UIComponent;
   
   private var _verticalMargin:int = 0;
   private var _horizontalMargin:int = 0;
   private var _dontDrawRowIndex:int = -1;
   
   public function PTTileListAutoResize() {
      super();
   }
   
   /*public function onCreationComplete():void {
      resetSizes();
   }*/
   /*override protected createChildren():void {
      super.createChildren();
      resetSizes();
   }*/
   
   override protected function commitProperties():void{
      super.commitProperties();
      if (sizesChanged) {
         sizesChanged = false;
         resetSizes();
      }
   }
   
   override protected function createChildren():void {
      _background = new UIComponent();
      addChild(_background);
      super.createChildren();
      resetSizes();
   }

   override protected function updateDisplayList(w:Number, h:Number):void {
      super.updateDisplayList(w, h);
      
      if(_background) {
         var cornerRadian:Number = 16;
         var g:Graphics = _background.graphics;
         g.clear();
         
         
         
         
         
         var deltaX:int = 0;
         var deltaY:int = 2;
         var x:int;
         var y:int;
         
         if (shouldOverrideColumnsAndRowsCount()) {
            _nbRows = maxNbRows(this.height);
            _nbColumns = maxNbColumns(this.width);
            
         }
         
         for (var i:int = 0 ; i < _nbColumns ; i++) {
            for (var j:int = 0 ; j < _nbRows ; j++) {
               if (j != dontDrawRowIndex) {
                  g.beginFill(0xededed);
               } else {
                  g.beginFill(0xffffff);
               }
               x = i * (fixColumnWidth + horizontalMargin) + deltaX;
               y = j * (fixRowHeight + verticalMargin) + deltaY;
               g.drawRoundRect(x, y, fixRowHeight, fixColumnWidth, cornerRadian, cornerRadian);
            }
         }
         g.endFill();
      }
   }
   
   public function set nbColumns(value:int):void {
      if (_nbColumns != value) {
         _nbColumns = value;
         _sizesChanged = true;
         invalidateProperties();
      }
   }
   
   public function get nbColumns():int {
      return _nbColumns;
   }
   
   public function set nbRows(value:int):void {
      if (_nbRows != value) {
         _nbRows = value;
         _sizesChanged = true;
         invalidateProperties();
      }
   }
   
   private function maxNbRows(h:int):int {
      return (h - verticalMargin / 2) / (fixRowHeight + verticalMargin);
   }
   
   public function maxNbColumns(w:int):int {
      return (w - horizontalMargin / 2) / (fixColumnWidth + horizontalMargin);
   }
   
   private function shouldOverrideColumnsAndRowsCount():Boolean {
      return _useDynamicSizes;
   }
   
   public function set useDynamicSizes (b:Boolean):void {
      _useDynamicSizes = b;
   }

   public function get fixRowHeight():int {
      return _rowHeight;
   }

   public function set fixRowHeight(value:int):void {
      if (_rowHeight != value) {
         _rowHeight = value;
         _sizesChanged = true;
         invalidateProperties();
      }
   }

   public function get fixColumnWidth():int {
      return _columnWidth;
   }

   public function set fixColumnWidth(value:int):void {
      if (_columnWidth != value) {
         _columnWidth = value;
         _sizesChanged = true;
         invalidateProperties();
      }
   }
   
   private function resetSizes():void {
      width = _nbColumns * (fixColumnWidth + horizontalMargin) + SCROLLBAR_WIDTH - horizontalMargin;
      height = _nbRows * (fixRowHeight + verticalMargin) - verticalMargin;
      rowHeight = fixRowHeight + verticalMargin;
      columnWidth = fixColumnWidth + horizontalMargin;
      
      
   }

   public function get sizesChanged():Boolean {
      return _sizesChanged;
   }

   public function set sizesChanged(value:Boolean):void {
      _sizesChanged = value;
   }

   public function get verticalMargin():int {
      return _verticalMargin;
   }

   public function set verticalMargin(value:int):void {
      if (_verticalMargin != value) {
         _verticalMargin = value;
         _sizesChanged = true;
         invalidateProperties();
      }
   }

   public function get horizontalMargin():int {
      return _horizontalMargin;
   }

   public function set horizontalMargin(value:int):void {
      if (_horizontalMargin != value) {
         _horizontalMargin = value;
         _sizesChanged = true;
         invalidateProperties();
      }
   }

   public function get dontDrawRowIndex():int {
      return _dontDrawRowIndex;
   }

   public function set dontDrawRowIndex(value:int):void {
      if (_dontDrawRowIndex != value) {
         _dontDrawRowIndex = value;
         
         invalidateDisplayList();
      }
   }
}
}