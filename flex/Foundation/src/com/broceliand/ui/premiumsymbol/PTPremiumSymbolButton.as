package com.broceliand.ui.premiumsymbol
{
import com.broceliand.ApplicationManager;
import com.broceliand.assets.NavBarAssets;
import com.broceliand.assets.PremiumSymbolAssets;
import com.broceliand.ui.button.PTButton;
import com.broceliand.ui.pearlWindow.PremiumWindowHelper;
import com.broceliand.ui.util.AssetsManager;
import com.broceliand.util.BroLocale;

import flash.events.Event;
import flash.events.MouseEvent;

public class PTPremiumSymbolButton extends PTButton {
   
   public static const SKIN_SMALL:uint = 0;
   public static const SKIN_MEDIUM:uint = 1;
   public static const SKIN_BIG:uint = 2;
   public static const SKIN_SMALL_BLUE:uint = 3;
   public static const SKIN_MEDIUM_BLUE:uint = 4;
   public static const SKIN_NAVBAR:uint = 5;
   
   private var _skin:uint;
   private var _clickable:Boolean;
   private var _withOver:Boolean;
   private var _neverVisible:Boolean;

   public function refreshSkin():void {
      if (skin == SKIN_SMALL_BLUE) {
         setStyle('upSkin', AssetsManager.getEmbededAsset(PremiumSymbolAssets.SMALL));
         setStyle('disabledSkin', AssetsManager.getEmbededAsset(PremiumSymbolAssets.SMALL));
         setStyle('overSkin', AssetsManager.getEmbededAsset(PremiumSymbolAssets.SMALL_BLUE));
         setStyle('downSkin', AssetsManager.getEmbededAsset(PremiumSymbolAssets.SMALL_BLUE));
         width = 16;
         height = 14;
      } else if (skin == SKIN_NAVBAR) {
         setStyle('upSkin', AssetsManager.getEmbededAsset(NavBarAssets.PREMIUM_NAVBAR));
         setStyle('disabledSkin', AssetsManager.getEmbededAsset(PremiumSymbolAssets.SMALL));
         setStyle('overSkin', AssetsManager.getEmbededAsset(NavBarAssets.PREMIUM_NAVBAR_OVER));
         setStyle('downSkin', AssetsManager.getEmbededAsset(NavBarAssets.PREMIUM_NAVBAR_OVER));
         width = 29;
         height = 29;
      } else if (skin == SKIN_SMALL) {
         setStyle('upSkin', AssetsManager.getEmbededAsset(PremiumSymbolAssets.SMALL));
         setStyle('disabledSkin', AssetsManager.getEmbededAsset(PremiumSymbolAssets.SMALL));
         setStyle('overSkin', (withOver) ? AssetsManager.getEmbededAsset(PremiumSymbolAssets.SMALL_OVER) : AssetsManager.getEmbededAsset(PremiumSymbolAssets.SMALL));
         setStyle('downSkin', (clickable) ? AssetsManager.getEmbededAsset(PremiumSymbolAssets.SMALL_OVER) : AssetsManager.getEmbededAsset(PremiumSymbolAssets.SMALL));
         width = 16;
         height = 14;
      } else if (skin == SKIN_MEDIUM) {
         setStyle('upSkin', AssetsManager.getEmbededAsset(PremiumSymbolAssets.MEDIUM));
         setStyle('disabledSkin', AssetsManager.getEmbededAsset(PremiumSymbolAssets.MEDIUM));
         setStyle('overSkin', (withOver) ? AssetsManager.getEmbededAsset(PremiumSymbolAssets.MEDIUM_OVER) : AssetsManager.getEmbededAsset(PremiumSymbolAssets.MEDIUM));
         setStyle('downSkin', (clickable) ? AssetsManager.getEmbededAsset(PremiumSymbolAssets.MEDIUM_OVER) : AssetsManager.getEmbededAsset(PremiumSymbolAssets.MEDIUM));
         width = height = 20;
      } else if (skin == SKIN_MEDIUM_BLUE) {
         setStyle('upSkin', AssetsManager.getEmbededAsset(PremiumSymbolAssets.MEDIUM));
         setStyle('disabledSkin', AssetsManager.getEmbededAsset(PremiumSymbolAssets.MEDIUM));
         setStyle('overSkin', AssetsManager.getEmbededAsset(PremiumSymbolAssets.MEDIUM_BLUE));
         setStyle('downSkin', AssetsManager.getEmbededAsset(PremiumSymbolAssets.MEDIUM_BLUE));
         width = height = 20;
      } else if (skin == SKIN_BIG) {
         setStyle('upSkin', AssetsManager.getEmbededAsset(PremiumSymbolAssets.MEDIUM));
         setStyle('disabledSkin', AssetsManager.getEmbededAsset(PremiumSymbolAssets.MEDIUM));
         setStyle('overSkin', (withOver) ? AssetsManager.getEmbededAsset(PremiumSymbolAssets.MEDIUM_OVER) : AssetsManager.getEmbededAsset(PremiumSymbolAssets.MEDIUM));
         setStyle('downSkin', (clickable) ? AssetsManager.getEmbededAsset(PremiumSymbolAssets.MEDIUM_OVER) : AssetsManager.getEmbededAsset(PremiumSymbolAssets.MEDIUM));
         width = height = 20;
      }
      if (clickable) {
         addEventListener(MouseEvent.MOUSE_DOWN, onClick);
      } else {
         removeEventListener(MouseEvent.MOUSE_DOWN, onClick);
      }
   }
   
   public function get withOver():Boolean {
      return _withOver;
   }
   
   public function set withOver(value:Boolean):void {
      if (_withOver != value) {
         _withOver = value;
         refreshSkin();
      }
   }
   
   public function get clickable():Boolean {
      return _clickable;
   }
   
   public function set clickable(value:Boolean):void {
      if (_clickable != value) {
         _clickable = value;
         refreshSkin();
      }
   }
   
   public function get skin():uint {
      return _skin;
   }
   
   public function set skin(value:uint):void {
      if (_skin != value) {
         _skin = value;
         refreshSkin();
      }
   }
   
   public function onClick(event:Event):void {
      event.stopPropagation();
      PremiumWindowHelper.openPaymentPage(PremiumWindowHelper.PREMIUM_ORIGIN_SYMBOL);
   }
}
}