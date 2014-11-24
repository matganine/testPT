package com.broceliand.pearlTree.model.premium
{
import flash.events.Event;
import flash.events.EventDispatcher;

public class PremiumRightManager extends EventDispatcher {
   
   public static const PREMIUM_RIGHTS_EVENT:String  = "premiumEvent";
   
   private static const PREMIUM_TYPE_NONE:int = 0;
   private static const PREMIUM_TYPE_FORMER_PREMIUM:int = 1;    
   private static const PREMIUM_TYPE_PREMIUM_PERMANENT:int = 2;
   private static const PREMIUM_TYPE_PREMIUM_TEMPORARY:int = 3;    
   
   private var _isPremium:int = 0; 
   private var _premiumStatus:int = 0; 
   private var _premiumLevel:int = 0; 
   
   public function PremiumRightManager() {
   }

   public function get isPremium():int {
      return _isPremium;
   }
   public function set isPremium(value:int):void {
      if (value != _isPremium) {
         _isPremium = value;
         dispatchPremiumEvent();
      }
   }

   public function get premiumLevel():int {
      return _premiumLevel;
   }
   public function set premiumLevel(value:int):void {
      if (value != _premiumLevel) {
         _premiumLevel = value;
         dispatchPremiumEvent();
      }
   }

   public function get premiumStatus():int {
      return _premiumStatus;
   }
   public function set premiumStatus(value:int):void {
      if (value != _premiumStatus) {
         _isPremium = (value == PREMIUM_TYPE_PREMIUM_PERMANENT) || (value == PREMIUM_TYPE_PREMIUM_TEMPORARY) ? 1 : 0;
         _premiumStatus = value;
         dispatchPremiumEvent();
      }
   }
 
   public function isBronzePremiumFeatureAuthorized():Boolean {
      return _isPremium > 0;
   }
   
   public function isSilverPremiumFeatureAuthorized():Boolean {
      if (isPremium == 0) {
         return false;
      }
      else return _premiumLevel >=2;
   }
   
   public function isGoldPremium():Boolean {
      return _premiumLevel == 3;
   }
   
   protected function dispatchPremiumEvent():void {
      dispatchEvent(new Event(PREMIUM_RIGHTS_EVENT));
   }
}
}