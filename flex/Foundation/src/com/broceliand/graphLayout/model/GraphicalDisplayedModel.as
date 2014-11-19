package com.broceliand.graphLayout.model
{
   import com.broceliand.graphLayout.visual.IPTVisualGraph;
   
   import flash.utils.Dictionary;
   


   public class GraphicalDisplayedModel
   {
      private var _vgraph:IPTVisualGraph;
   
      private var _tree2RootNodes:Dictionary=new Dictionary();

      public function GraphicalDisplayedModel(vgraph:IPTVisualGraph)
      {
         _vgraph = vgraph;
      }

      public function onTreeGraphBuilt(rootOfTheTree:IPTNode):void {
         if (rootOfTheTree is PTRootNode) {

            _tree2RootNodes[getTreeFromRootNode(rootOfTheTree)] =rootOfTheTree;
         } else throw Error("Invalid rootTree"); 
      } 
      public function onNodeRemovedFromGraph(node:IPTNode):void {
         
         if (tree && _tree2RootNodes[tree] == node) {
            delete _tree2RootNodes[tree];
         }
      }
      
      
                   
   }
}