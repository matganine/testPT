package com.broceliand.pearlTree.navigation.impl
{
   import com.broceliand.ApplicationManager;
   import com.broceliand.ui.welcome.tunnel.TunnelNavigationModel;
   import com.broceliand.util.UrlNavigationController;
   
   import flash.events.Event;
   
   import mx.managers.IHistoryManagerClient;
   
   public class TunnelUrlNavigation implements IHistoryManagerClient
   {
      private static const TUNEL_CLIENT_NAME:String="newAccount";
      private static const  STEP_FIELD:String="step";
      
      public function TunnelUrlNavigation(tunelModel:TunnelNavigationModel)
      {

      }
      public function saveState():Object {
         return makeState();
      }
      public function makeState():Object {
         var state:Object= new Object();
         var panel:int = getTunnelModel().getPanelDisplayed();;
         if (panel == TunnelNavigationModel.NOT_DISPLAY) {
            return null;
         }
         state[STEP_FIELD] =panel;
         return state; 
         
      }
      
      public function loadState(state:Object):void {
         if (state) {
            getTunnelModel().displayPanel(state[STEP_FIELD]);
         }
         
      }
      public function toString():String {
         return "newAccount";
      }
      public function getTunnelModel():TunnelNavigationModel {
         return ApplicationManager.getInstance().visualModel.navigationModel.getTunnelModel();
      } 
      
      public function onTunnelNavigate(e:Event):void {
         UrlNavigationController.save();
         
      }
      
   }
}