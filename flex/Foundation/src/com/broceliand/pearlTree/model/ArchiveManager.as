package com.broceliand.pearlTree.model
{
   import com.broceliand.ApplicationManager;
   import com.broceliand.pearlTree.io.object.content.PearlArchiveData;
   import com.broceliand.pearlTree.io.services.AmfTreeService;
   
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   
   import mx.controls.Tree;
   import mx.utils.StringUtil;
   
   public class ArchiveManager extends EventDispatcher
   {
      public static const ARCHIVES_CHANGED_EVENT:String = "archiveChanged";
      public static const ARCHIVE_BOTH_MODE:int = 2;
      public static const ARCHIVE_CAPTURE_MODE:int = 1;
      public static const ARCHIVE_WEBPAGE_MODE:int = 0;
      
      private static const LINK_FORMAT:String = ApplicationManager.getInstance().getServicesUrl() + "pearl/{0}?pearlId={1}&hash={2}";
      private static const CACHE_COMPONENT:String = "cache";
      private static const CAPTURE_COMPONENT:String = "customThumbshot"
      
      private static var _singleton:ArchiveManager;
      private var _pagesToReload:Array; 
      
      public function ArchiveManager()
      {
         _pagesToReload = new Array();
      }
      
      public static function getInstance():ArchiveManager {
         if (!_singleton) {
            _singleton = new ArchiveManager();
         }
         return _singleton;
      }
      
      public function archivePearlToServer(page:BroPageNode, mode:int):void {
         var treeService:AmfTreeService = ApplicationManager.getInstance().distantServices.amfTreeService;
         treeService.archivePearl(page.persistentID, mode, new AddSingleArchiveCallback(page));
      }
      
      public function loadArchivesFromServer(page:BroPageNode):void {
         var treeService:AmfTreeService = ApplicationManager.getInstance().distantServices.amfTreeService;
         treeService.getArchiveListForPearl(page.persistentID, ARCHIVE_BOTH_MODE, new LoadArchivesCallback(page));
      }
      
      public function registerSingleArchiveToBroPage(page:BroPageNode, pearlArchiveData:PearlArchiveData):void {
         var refPage:BroPage = page.refPage;
         refPage.registerNewArchive(pearlArchiveData);
         dispatchEvent(new PageArchivesReloadEvent(ARCHIVES_CHANGED_EVENT, refPage));
      }
      
      public function loadArchivesToBroPage(page:BroPageNode, pearlArchiveDatas:Array):void {
         var refPage:BroPage = page.refPage;
         refPage.loadArchives(pearlArchiveDatas);
         dispatchEvent(new PageArchivesReloadEvent(ARCHIVES_CHANGED_EVENT, refPage));
      }
      
      public static function buildUrlFromArchiveData(pearlId:Number, key:String, mode:int):String {
         
         var modeComponent:String = (mode == ARCHIVE_CAPTURE_MODE) ? CAPTURE_COMPONENT : CACHE_COMPONENT;
         var result:String = StringUtil.substitute(LINK_FORMAT, modeComponent, pearlId, key);
         return result;
      }
   }
}
import com.broceliand.pearlTree.io.object.content.PearlArchiveData;
import com.broceliand.pearlTree.io.services.callbacks.IAmfRetArrayCallback;
import com.broceliand.pearlTree.io.services.callbacks.IAmfRetPearlArchiveDataCallback;
import com.broceliand.pearlTree.io.services.callbacks.IAmfRetStringCallback;
import com.broceliand.pearlTree.model.ArchiveManager;
import com.broceliand.pearlTree.model.BroPageNode;

import mx.rpc.events.FaultEvent;

internal class AddSingleArchiveCallback implements IAmfRetPearlArchiveDataCallback {
   private var _page:BroPageNode;
   
   public function AddSingleArchiveCallback(page:BroPageNode) {
      _page = page;
   }
   
   public function onReturnValue(value:PearlArchiveData):void {
      var archiveManager:ArchiveManager = ArchiveManager.getInstance();
      archiveManager.registerSingleArchiveToBroPage(_page, value);
   }
   public function onError(message:FaultEvent):void {
      
   }
}

internal class LoadArchivesCallback implements IAmfRetArrayCallback {
   private var _page:BroPageNode;
   
   public function LoadArchivesCallback(page:BroPageNode) {
      _page = page;
   }
   public function onReturnValue(value:Array):void {
      var archiveManager:ArchiveManager = ArchiveManager.getInstance();
      archiveManager.loadArchivesToBroPage(_page, value);
   }
   public function onError(message:FaultEvent):void {
      
   }
}