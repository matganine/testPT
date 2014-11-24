package com.broceliand.ui.settings
{
   import mx.containers.Canvas;
   import mx.controls.Label;
   
   public class PTSettingsSubtitle extends Canvas
   {
      private var _subtitleText:String;
      private var _label:Label;
      private var _subtitleTextHasChanged:Boolean;
      private var _greyContainer:Canvas;
      
      public function PTSettingsSubtitle()
      {
         super();
         percentWidth = 100;
         height = 28;
      }
      

      override protected function createChildren():void {
         super.createChildren()
            
         _label = new Label();
         _greyContainer = new Canvas();
         
         _label.percentHeight = 100;
         _label.percentWidth = 100;
         _label.setStyle("left", 6);
         _label.setStyle("top", 5);
         _label.setStyle('fontSize', 13);
         _label.setStyle('fontWeight', "normal");
         _label.setStyle('textAlign', "left");
         _label.setStyle("color", "#505050");
         _label.selectable=false;
         
         _greyContainer.height = 18;
         _greyContainer.percentWidth = 100;
         _greyContainer.setStyle("top",5);
         _greyContainer.setStyle("backgroundColor", "#CCCCCC");
         
         addChild(_greyContainer);
         addChild(_label);
      }
      
      public function set subtitleText(value:String):void{
         if (_subtitleText != value){
            _subtitleText = value;
            _subtitleTextHasChanged = true;
            invalidateProperties();
         }
      }
      
      override protected function commitProperties():void {
         super.commitProperties();
         if (_subtitleTextHasChanged){
            _label.text = _subtitleText;
            _subtitleTextHasChanged = false;
         }
      }
   }
}