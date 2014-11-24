package com.broceliand.ui.pearl
{
   import com.broceliand.ui.renderers.pageRenderers.DistantHiddenTreeRefPearlRenderer;
   import com.broceliand.ui.renderers.pageRenderers.PearlRendererStateManager;
   import com.broceliand.ui.renderers.pageRenderers.pearl.PTRootPearl;
   import com.broceliand.util.resources.IRemoteResourceManager;

   public class UIDistantHiddenPearl extends DistantHiddenTreeRefPearlRenderer
   {
      private static const DEFAULT_PEARL_WIDTH:Number = PTRootPearl.PEARL_WIDTH_NORMAL;
      private static const MAX_PEARL_WIDTH:Number = PTRootPearl.PEARL_WIDTH_EXCITED;
      
      public function UIDistantHiddenPearl(stateManager:PearlRendererStateManager, remoteResourceManager:IRemoteResourceManager)
      {
         super(stateManager, remoteResourceManager);
      }
      
      override protected function get pearlDefaultWidth():Number {
         return DEFAULT_PEARL_WIDTH;
      } 
      override public function get pearlMaxWidth():Number {
         return MAX_PEARL_WIDTH;
      }      
   }
}