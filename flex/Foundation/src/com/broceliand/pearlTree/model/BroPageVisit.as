package com.broceliand.pearlTree.model{
   public class BroPageVisit
   {
      private var _id:int;
      private var _page:BroPage;
      private var _historyId:Number;
      private var _visitTime:Number;
      private var _visitMethod:Number;
      private var _tabId:String;	
      private var _comment:String;
      public static const UNKNOWN_METHOD:int = 0;
      public static const TAB_CHANGED_METHOD:int = 1;
      public static const LINKED_CLICKED_METHOD:int = 2
      public static const FORWARD_METHOD:int = 3;
      public static const FORM_SUBMITED_METHOD:int = 4;
      public static const NEW_TAB_METHOD:int = 5;
      public static const NEW_WINDOW_METHOD:int = 7;
      public static const COMMENT_METHOD:int = 8;
      public function BroPageVisit(page:BroPage)
      {
         _page= page;
      }

      public function set historyId(val:Number):void
      {
         _historyId = val;
      }
      
      public function get historyId():Number
      {
         return _historyId;
      }
      public function set visitTime(val:Number):void
      {
         _visitTime = val;
      }
      
      public function get visitTime():Number
      {
         return _visitTime;
      }
      public function set visitMethod(val:Number):void
      {
         _visitMethod = val;
      }
      
      public function getVisitMethod():int
      {
         switch(_visitMethod) {
            case 1 :
               return TAB_CHANGED_METHOD;
            case 2:
               return LINKED_CLICKED_METHOD;
            case 3:
               return FORM_SUBMITED_METHOD;
            case 4: 
               return FORWARD_METHOD;
            case 5:
               return NEW_TAB_METHOD;
            case 7:
               return NEW_WINDOW_METHOD;
            case 8:
               return COMMENT_METHOD;                    
            default:
               return UNKNOWN_METHOD;
         }
         return _visitMethod;
      }
      
      public function set page(val:BroPage):void
      {
         _page = val;
      }
      
      public function get page():BroPage
      {
         return _page;
      }
      
      public function set id(val:int):void
      {
         _id = val;
      }
      
      public function get id():int
      {
         return _id;
      }
      
      public function set tabId(val:String):void
      {
         _tabId = val;
      }
      
      public function get tabId():String
      {
         return _tabId;
      }
      
      public function set comment(val:String):void
      {
         _comment = val;
      }
      
      public function get comment():String
      {
         return _comment;
      }		
   }
}