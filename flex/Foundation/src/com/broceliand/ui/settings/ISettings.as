package com.broceliand.ui.settings {

import flash.events.IEventDispatcher;

public interface ISettings extends IEventDispatcher {

   function set visible(value:Boolean):void;
   function get visible():Boolean;
   function showIdentityForm():void;
   function showLostpasswordForm():void;
   function showNotificationsForm():void;
   function showAccountForm():void;
   function showExportForm():void;
}
}