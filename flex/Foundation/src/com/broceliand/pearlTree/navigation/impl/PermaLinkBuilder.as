package com.broceliand.pearlTree.navigation.impl
{
   import com.broceliand.ApplicationManager;
   import com.broceliand.pearlTree.model.BroAssociation;
   import com.broceliand.pearlTree.model.BroPTNode;
   import com.broceliand.pearlTree.model.BroPearlTree;
   import com.broceliand.pearlTree.model.User;

   public class PermaLinkBuilder
   {
      private static const ROOT_URL:String = ApplicationManager.getInstance().getWebSiteUrl();
      
      public static const PARAM_REFERENCE:String="pearls";
      public static const PARAM_PEARLWINDOW:String="pw";
      public static const PARAM_PLAYMODE:String="play";
      
      public static const ID_SEPARATOR:String="_";
      public static const TEXT_SEPARATOR:String=",";
      
      public static const PW_NOT_DISPLAY:uint=0;
      public static const PW_TAB_CONTENT:uint=1;
      public static const PW_TAB_NOTE:uint=2;
      public static const PW_TAB_NEIGHBOUR:uint=3;
      
      public static const PLAYMODE_NORMAL:int=-1;
      public static const PLAYMODE_HIGHLIGHT:uint=0;
      
      
      public static function buildUserPermaLink(user:User, pwTab:uint=0, usePrettyUserUrl:Boolean=true, playMode:int=-1):String {
         var url:String = getRootUrl();
         
         url += PARAM_REFERENCE+"/";
         url += getUserParam(user)+"/";
         
         if(pwTab>0) url += getPearlwindowParam(pwTab)+"/";
         if (playMode!=0 && getPlayModeParam(playMode)) url += getPlayModeParam(playMode)+"/";
         
         return url;
      }
      public static function buildPearlPermaLink(node:BroPTNode, userAccount:User, pwTab:uint=0, usePrettyUserUrl:Boolean=true, playMode:int=-1):String {
         var url:String = getRootUrl();
         
         url += PARAM_REFERENCE+"/";
         url += getPearlParam(node)+"/";
         
         if(pwTab>0) url += getPearlwindowParam(pwTab)+"/";
         if (playMode!=0 && getPlayModeParam(playMode)) url += getPlayModeParam(playMode)+"/";
         
         return url;
      }
      public static function buildTreePermaLink(tree:BroPearlTree, pwTab:uint=0, usePrettyUserUrl:Boolean=true, playMode:int=0):String {
         var url:String = getRootUrl();
         
         url += PARAM_REFERENCE+"/";
         url += getTreeParam(tree)+"/";
         
         if(pwTab>0) url += getPearlwindowParam(pwTab)+"/";
         if (playMode!=0 && getPlayModeParam(playMode)) url += getPlayModeParam(playMode)+"/"; 
         return url;
      }
      public static function buildAssociationPermaLink(association:BroAssociation, pwTab:uint=0, usePrettyUserUrl:Boolean=true, playMode:int=0):String {
         var url:String = getRootUrl();
         
         url += PARAM_REFERENCE+"/";
         url += getAssociationParam(association)+"/";
         
         if(pwTab>0) url += getPearlwindowParam(pwTab)+"/";
         if (playMode!=0 && getPlayModeParam(playMode)) url += getPlayModeParam(playMode)+"/"; 
         return url;
      }
      
      private static function getRootUrl():String {
         return ROOT_URL;
      }
      private static function getUserParam(user:User):String {
         return user.rootPearlId.toString();
      }
      private static function getAssociationParam(association:BroAssociation):String {
         var tree:BroPearlTree = new BroPearlTree();
         tree.id = association.associationId;
         return tree.getRootNode().persistentID.toString();
      }
      private static function getPearlParam(node:BroPTNode):String {
         return node.persistentID.toString();
      }
      private static function getTreeParam(tree:BroPearlTree):String {
         return tree.getRootNode().persistentID.toString();
      }
      private static function getPearlwindowParam(pwTab:uint):String {
         if(pwTab>0 && pwTab<4) {
            return PARAM_PEARLWINDOW+"/"+pwTab;
         }else{
            return null;
         }
      }
      private static function getPlayModeParam(mode:uint):String {
         if(mode>=0 && mode<2) {
            return PARAM_PLAYMODE+"/"+mode;
         }else{
            return null;
         }
      }
      
   }
}