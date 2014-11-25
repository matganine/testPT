package com.broceliand.ui.settings
{
   import flash.events.Event;
   
   public class SettingsEvent extends Event
   {
      public static const EVENT_SETTINGS_SAVED:String = "settingsSaved";
      public static const DATA_CHANGED_EVENT:String = "dataChangedEvent";
      public static const IMAGE_UPLOADED:String = "imageUploaded";
      public static const VALID_EMAIL:String = "validEmail";
      public static const INVALID_EMAIL:String = "invalidEmail";
      public static const VALID_PASSWORD:String = "validPassword";
      public static const INVALID_PASSWORD:String = "invalidPassword";
      public static const VALID_USERNAME:String = "validUsername";
      public static const INVALID_USERNAME:String = "invalidUsername";
      public static const SOCIAL_SYNC:String = "socialSync";
      public static const SOCIAL_NOT_SYNC:String = "socialNotSync";
      
      public function SettingsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
      {
         super(type, bubbles, cancelable);
      }
      
   }
}