package com.broceliand.ui.list
{
   import mx.core.IUIComponent;
   
   public interface IPTList extends IUIComponent {
      function get dataProvider():Object;
      function set dataProvider(value:Object):void;
      function focusLastItem():void;
      function focusFirstItem():void;
      function purgeList():void;      
   }
}