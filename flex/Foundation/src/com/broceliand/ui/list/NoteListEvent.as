package com.broceliand.ui.list
{
   import com.broceliand.pearlTree.model.BroComment;
   
   import flash.events.Event;
   
   public class NoteListEvent extends Event
   {
      protected var _note:BroComment;
      
      function NoteListEvent(note:BroComment, type:String) {
         super(type);
         _note = note;
      }
      
      public function get note():BroComment {
         return _note;
      }
   }
}