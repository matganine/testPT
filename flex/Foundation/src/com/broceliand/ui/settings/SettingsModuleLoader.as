package com.broceliand.ui.settings {
import com.broceliand.ApplicationManager;
import com.broceliand.pearlTree.navigation.NavigationEvent;
import com.broceliand.pearlTree.navigation.impl.ApplicationDisplayedPageModel;
import com.broceliand.util.BroLocale;
import com.broceliand.util.UrlNavigationController;
import com.broceliand.util.error.ErrorConst;

import mx.events.ModuleEvent;
import mx.modules.ModuleLoader;

public class SettingsModuleLoader extends ModuleLoader implements ISettings {

   private static const MODULE_RELATIVE_PATH:String = "com/broceliand/ui/settings/SettingsModule.swf";

   private static const DEFAULT_PANEL:uint = 1;
   private static const MAX_PANEL_INDEX:uint = 7;

   private static const ACCOUNT_PANEL:uint = 0;
   private static const IDENTITY:uint = 1;
   private static const LOST_PASSWORD_PANEL:uint = 2;
   private static const NOTIFICATIONS_PANEL:uint = 3;
   private static const IMPORT_PANEL:uint = 4;
   private static const EXPORT_PANEL:uint = 5;

   private var _moduleURL:String;
   private var _isLoaded:Boolean;
   private var _panelToShowOnLoad:uint = DEFAULT_PANEL;

   public function SettingsModuleLoader() {
      super();
      super.visible = false;
      addEventListener(ModuleEvent.READY, onReady);
      addEventListener(ModuleEvent.ERROR, onError);
      percentWidth = 100;
      percentHeight = 100;
      
      var am:ApplicationManager = ApplicationManager.getInstance();
      var swfUrl:String = ApplicationManager.flexApplication.url;
      
      if(swfUrl.indexOf("file://") != -1) {
         _moduleURL = MODULE_RELATIVE_PATH+"?"+am.getAppVersion();
      }else{
         var siteURL:String = ApplicationManager.getInstance().getStaticContentUrl();
         _moduleURL = siteURL+MODULE_RELATIVE_PATH+"?"+am.getAppVersion();
      }
   }

   private function onReady(event:ModuleEvent):void {
      var am:ApplicationManager = ApplicationManager.getInstance();
      am.components.mainPanel.installComponent(this);
      am.visualModel.mouseManager.showBusy(false);
      _isLoaded = true;
      if(_panelToShowOnLoad > MAX_PANEL_INDEX) {
         _panelToShowOnLoad = DEFAULT_PANEL;
      }

      if(_panelToShowOnLoad == IDENTITY) {
         showIdentityForm();
      }
      else if(_panelToShowOnLoad == LOST_PASSWORD_PANEL) {
         showLostpasswordForm();
      }
      else if(_panelToShowOnLoad == NOTIFICATIONS_PANEL) {
         showNotificationsForm();
      }
      else if(_panelToShowOnLoad == ACCOUNT_PANEL) {
         showAccountForm();
      }
      else if(_panelToShowOnLoad == EXPORT_PANEL) {
         showExportForm();
      }
   }
   private function onError(event:ModuleEvent):void {
      var am:ApplicationManager = ApplicationManager.getInstance();
      am.visualModel.mouseManager.showBusy(false);
      am.errorReporter.onError(ErrorConst.ERROR_LOADING_SETTINGS_MODULE, event.errorText);
   }

   public function loadSettings():void {
      var am:ApplicationManager = ApplicationManager.getInstance();
      if(!url) {
         url = _moduleURL;
         am.visualModel.mouseManager.showBusy(true);
      }
      applicationDomain = am.applicationDomain;
      loadModule();
   }
   public function unloadSettings():void {
      unloadModule();
      _isLoaded = false;
   }
   private function get settingsModule():ISettings {
      return child as ISettings;
   }

   override public function set visible(value:Boolean):void {
      if(value != super.visible) {
         var am:ApplicationManager = ApplicationManager.getInstance();
         if(value) {
            if(!_isLoaded) {
               loadSettings();
            }
            super.visible = true;
            am.components.pearlTreeViewer.setActive(false);
            UrlNavigationController.setBrowserTitle(" • "+BroLocale.getInstance().getText('menu.action.settingsTitle'));
         }
         else{
            
            
            super.visible = false;
            if (ApplicationManager.getInstance().visualModel.navigationModel.getPlayState() != NavigationEvent.PLAY_STATE_SCREEN) {
               am.components.pearlTreeViewer.setActive(true);
            }
            UrlNavigationController.setBrowserTitle();
         }
         var applicationDisplayedPageModel:ApplicationDisplayedPageModel = am.visualModel.navigationModel.getApplicationDisplayedPageModel();
         applicationDisplayedPageModel.setPageDisplayedState(ApplicationDisplayedPageModel.SETTINGS_PAGE, value);
      }
   }

   public function showIdentityForm():void {
      if(_isLoaded && settingsModule) {
         visible = true;
         settingsModule.showIdentityForm();
      }
      else {
         _panelToShowOnLoad = IDENTITY;
         loadSettings();
      }
   }

   public function showLostpasswordForm():void {
      if(_isLoaded && settingsModule) {
         visible = true;
         settingsModule.showLostpasswordForm();
      }
      else {
         _panelToShowOnLoad = LOST_PASSWORD_PANEL;
         loadSettings();
      }
   }

   public function showNotificationsForm():void {
      if(_isLoaded && settingsModule) {
         visible = true;
         settingsModule.showNotificationsForm();
      }
      else {
         _panelToShowOnLoad = NOTIFICATIONS_PANEL;
         loadSettings();
      }
   }

   public function showAccountForm():void {
      if(_isLoaded && settingsModule) {
         visible = true;
         settingsModule.showAccountForm();
      }
      else{
         _panelToShowOnLoad = ACCOUNT_PANEL;
         loadSettings();
      }
   }

   public function showExportForm():void {
      if(_isLoaded && settingsModule) {
         visible = true;
         settingsModule.showExportForm();
      }
      else{
         _panelToShowOnLoad = EXPORT_PANEL;
         loadSettings();
      }
   }
}
}