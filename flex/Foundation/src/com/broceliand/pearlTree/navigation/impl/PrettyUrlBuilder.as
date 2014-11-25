package com.broceliand.pearlTree.navigation.impl
{
   import com.broceliand.ApplicationManager;
   import com.broceliand.pearlTree.model.BroAssociation;
   import com.broceliand.pearlTree.model.BroPTNode;
   import com.broceliand.pearlTree.model.BroPearlTree;
   import com.broceliand.pearlTree.model.BroTreeRefNode;
   import com.broceliand.pearlTree.model.User;
   
   import mx.collections.ArrayCollection;
   import mx.controls.Tree;
   
   public class PrettyUrlBuilder
   {
      private static const ROOT_URL:String = ApplicationManager.getInstance().getWebSiteUrl();
      
      public static const PARAM_PEARL:String="pearl";
      public static const PARAM_TREE:String="id";
      public static const PARAM_ASSOCIATION:String="team";
      public static const PARAM_PEARLWINDOW:String="pw";
      public static const PARAM_PLAYMODE:String="play";
      
      public static const PW_NOT_DISPLAY:uint=0;
      public static const PW_TAB_CONTENT:uint=1;
      public static const PW_TAB_NOTE:uint=2;
      public static const PW_TAB_NEIGHBOUR:uint=3;
      
      public static const PLAYMODE_NORMAL:int=-1;
      public static const PLAYMODE_HIGHLIGHT:uint=0;
      public static const PLAYMODE_BROWSER:uint=1;
      public static const PLAYMODE_SCREENWINDOW:uint=1;
      
      public static function buildUserPrettyUrl(user:User, pwTab:uint=0, usePrettyUserUrl:Boolean=true, playMode:int=-1):String {
         var url:String = getRootUrl();
         url += getUserParam(user);
         url += createAdditionalParameters(pwTab, playMode);
         return url;
      }
      
      public static function buildPearlPrettyUrl(node:BroPTNode, userAccount:User, pwTab:uint=0, usePrettyUserUrl:Boolean=true, playMode:int=-1):String {
         var url:String = getRootUrl();
         var association:BroAssociation = node.owner.getMyAssociation();
         
         if (association && association.isUserRootAssociation()) {
            url += getUserParam(userAccount)+"/";
            url += getPearlParam(node);
         } else {
            url += "t/";
            url += getPearlParam(node);
         }
         
         url += createAdditionalParameters(pwTab, playMode);
         
         return url;
      }
      
      public static function buildTreePrettyUrl(tree:BroPearlTree, pwTab:uint=0, usePrettyUserUrl:Boolean=true, playMode:int=0):String {
         var url:String = getRootUrl();
         var association:BroAssociation = tree.getMyAssociation();
         
         if (association && association.isUserRootAssociation()) {
            url += getUserParam(association.preferredUser)+"/tree/";
            url += getTreeParam(tree);
         } else {
            url += "t/team/";
            url += getTreeParam(tree);
         }
         
         url += createAdditionalParameters(pwTab, playMode);
         return url;
      }
      
      public static function buildAssociationPrettyUrl(association:BroAssociation, rootTree:BroPearlTree, pwTab:uint=0, usePrettyUserUrl:Boolean=true, playMode:int=0):String {
         var url:String = getRootUrl();
         url += "t/team/";
         url += getTreeParam(rootTree);
         url += createAdditionalParameters(pwTab, playMode);
         return url;
      }
      
      private static function getRootUrl():String {
         return ROOT_URL;
      }
      
      private static function getUserParam(user:User):String {
         return decodeURIComponent(user.name);
      }
      
      private static function getPearlParam(node:BroPTNode):String {
         return PARAM_PEARL + node.persistentID.toString();
      }
      
      private static function getTreeParam(tree:BroPearlTree):String {
         return PARAM_TREE + tree.id.toString();
      }
      
      private static function getPearlwindowParam(pwTab:uint):String {
         if(pwTab>0 && pwTab<4) {
            return PARAM_PEARLWINDOW+","+pwTab;
         }else{
            return null;
         }
      }
      
      private static function getPlayModeParam(mode:uint):String {
         if(mode>0 && mode<2) {
            return PARAM_PLAYMODE+","+mode;
         }else{
            return null;
         }
      }
      
      private static function createAdditionalParameters(pwTab:uint, playMode:int):String {
         var params:String = "";
         var pwTabParam:String = getPearlwindowParam(pwTab);
         var playModeParam:String = getPlayModeParam(playMode);
         if (pwTabParam || playModeParam) {
            params += "?show=";
            if (pwTabParam) {
               params += pwTabParam;
               if (playModeParam) {
                  params += ";";
               }
            }
            if (playModeParam) {
               params += playModeParam;
            }
         }
         return params;
      }
   }
}