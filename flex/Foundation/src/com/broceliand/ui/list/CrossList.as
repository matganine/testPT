package com.broceliand.ui.list
{
   import com.broceliand.ApplicationManager;
   import com.broceliand.pearlTree.model.BroLocalTreeRefNode;
   import com.broceliand.pearlTree.model.BroPTNode;
   import com.broceliand.pearlTree.model.BroPTRootNode;
   import com.broceliand.ui.pearlWindow.ui.cross.IPWCrossPanel;
   
   import mx.collections.ArrayCollection;
   
   public class CrossList extends PTList {
      
      protected var _node:BroPTNode;
      private   var _pwCrossPanel:IPWCrossPanel;
      protected var _neighbours:Array;
      private   var _isTeamStateEnabled:Boolean;
      
      public function CrossList() {
         dynamicMaxHeight = true;
      }
      
      override public function set dataProvider(value:Object):void {
         super.dataProvider = value;
         _neighbours = value as Array;
         if(_dynamicHeight) {
            refreshHeight();
         }
      }
      
      public function set node(value:BroPTNode):void {
         if(value != _node) {
            _node = value;
         }
      }
      public function get node():BroPTNode {
         return _node;
      }
      
      public function get isTeamStateEnabled():Boolean {
         return _isTeamStateEnabled;
      }
      public function set isTeamStateEnabled(value:Boolean):void {
         _isTeamStateEnabled = value;
      }
      
      public function set pwCrossPanel (value:IPWCrossPanel):void {
         _pwCrossPanel = value;
      }
      
      public function get pwCrossPanel ():IPWCrossPanel {
         return _pwCrossPanel;
      }
      
      
      
      public function shouldDisplayCrossPanelOnNavigation():Boolean {
         if (dataProvider && ArrayCollection(dataProvider).length ==1) {
            if (node is BroPTRootNode || node is BroLocalTreeRefNode) {
               return false;
            }
         }
         return true;
      }
      
      public function loadNextPage():void {
         ApplicationManager.getInstance().visualModel.neighbourModel.loadNextPage(_node);
      }
   }
}