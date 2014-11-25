package com.broceliand {
   
   import com.broceliand.graphLayout.visual.IPTVisualGraph;
   import com.broceliand.pearlTree.model.BroPageNode;
   import com.broceliand.player.PlayerUtils;
   import com.broceliand.ui.controller.IPearlbarInfo;
   import com.broceliand.ui.controller.startPolicy.StartPolicyLogger;
   import com.broceliand.ui.model.ScrollModel;
   import com.broceliand.ui.util.upload.FileUploadRequest;
   import com.broceliand.ui.util.upload.FileUploadRequestJS;
   import com.broceliand.ui.window.ui.eventpromo.EventPromoHelper;
   import com.broceliand.util.BroLocale;
   import com.broceliand.util.MultiUploadProgressEvent;
   import com.broceliand.util.PTExternalInterface;
   import com.broceliand.util.flexWorkaround.BrowserManager;
   import com.broceliand.util.flexWorkaround.BrowserManagerImpl;
   import com.broceliand.util.flexWorkaround.SafariMouseWheelHandler;
   
   import flash.events.DataEvent;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.utils.setInterval;
   import flash.utils.setTimeout;
   
   public class ExternalJavascriptInterface extends EventDispatcher implements IJavascriptInterface {
      
      private var _isJavascriptInterfaceAvailable:Boolean = false;
      private var _isProtectingUpload:Boolean = false;
      public static const MONITORED_POPUP_CLOSED:String = "monitoredPopupClosed";
      public static const IFRAME_FILLED:String = "iFrameFilled";
      public static const FACEBOOK_ID_LOADED:String = "facebookIdLoaded";
      public static const OS_WINDOWS:String = "Windows";
      public static const OS_MAC:String = "Mac";
      public static const ADDON_INSTALLED_FF:String = "AddonInstalledFF";
      private var _lastPageViewSent:Number = -1;
      
      
      private var _viewCount: Number = 0;
      
      public function ExternalJavascriptInterface(_loaderParameters:ILoaderParameters) {
         var am:ApplicationManager = ApplicationManager.getInstance();
         _isJavascriptInterfaceAvailable = isJavascriptInterfaceAvailable();
         
         if(_isJavascriptInterfaceAvailable) {
            addCallbacks();
            
            
            if((am.isOverlay() || am.isEmbedWindowMode()) && am.getOS() == ApplicationManager.OS_NAME_WINDOWS) {
               setInterval(PTExternalInterface.restoreCallbacks, 1000);
            }
         }
      }
      
      private function addCallbacks():void {
         PTExternalInterface.addCallback("pearlbarCommand", pearlbarCommand);
         PTExternalInterface.addCallback("browserURLChangeWorkaround", browserURLChangeWorkaround);
         PTExternalInterface.addCallback("onApplicationExit", onApplicationExit);
         PTExternalInterface.addCallback("onPageInCacheLoaded", onPageInCacheLoaded);
         PTExternalInterface.addCallback("onBrowserIFrameLoaded", onBrowserIFrameLoaded);
         PTExternalInterface.addCallback("getStageHeight", getStageHeight);
         PTExternalInterface.addCallback("onMonitoredPopupClose", onMonitoredPopupClose);
         PTExternalInterface.addCallback("onIFrameFilled", onIFrameFilled);
         PTExternalInterface.addCallback("onFacebookIdLoaded", onFacebookIdLoaded);
         PTExternalInterface.addCallback("startTrackpadDrag", startTrackpadDrag);
         PTExternalInterface.addCallback("handleWheel", handleWheel);
         PTExternalInterface.addCallback("onSendPageViewStat", onSendPageViewStat);
         
         PTExternalInterface.addCallback("updateUploadProgress", updateUploadProgress);
         PTExternalInterface.addCallback("uploadFilesDone", uploadFilesDone);
         PTExternalInterface.addCallback("notifySelectFiles", notifySelectFiles);
         PTExternalInterface.addCallback("notifyUploadFileError", notifyUploadFileError);
         PTExternalInterface.addCallback("notifyUploadStart", notifyUploadStart);
         PTExternalInterface.addCallback("notifyUploadFileComplete", notifyUploadFileComplete);
         PTExternalInterface.addCallback("notifyUploadBatchComplete", notifyUploadBatchComplete);
         
         PTExternalInterface.addCallback("notifyAddonInstalledFF", notifyAddonInstalledFF);
      }
      
      private function isJavascriptInterfaceAvailable():Boolean {
         var isAvailable:Boolean = false;
         try {
            isAvailable = PTExternalInterface.call("function () { return (window.document != null); }");
         }catch(error:Error) {
            isAvailable = false;
         }
         return isAvailable;
      }
      
      private function getStageHeight():Number {
         if(ApplicationManager.flexApplication.stage) {
            return ApplicationManager.flexApplication.stage.stageHeight;
         }else{
            return 0;
         }
      }
      
      private function onApplicationExit():String  {
         ApplicationManager.getInstance().notifyApplicationClosing();
         return "Goodbye";
      }
      
      private function pearlbarCommand(commandName:String, param:String):void {
         var pearlbarInfo:IPearlbarInfo =ApplicationManager.getInstance().components.pearlbarInfo;
         if(commandName == "pearlbarIsInstalled") {
            if (pearlbarInfo) {
               pearlbarInfo.pearlbarDetected = true;
            }
         }
         else if(commandName == "setPearlbarVersion") {
            if (pearlbarInfo) {
               pearlbarInfo.pearlbarVersion = param;
            }
         }
      }
      
      public function isInterfaceReady():Boolean {
         return _isJavascriptInterfaceAvailable;
      }
      
      public function decodeJSON(data:String):Object {
         if(!_isJavascriptInterfaceAvailable) return null;
         return PTExternalInterface.call("function(){return " + data + "}");
      }
      
      public function addEmbedJS():void {
      }
      
      private function browserURLChangeWorkaround(msg:String):void{
         BrowserManagerImpl(BrowserManagerImpl.getInstance()).browserURLChangeBrowser(msg);
      }
      
      private function handleWheel(event : Object) : void {
         SafariMouseWheelHandler.getInstance().handleWheel(event);
      }
      
      private function updateUploadProgress(progressBatch:Number, progressFile:Number, filePosition:uint, batchPosition:uint, stepSize:Number=0, stepTime:Number=0):void {
         var event:MultiUploadProgressEvent = new MultiUploadProgressEvent(progressBatch, progressFile, filePosition, batchPosition, stepSize, stepTime);
         dispatchEvent(event);
      }
      
      public function removeUploadFile(filePosition:int, batchPosition:int):void {
         if(!_isJavascriptInterfaceAvailable) return;
         PTExternalInterface.call("removeUploadFile", filePosition, batchPosition);
      }
      
      private function notifySelectFiles(fileInfoArray:Array, batchPosition:int):void {
         FileUploadRequest.tempFileInfoArray = fileInfoArray;
         dispatchEvent(new Event(FileUploadRequest.UPLOAD_FILES_SELECTED_JS));
      }
      
      private function notifyUploadFileError(filePosition:int, batchPosition:int):void {
         var data:String = FileUploadRequestJS.encodeFileBatchPositionInString(filePosition, batchPosition);
         dispatchEvent(new DataEvent(FileUploadRequest.PROCESSING_ERROR_JS, false, false, data));
      }
      
      private function notifyUploadStart():void {
         
      }
      
      private function notifyUploadFileComplete(positionFile:int, positionBatch:int):void {
         var data:String = FileUploadRequestJS.encodeFileBatchPositionInString(positionFile, positionBatch);
         var e:DataEvent = new DataEvent(FileUploadRequest.UPLOAD_CURRENT_FILE_COMPLETE_JS, false, false, data);
         dispatchEvent(e);
      }
      
      private function uploadFilesDone():void {
         dispatchEvent(new Event(FileUploadRequest.UPLOAD_ALL_FILES_COMPLETE_JS));
      }
      
      private function notifyUploadBatchComplete(position:int):void {
         dispatchEvent(new DataEvent(FileUploadRequest.UPLOAD_BATCH_COMPLETE_JS, false, false, position.toString()));
      }
      
      private function notifyAddonInstalledFF():void {
         dispatchEvent(new Event(ADDON_INSTALLED_FF));
      }
      
      public function startTrackpadDrag(cumDeltaX:Number, cumDeltaY:Number, steps:Number):void {
         var sm:ScrollModel = ApplicationManager.getInstance().visualModel.scrollModel;
         var vgraph:IPTVisualGraph = ApplicationManager.getInstance().components.pearlTreeViewer.vgraph;
         sm.handleTrackpadDrag(cumDeltaX, cumDeltaY, steps, vgraph);
      }
      
      public function setisScrollableWindow(isLocked:Boolean):void {
         if(!_isJavascriptInterfaceAvailable) return;
         PTExternalInterface.call("setisScrollableWindow", isLocked);
      }
      
      public function notifyLogin():void {
         if(!_isJavascriptInterfaceAvailable) return;
         PTExternalInterface.call("notifyLogin");
      }
      
      
      public function notifyPearlDeleted(pearl:BroPageNode):void {
         if(!_isJavascriptInterfaceAvailable) return;
         PTExternalInterface.call("notifyPearlDeleted", pearl.refPage.url);      
      }
      
      public function notifyLogout():void {
         if(!_isJavascriptInterfaceAvailable) return;
         PTExternalInterface.call("notifyLogout");
      }
      
      public function detectPearlbar():void {
         if(!_isJavascriptInterfaceAvailable) return;
         PTExternalInterface.call("detectPearlbar");
      }
      
      public function changeParentUrl(parentUrl:String):void {
         if(!_isJavascriptInterfaceAvailable) return;
         PTExternalInterface.call("changeParentUrl", parentUrl);
      }
      
      public function getWebSiteUrl():String {
         if(!_isJavascriptInterfaceAvailable) return null;
         return PTExternalInterface.call("getWebSiteUrl");
      }
      
      public function getStaticContentUrl():String {
         if(!_isJavascriptInterfaceAvailable) return null;
         return PTExternalInterface.call("getStaticContentUrl");
      }
      
      public function getLogoUrl():String {
         if(!_isJavascriptInterfaceAvailable) return null;
         return PTExternalInterface.call("getLogoUrl");
      }
      
      public function getThumbLogoUrl():String {
         if(!_isJavascriptInterfaceAvailable) return null;
         return PTExternalInterface.call("getThumbLogoUrl");
      }
      
      public function getScrapLogoUrl():String {
         if(!_isJavascriptInterfaceAvailable) return null;
         return PTExternalInterface.call("getScrapLogoUrl");
      }
      
      public function getMetaLogoUrl():String {
         if(!_isJavascriptInterfaceAvailable) return null;
         return PTExternalInterface.call("getMetaLogoUrl");
      }
      
      public function getPromoUrl():String {
         if(!_isJavascriptInterfaceAvailable) return null;
         return PTExternalInterface.call("getPromoUrl");
      }
      
      public function getAvatarUrl():String {
         if(!_isJavascriptInterfaceAvailable) return null;
         return PTExternalInterface.call("getAvatarUrl");
      }
      
      public function getBackgroundUrl():String {
         if(!_isJavascriptInterfaceAvailable) return null;
         return PTExternalInterface.call("getBackgroundUrl");
      }
      
      public function getBiblioUrl():String {
         if(!_isJavascriptInterfaceAvailable) return null;
         return PTExternalInterface.call("getBiblioUrl");
      }
      
      public function getThumbshotUrl():String {
         if(!_isJavascriptInterfaceAvailable) return null;
         return PTExternalInterface.call("getThumbshotUrl");
      }
      
      public function getServicesUrl():String {
         if(!_isJavascriptInterfaceAvailable) return null;
         return PTExternalInterface.call("getServicesUrl");
      }
      
      public function getMediaUrl():String {
         if(!_isJavascriptInterfaceAvailable) return null;
         return PTExternalInterface.call("getMediaUrl");
      }
      
      public function getShortenerDomain():String {
         if(!_isJavascriptInterfaceAvailable) return null;
         return PTExternalInterface.call("getShortenerDomain");
      }
      public function getOrigin():String {
         if(!_isJavascriptInterfaceAvailable) return null;
         return PTExternalInterface.call("getOrigin");
      }
      public function getUserInvitingYou():String {
         if(!_isJavascriptInterfaceAvailable) return null;
         return PTExternalInterface.call("getUserInvitingYou");
      }
      
      public function getLoginUsername():String {
         if(!_isJavascriptInterfaceAvailable) return null;
         var loginUsername:String = PTExternalInterface.call("getLoginUsername");
         if (loginUsername) {
            return loginUsername;
         }
         else {
            return "";
         }
      }
      
      public function getUserName():String {
         if(!_isJavascriptInterfaceAvailable) return null;
         return PTExternalInterface.call("getUserName");
      }
      
      public function getSessionID():String {
         if(!_isJavascriptInterfaceAvailable) return null;
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         return PTExternalInterface.call("getSessionID");
      }
      
      public function hideWaitingPanel():void {
         if(!_isJavascriptInterfaceAvailable) return;
         PTExternalInterface.call("hideWaitingPanel");
      }
      
      public function getLostPasswordToken():String {
         if(!_isJavascriptInterfaceAvailable) return null;
         return PTExternalInterface.call('getLostPasswordToken');
      }
      
      public function getInvitationKey():String {
         if(!_isJavascriptInterfaceAvailable) return null;
         return PTExternalInterface.call("getInvitationKey");
      }
      
      public function getFbRequestId():String {
         if(!_isJavascriptInterfaceAvailable) return null;
         return PTExternalInterface.call("getFbRequestId");
      }
      
      public function getClientLang():String {
         if(!_isJavascriptInterfaceAvailable) return null;
         return PTExternalInterface.call("getClientLang");
      }
      
      public function getClientId():String {
         if(!_isJavascriptInterfaceAvailable) return null;
         return PTExternalInterface.call("getClientId");
      }
      
      public function getStartTime():Number {
         if(!_isJavascriptInterfaceAvailable) return -1;
         return parseInt(PTExternalInterface.call("getStartTime"));
      }
      
      public function getStartupMessage():String {
         if (!_isJavascriptInterfaceAvailable) return null;
         return PTExternalInterface.call("getStartupMessage");
      }
      
      public function hasPromoBigWindow():Boolean {
         return getPromoBigWindow() != EventPromoHelper.NOTHING_TO_DISPLAY && getAdPermission();
      }
      
      public function getPromoBigWindow():Number {
         if (!_isJavascriptInterfaceAvailable) return 0;
         return PTExternalInterface.call("getPromoBigWindow");
      }
      
      public function getAdPermission():Boolean {
         if (!_isJavascriptInterfaceAvailable) return true;
         return PTExternalInterface.call("getAdPermission");
      }
      
      public function getTeaserMode():Number {
         if (!_isJavascriptInterfaceAvailable) return 0;
         return PTExternalInterface.call("getTeaserMode");
      }
      
      public function getAbModel():Number {
         if (!_isJavascriptInterfaceAvailable) return 0;
         return PTExternalInterface.call("getAbModel");
      }
      
      public function getCountryCode():String {
         if (!_isJavascriptInterfaceAvailable) return null;
         return PTExternalInterface.call("getCountryCode");
      }
      
      public function getAddPearlEmail():String {
         if (!_isJavascriptInterfaceAvailable) return null;
         return PTExternalInterface.call("getAddPearlEmail");
      }
      
      public function getPearlWindowStatus():Number {
         if (!_isJavascriptInterfaceAvailable) return 1;
         return PTExternalInterface.call("getPearlWindowStatus");
      }
      
      
      
      
      
      
      public function getArrivalTreeId():Number {
         if (!_isJavascriptInterfaceAvailable) return 0;
         return PTExternalInterface.call("getArrivalTreeId");
      }
      
      public function getBrowserName():String {
         if(!_isJavascriptInterfaceAvailable) return null;
         return PTExternalInterface.call("getBrowserName");
      }
      public function getBrowserVersion():String {
         if(!_isJavascriptInterfaceAvailable) return null;
         return PTExternalInterface.call("getBrowserVersion");
      }
      
      public function getInvitationEmail():String {
         if(!_isJavascriptInterfaceAvailable) return null;
         return PTExternalInterface.call("getInvitationEmail");
      }
      
      public function setWindowStatus(title:String):void {
         if(!_isJavascriptInterfaceAvailable) return;
         PTExternalInterface.call("setStatus", title);
      }
      public function getLocalLastSaveVersion():Number {
         if(!_isJavascriptInterfaceAvailable) return 0;
         return PTExternalInterface.call("getLocalLastSaveDate");
      }
      public function setLocalLastSaveVersion(lastSaveDate:Number):void {
         if(!_isJavascriptInterfaceAvailable) return;
         PTExternalInterface.call("setLocalLastSaveDate", lastSaveDate);
      }
      public function setPlayerMode(mode:int):void { 
         if(!_isJavascriptInterfaceAvailable) return;
         PTExternalInterface.call("setPlayerMode", mode);
      }
      public function getPlayerMode():int {
         if(!_isJavascriptInterfaceAvailable) return 0;
         return PTExternalInterface.call("getPlayerMode");      
      }
      
      public function getStartLocationFromURL():String {
         if(!_isJavascriptInterfaceAvailable) return null;
         return PTExternalInterface.call("getStartLocationFromURL");
      }
      public function testCookieEnabled():Boolean {
         if(!_isJavascriptInterfaceAvailable) return true;
         return (PTExternalInterface.call("testCookieEnabled") != false);
      }
      public function reloadPage():void{
         if(!_isJavascriptInterfaceAvailable) return;
         PTExternalInterface.call("reloadPage");
      }
      
      public function reloadPageWithDelay():void {
         setTimeout(reloadPage, 100);
      }
      
      public function loadPageInIFrame(source:String, isBackward:Boolean=false, skipEffect:Boolean=false):void {
         if(!_isJavascriptInterfaceAvailable) return;
         PTExternalInterface.call("loadIFrame", source, isBackward, skipEffect);
      }
      
      public function clearIFrame():void {
         if(!_isJavascriptInterfaceAvailable) return;
         PTExternalInterface.call("clearIFrame");
      }
      
      public function getPlayerStartUrl():String {
         if(!_isJavascriptInterfaceAvailable) return null;
         return PTExternalInterface.call("getPlayerStartUrl");
      }
      
      public function getUserLang():int {
         var lang:String = PTExternalInterface.call("getUserLang");
         
         if (lang == 'en_US')
            return BroLocale.ENGLISH;
         else if (lang == 'fr_FR')
            return BroLocale.FRENCH;
         else
            return BroLocale.LANG_NOT_DEFINED;
      }
      
      public function openPopup(url:String, width:Number, height:Number):void {
         if (!_isJavascriptInterfaceAvailable) return;
         if (!PTExternalInterface.call("openNewPopup", url, width, height)) {
            
            navigateToURL(new URLRequest(url), "_blank");
         }
      }
      
      public function downloadUrl(url:String):void {
         if (!_isJavascriptInterfaceAvailable) return;
         PTExternalInterface.call("downloadURL", url);
      }
      
      public function refreshFileSelectorInHtml():void {
         if (!_isJavascriptInterfaceAvailable) return;
         PTExternalInterface.call("refreshFileSelectorInHtml");
      }
      
      public function uploadDocument():void {
         if (!_isJavascriptInterfaceAvailable) return;
         PTExternalInterface.call("uploadDocuments");
      }
      
      public function protectUploadFromTabClosing(message:String):void {
         if (!_isJavascriptInterfaceAvailable) return;
         isProtectingUpload = true;
         PTExternalInterface.call("protectTabDuringUpload", message);
      }
      
      public function unprotectUploadFromTabClosing():void {
         if (!_isJavascriptInterfaceAvailable) return;
         isProtectingUpload = false;
         PTExternalInterface.call("unprotectTabAfterUpload");
      }
      
      public function applyUrlIdToUploadingFiles(urlIds:Array):void {
         if (!_isJavascriptInterfaceAvailable) return;
         PTExternalInterface.call("applyUrlIdToUploadingFiles", urlIds);
      }
      
      public function cancelUpload():void {
         if (!_isJavascriptInterfaceAvailable) return;
         PTExternalInterface.call("cancelUpload");
      }
      
      public function openWindow(url:String, target:String):void {
         if (!_isJavascriptInterfaceAvailable) return;
         if (!PTExternalInterface.call("openWindow", url, target)) {
            
            navigateToURL(new URLRequest(url), target);
         }
      }
      
      public function openMonitoredPopup(url:String, width:Number, height:Number):void {
         if (!_isJavascriptInterfaceAvailable) return;
         if (!PTExternalInterface.call("openMonitoredPopup", url, width, height)) {
            
            navigateToURL(new URLRequest(url), "_blank");
         }
      }
      
      public function closeMonitoredPopup():void {
         if(!_isJavascriptInterfaceAvailable) return;
         PTExternalInterface.call("closeMonitoredPopup");
      }
      
      private function onMonitoredPopupClose():void {
         dispatchEvent(new Event(MONITORED_POPUP_CLOSED));
      }
      
      public function getMonitoredPopupAnswer():String {
         return PTExternalInterface.call("getMonitoredPopupAnswer");
      }
      
      public function openAlert(message: String): void {
         PTExternalInterface.call("openAlert", message);
      }
      
      public function openBookmarkletInstallPopup():void {
         var popupUrl:String;
         
         if (BroLocale.languageIsFrench()) {
            popupUrl = ApplicationManager.getInstance().getServicesUrl() + "collectorbookmark/download?l=fr";
         } else {
            popupUrl = ApplicationManager.getInstance().getServicesUrl() + "collectorbookmark/download?l=en";
         }
         openPopup(popupUrl, 610, 457);
      }
      
      public function loadPageInCache(url:String, keepUrl:Boolean = false):String{
         return PTExternalInterface.call("loadPageInCache", url, keepUrl);
      }
      
      public function removePageInCache(id:String):void {
         PTExternalInterface.call("removePageInCache", id);
      }
      public function onPageInCacheLoaded(id:String):void {
         ApplicationManager.getInstance().remoteResourceManagers.loadingManager.onPageInCacheLoaded(id);
      }
      public function onBrowserIFrameLoaded(src:String):void {
         if (src != PlayerUtils.BLANK_SOURCE) {
            ApplicationManager.getInstance().remoteResourceManagers.loadingManager.onBrowserIFrameLoaded(src);
         }
      }
      
      public function notifyNewAccountCreated(userId:int):void {
         if(!_isJavascriptInterfaceAvailable) return;
         PTExternalInterface.call("notifyNewAccountCreated", userId);
      }
      
      
      public function notifyUserHasDockedPearlWindow(userId:int):void {
         if(!_isJavascriptInterfaceAvailable) return;
         PTExternalInterface.call("notifyUserHasDockedPearlWindow", userId);         
      }
      
      public function notifyLoadingEnd():void {}
      public function savePotentialBadFrameId(pearlId:Number):void {
         if(!_isJavascriptInterfaceAvailable) return;
         PTExternalInterface.call("savePotentialBadFrameId", pearlId);
      }
      public function getUserId():String {
         if(!_isJavascriptInterfaceAvailable) return null;
         return PTExternalInterface.call("getUserId");
      }
      
      
      public function openFacepile(z_index:int, banner_width:int, offset_x:int, offset_y:int, width:int, height: int, url:String) : void {
         if(!_isJavascriptInterfaceAvailable) return;
         PTExternalInterface.call("openFacepile", z_index, banner_width, offset_x, offset_y, width, height, url);
      }
      public function resizeFacepile(z_index:int, banner_width:int, offset_x:int, offset_y:int, width:int, height: int) : void {
         if(!_isJavascriptInterfaceAvailable) return;
         PTExternalInterface.call("resizeFacepile", z_index, banner_width, offset_x, offset_y, width, height);
      }
      public function closeFacepile():void {
         if(!_isJavascriptInterfaceAvailable) return;
         PTExternalInterface.call("closeFacepile");
      }
      
      public function isFileApiSupported():Boolean {
         if(!_isJavascriptInterfaceAvailable) return false;
         return PTExternalInterface.call("isFileApiSupported");
      }
      
      public function getOSName():String {
         if(!_isJavascriptInterfaceAvailable) return OS_WINDOWS;
         return PTExternalInterface.call("getOSName");
      }
      
      public function isUsingMac():Boolean {
         return getOSName() == OS_MAC;
      }
      
      
      public function updateFacebookToken(updateUrl:String):void {
         PTExternalInterface.call("updateFacebookToken", updateUrl);
      }
      
      public function getFacebookId():String {
         return PTExternalInterface.call("getFacebookId");
      }
      
      public function getFacebookIdIsLoading():Boolean {
         var isLoading:String = PTExternalInterface.call("getFacebookIdIsLoading");
         if (isLoading == 'true') {
            return true;
         }
         return false;
      }
      
      private function onIFrameFilled():void {
         dispatchEvent(new Event(IFRAME_FILLED));
      }
      
      private function onFacebookIdLoaded():void {
         dispatchEvent(new Event(FACEBOOK_ID_LOADED));
      }
      
      private function onSendPageViewStat():void {
         var am:ApplicationManager = ApplicationManager.getInstance();
         if(!am.isManagerInitialized) {
            return;
         }
         
         if(_lastPageViewSent == -1) {
            _lastPageViewSent = StartPolicyLogger.getInstance().getHtmlContainerLoadedTime();
            if(_lastPageViewSent <= 0) {
               _lastPageViewSent = new Date().getTime();
            }
         }
         var curTime:Number = new Date().getTime();
         var timePassed:Number = curTime - _lastPageViewSent;
         if(timePassed < 1800000 && timePassed > 200) { 
            _viewCount++;
            
         }
         _lastPageViewSent = curTime;
      }
      
      public function getLocationName():String {
         if(!_isJavascriptInterfaceAvailable) return null;
         var locationName:String = PTExternalInterface.call("getLocationName");
         if (locationName) {
            return locationName;
         } 
         else {
            return "";
         }
         
      }
      
      public function getBackgroundHash():String {
         if(!_isJavascriptInterfaceAvailable) return null;
         var locationName:String = PTExternalInterface.call("getBackgroundHash");
         if (locationName) {
            return locationName;
         } 
         else {
            return "";
         }
      }
      
      public function get isProtectingUpload():Boolean
      {
         return _isProtectingUpload;
      }
      
      public function set isProtectingUpload(value:Boolean):void
      {
         _isProtectingUpload = value;
      }
      
      public function listenToFireFoxAddonInstallation():void {
         if(!_isJavascriptInterfaceAvailable) return;
         PTExternalInterface.call("listenToFireFoxAddonInstallation");
      }
      
   }
}
