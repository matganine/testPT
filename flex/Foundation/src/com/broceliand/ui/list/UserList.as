package com.broceliand.ui.list
{
import com.broceliand.util.BroLocale;

   public class UserList extends PTList {
      
      protected var _displayUserInfo:Boolean;
      protected var _loadMoreLabel:String;
      
      function UserList(){
         super();
         variableRowHeight = false;
         selectable = true;
         _loadMoreLabel = BroLocale.getInstance().getText('pw.panel.cross.showmore');
      }
      
      public function get displayUserInfo():Boolean {
         return _displayUserInfo;
      }
      public function set displayUserInfo(value:Boolean):void {
         _displayUserInfo = value;
      }
      
      public function get loadMoreLabel():String {
         return _loadMoreLabel;
      }
      public function set loadMoreLabel(value:String):void {
         if(value != _loadMoreLabel && value) {
            _loadMoreLabel = value;
         }
      }     
   }
}