package com.broceliand.ui.list
{
   import com.broceliand.ui.PTStyleManager;
   import com.broceliand.ui.util.ColorPalette;
   
   import flash.display.GradientType;
   import flash.display.InterpolationMethod;
   import flash.display.SpreadMethod;
   import flash.geom.Matrix;
   
   import mx.containers.Box;
   import mx.styles.CSSStyleDeclaration;
   
   
   [Style(name="shadowDirection", type="String", inherit="no")]
   
   public class ListShadow extends Box
   {
      private var _displayShadow:Boolean;
      private var displayShadowChanged:Boolean;
      
      public function ListShadow() {
         height = 10;
         percentWidth = 100;
      }
      
      public function set displayShadow(value:Boolean):void{
         if(_displayShadow != value) {
            _displayShadow = value;
            displayShadowChanged = true;
            invalidateDisplayList();
         }
      }
      public function get displayShadow():Boolean{
         return _displayShadow;
      }      
      public function refreshShadow():void{
         displayShadowChanged = true;
         invalidateDisplayList();         
      }
      
      
      override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
         super.updateDisplayList(unscaledWidth, unscaledHeight);
         if(displayShadowChanged) {
            displayShadowChanged = false;
            
            graphics.clear();
            
            if(_displayShadow) {
               var shadowWidth:uint = width;
               var shadowHeight:uint = height;
               
               var type:String = GradientType.LINEAR;
               var alphas:Array = null;
               if(getStyle('shadowDirection')=="top") {
                  alphas = [1, 0];
               }else{
                  alphas = [0, 1];
               }
               var spreadMethod:String = SpreadMethod.PAD;
               var interp:String = InterpolationMethod.LINEAR_RGB;         
               var colors:Array = [ColorPalette.getInstance().backgroundColor, ColorPalette.getInstance().backgroundColor];
               var ratios:Array = [0, 255];
               
               var matrix:Matrix = new Matrix();       
               var boxWidth:Number = width;
               var boxHeight:Number = height;
               var boxRotation:Number = Math.PI/2;
               var tx:Number = 0;
               var ty:Number = 0;
               matrix.createGradientBox(boxWidth, boxHeight, boxRotation, tx, ty);
               
               graphics.beginGradientFill(type, colors, alphas, ratios, matrix, spreadMethod, interp);
               graphics.drawRect(0,0, shadowWidth,shadowHeight);
               graphics.endFill();
            }
         }
      }       
      
      
      private static var defaultStyleConstructed:Boolean = constructDefaultStyle(); 
      public static function constructDefaultStyle(applyNow:Boolean=true):Boolean {
         var styleManager:PTStyleManager = PTStyleManager.getInstance();
         if (!styleManager.hasStyleDeclaration("ListShadow")) {
            
            
            var defaultStyles:CSSStyleDeclaration = new CSSStyleDeclaration();
            defaultStyles.defaultFactory = function():void {
               this.shadowDirection = 'top';
            }
            styleManager.addStyleDeclaration("ListShadow", defaultStyles, applyNow);
         }
         return true;
      }
   }
}