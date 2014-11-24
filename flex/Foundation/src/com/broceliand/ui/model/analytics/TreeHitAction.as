package com.broceliand.ui.model.analytics
{
   import com.broceliand.pearlTree.model.BroPearlTree;
   
   public class TreeHitAction extends TrackerAction
   {
      private var _tree:BroPearlTree;
      
      public function TreeHitAction(tree:BroPearlTree) {
         super();
         _tree = tree;
      }
      
      public function get tree():BroPearlTree {
         return _tree;
      }
   }
}