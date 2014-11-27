package com.broceliand.ui.model.analytics
{
   import com.broceliand.ApplicationManager;
   import com.broceliand.pearlTree.model.BroPearlTree;
   import com.broceliand.pearlTree.navigation.NavigationEvent;
   
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.TimerEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   
   import mx.utils.StringUtil;

   public class NavigationTracker
   {
      private static const SAVE_INTERVAL:uint = 30000; 
      
      public static const SERVICE_NAME:String = "track";
      
      public static const SESSION_PARAM:String="sid";
      public static const TREE_HIT_PARAM:String="th";
      public static const UNIQUE_TREE_HIT_PARAM:String="uth";
      public static const MY_VISIT_TREE_HIT_PARAM:String="vth";
      
      public static const ID_SEPARATOR:String="_";
      public static const VALUE_SEPARATOR:String="-";
      public static const ITEM_SEPARATOR:String=",";
      
      private var _treeHit:Array;
      private var _uniqueTreeHit:Array;
      
      private var _myVisitTreeHit:Array;
      
      private var _timer:Timer;
      private var _serviceUrl:String;
      private var _sessionID:String;
      
      public function NavigationTracker() {
         var am:ApplicationManager = ApplicationManager.getInstance();
         
         _treeHit = new Array();
         _myVisitTreeHit = new Array();
         _uniqueTreeHit = new Array();
         
         _serviceUrl = am.getServicesUrl()+SERVICE_NAME;
         _sessionID = ApplicationManager.getInstance().getSessionID();
         if(!_sessionID || StringUtil.trim(_sessionID)=="") {
            _sessionID = Math.round(Math.random()*100000000).toString();
         }
         
         _timer = new Timer(SAVE_INTERVAL);
         _timer.addEventListener(TimerEvent.TIMER, onTimeToSave);
         _timer.start();
         
         am.visualModel.navigationModel.addEventListener(NavigationEvent.NAVIGATION_EVENT, onNavigationChange);
      }
      private function onNavigationChange(event:NavigationEvent):void {
         var isVisingMyTree:Boolean = false;
         
         if(event.newUser == ApplicationManager.getInstance().currentUser) {
            isVisingMyTree = true;
         }

         if(event.newSelectedPearl != event.oldSelectedPearl) {
            var tree:BroPearlTree = event.newSelectedTree;
            if(!tree) return;
            if (!isVisingMyTree) {
               trackTreeHit(tree);
            }

            if(event.newSelectedTree != event.oldSelectedTree) {
               trackUniqueTreeHit(tree, isVisingMyTree);
               
            }
         }
         
      }
      
      public function trackTreeHit(tree:BroPearlTree):void{
         if(!tree) return;
         _treeHit.push(new TreeHitAction(tree));
      }
      
      public function trackUniqueTreeHit(tree:BroPearlTree, isVisitingMyTree:Boolean):void{
         if(!tree) return;
         if (isVisitingMyTree) {
            _myVisitTreeHit.push(new TreeHitAction(tree));
         } else {
            _uniqueTreeHit.push(new TreeHitAction(tree));
         }
      }
      
      public function saveModel():void {
         if(!hasActionsToSave()) return;
         
         var treeHitsUrl:String = buildTreeHitsUrl();
         var uniqueTreeHitsUrl:String = buildUniqueTreeHitsUrl(false);
         var myVisitTreeHitsUrl:String = buildUniqueTreeHitsUrl(true);
         
         var urlRequest:String = _serviceUrl+"?"+
            SESSION_PARAM+"="+_sessionID+
            "&"+TREE_HIT_PARAM+"="+treeHitsUrl+
            "&"+UNIQUE_TREE_HIT_PARAM+"="+uniqueTreeHitsUrl+
            "&"+MY_VISIT_TREE_HIT_PARAM+"="+ myVisitTreeHitsUrl;
         
         var request:URLRequest = new URLRequest(urlRequest);
         var loader:URLLoader = new URLLoader();
         addLoaderListeners(loader);
         try {
            loader.load(request);
         }
         catch (error:Error){}

      }
      private function addLoaderListeners(loader:URLLoader):void {
         loader.addEventListener(IOErrorEvent.IO_ERROR, onSaveIOError);
         loader.addEventListener(Event.COMPLETE, onSaveComplete);
      }
      private function removeLoaderListeners(loader:URLLoader):void {
         loader.removeEventListener(IOErrorEvent.IO_ERROR, onSaveIOError);
         loader.removeEventListener(Event.COMPLETE, onSaveComplete);        
      }
      
      private function onSaveIOError(event:IOErrorEvent):void {
         var loader:URLLoader = URLLoader(event.target);
         removeLoaderListeners(loader);
      }
      private function onSaveComplete(event:Event):void {
         var loader:URLLoader = URLLoader(event.target);
         removeLoaderListeners(loader);
      }
      
      private function hasActionsToSave():Boolean {
         if(_treeHit && _treeHit.length > 0) return true;
         if (_myVisitTreeHit && _myVisitTreeHit.length>0) return true;
         
         return false;
      }
      
      private function buildTreeHitsUrl():String {
         var treeHitsUrl:String = "";
         if(!_treeHit || _treeHit.length==0) return treeHitsUrl;

         var treeHitCount:Dictionary = new Dictionary();
         for each(var action:TreeHitAction in _treeHit) {
            var treeKey:String = action.tree.dbId+ID_SEPARATOR+action.tree.id;
            treeHitCount[treeKey] = (treeHitCount[treeKey] as uint) + 1;
         }

         _treeHit = new Array();

         for (var key:String in treeHitCount) {
            treeHitsUrl += key+VALUE_SEPARATOR+treeHitCount[key]+ITEM_SEPARATOR;
         }
         
         treeHitsUrl = treeHitsUrl.substr(0,treeHitsUrl.length-1);
         
         return treeHitsUrl;
      }
      
      private function buildUniqueTreeHitsUrl(isMyTreeVisits:Boolean):String {
         var treeHitsArray:Array= isMyTreeVisits?_myVisitTreeHit:_uniqueTreeHit;
         
         var uniqueTreeHitsUrl:String = "";
         if(!treeHitsArray || treeHitsArray.length==0) return uniqueTreeHitsUrl;

         var uniqueTreeHitCount:Dictionary = new Dictionary();
         for each(var action:TreeHitAction in treeHitsArray) {
            var treeKey:String = action.tree.dbId+ID_SEPARATOR+action.tree.id;
            uniqueTreeHitCount[treeKey] = (uniqueTreeHitCount[treeKey] as uint) + 1;
         }

         if (isMyTreeVisits) {
            _myVisitTreeHit = new Array();  
         }  else {
            _uniqueTreeHit  = new Array();
         }

         for (var key:String in uniqueTreeHitCount) {
            uniqueTreeHitsUrl += key+VALUE_SEPARATOR+uniqueTreeHitCount[key]+ITEM_SEPARATOR;
         }
         
         uniqueTreeHitsUrl = uniqueTreeHitsUrl.substr(0,uniqueTreeHitsUrl.length-1);
         
         return uniqueTreeHitsUrl;
      }      
      
      private function onTimeToSave(event:TimerEvent):void{
         saveModel();
      }      
      
   }
}