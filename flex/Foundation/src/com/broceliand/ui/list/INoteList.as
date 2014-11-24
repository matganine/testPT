package com.broceliand.ui.list
{
   import com.broceliand.pearlTree.model.BroComment;
   import com.broceliand.pearlTree.model.BroPTNode;
   import com.broceliand.ui.pearlWindow.ui.note.PWNoteItem;
   
   import mx.core.UIComponent;
   
   public interface INoteList extends IPTList {
      function getNotePosition(note:BroComment):uint;
      function isLastNote(note:BroComment):Boolean;
      function isLocalNote(note:BroComment):Boolean;      
      function get deletable():Boolean;
      function set deletable(value:Boolean):void;
      function get notifyNewNotes():Boolean;
      function set notifyNewNotes(value:Boolean):void;
      function deleteNote(note:BroComment):void;
      function replyToNote(note:BroComment):void;
      function set node(value:BroPTNode):void;
      function get node():BroPTNode;
      function autoScroll(noteItem:UIComponent):void;
      function loadNextPage():void;
   }
}