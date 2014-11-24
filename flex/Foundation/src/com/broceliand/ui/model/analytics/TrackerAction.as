package com.broceliand.ui.model.analytics {
   
   public class TrackerAction
   {
      private var _time:Number;
      
      public function TrackerAction() {
         _time = new Date().getTime();
      }
      
      public function get time():Number {
         return _time;
      }
   }
}