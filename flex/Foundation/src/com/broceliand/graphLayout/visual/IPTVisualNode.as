package com.broceliand.graphLayout.visual
{
   import com.broceliand.graphLayout.model.IPTNode;
   
   import org.un.cava.birdeye.ravis.graphLayout.visual.IVisualNode;
   
   public interface IPTVisualNode extends IVisualNode
   {
      function get pearlView():IUIPearl;
      function get ptNode():IPTNode;
      function get moveNotifier():MoveNotifier;
      function set isExcited(isExcited:Boolean):void;
      function get isExcited():Boolean;
      function get distanceToClosestBrother():Number;      
      function set distanceToClosestBrother(value:Number):void;

      

   }
}