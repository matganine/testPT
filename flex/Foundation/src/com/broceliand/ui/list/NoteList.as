package com.broceliand.ui.list
{
   import com.broceliand.ApplicationManager;
   import com.broceliand.pearlTree.model.BroComment;
   import com.broceliand.pearlTree.model.BroPTNode;
   import com.broceliand.ui.pearlWindow.ui.note.PWNoteItem;
   
   import mx.collections.ArrayCollection;
   
   [Event(name="onDeleteNote", type="flash.events.Event")] 
   [Event(name="onReplyToNote", type="flash.events.Event")]
   
   public class NoteList extends PTList implements INoteList {
      
      protected var _deletable:Boolean;
      protected var _notifyNewNotes:Boolean;      
      protected var _node:BroPTNode;
      private var nodeChanged:Boolean;
      protected var _notes:ArrayCollection;
      private var notesChanged:Boolean;
      private var refreshDataProvider:Boolean;
      
      public static const DELETE_EVENT:String = "onDeleteNote";
      public static const REPLY_EVENT:String = "onReplyToNote";
      
      public function deleteNote(note:BroComment):void {
         dispatchEvent(new NoteListEvent(note, DELETE_EVENT));
      }
      
      public function replyToNote(note:BroComment):void {
         dispatchEvent(new NoteListEvent(note, REPLY_EVENT));
      }
      
      override public function set dataProvider(value:Object):void {
            if(_notes != value) {
               _notes = value as ArrayCollection;
               refreshDataProvider = true;
            }
            invalidateProperties();






      }
      
      override protected function commitProperties():void{
         super.commitProperties();
         
         
         
         if(nodeChanged && !notesChanged && _notes) {
            purgeList();
            super.dataProvider = _notes;
         }
         if(refreshDataProvider) {
            refreshDataProvider = false;
            super.dataProvider = _notes;
         }
         
         nodeChanged = false;
         notesChanged = false;
      }
      
      public function set deletable(value:Boolean):void{
         _deletable = value;
      }
      public function get deletable():Boolean{
         return _deletable;
      }
      
      public function get notifyNewNotes():Boolean {
         return _notifyNewNotes;
      }
      public function set notifyNewNotes(value:Boolean):void {
         _notifyNewNotes = value;
      }
      
      public function set node(value:BroPTNode):void {
         if(value != _node) {
            _node = value;
            nodeChanged = true;
            invalidateProperties();
         }
      }
      public function get node():BroPTNode {
         return _node;
      }
      
      public function getNotePosition(note:BroComment):uint{
         return _notes.getItemIndex(note) + 1;
      }
      
      public function isLastNote(note:BroComment):Boolean {
         return (getNotePosition(note) == _notes.length);
      }
      
      public function isLocalNote(note:BroComment):Boolean {
         return ApplicationManager.getInstance().visualModel.noteModel.isLocalNote(note, _node);
      }
      
      public function autoScroll(noteItem:PWNoteItem):void {
         
      }
      
      public function loadNextPage():void {
         ApplicationManager.getInstance().visualModel.noteModel.loadNextPage(node);
      }
   }
}