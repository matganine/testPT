package com.broceliand.pearlTree.model {
   import com.broceliand.util.externalServices.FacebookAuthenticationState;
   
   public class UserSettings {
      public static const PEARLBAR_TYPE_NONE:uint = 0;
      public static const PEARLBAR_TYPE_FIREFOX:uint = 1;
      public static const PEARLBAR_TYPE_EXPLORER:uint = 2;
      public static const PEARLBAR_TYPE_CHROME:uint = 3;
      public static const PEARLBAR_TYPE_AMO:uint = 4;
      public static const PEARLBAR_TYPE_BOOKMARKLET:uint = 5;
      public static const PEARLBAR_TYPE_SAFARI:uint = 6;
      
      public static const MAIL_PREFERENCE_NOTHING:uint=0;
      public static const MAIL_PREFERENCE_ALL:uint=1;
      public static const MAIL_PREFERENCE_LIMITED:uint=2;
      
      public static const MAIL_SUBSCRIBE:uint = 0;
      public static const MAIL_UNSUBSCRIBE:uint = 1;
      
      public static const TWITTER_NOT_AUTHENTICATED:int = 0;
      public static const TWITTER_AUTHENTICATED:int = 1;
      public static const TWITTER_INVALID_AUTHENTICATION:int = 2;
      
      public static const AUTOPEARL_UNDEFINED:int = 0;
      public static const AUTOPEARL_DISABLED:int = 1;
      public static const AUTOPEARL_ENABLED:int = 2;
      
      public static const AUTOSHARE_DISABLED:int = 0;
      public static const AUTOSHARE_NEW_AND_UPADTED_TREES:int = 1;
      public static const AUTOSHARE_NEW_PEARLS:int = 2;
      public static const AUTOSHARE_ALL:int = 3;
      
      public static const AUTOACTION_DISABLED:int = 0;
      
      public static const LOGIN_DISABLED:int = 0;
      public static const LOGIN_ENABLED:int = 1;
      
      public static const ORGANIZE_PREF_NORMAL:int = 0;
      public static const ORGANIZE_PREF_LESS:int = 1;
      
      public static const PW_IS_DOCKED:int = 0;
      public static const PW_IS_UNDOCKED:int = 1;
      
      public var userId:int;
      public var userDb:int;
      
      public var email:String;
      public var password:String;
      public var savingError:String;
      public var lostPasswordToken:String;
      public var mailPreferenceCross:int;
      public var mailPreferenceTeam:int;
      public var mailPreferenceMessage:int;
      public var mailPreferenceNote:int;
      public var mailPreferencePrivateMsg:int;
      public var twitterAutopearlState:int;
      public var autoTwittState:int;
      public var twitterAuthenticationState:int;
      public var facebookAutopearlState:int;
      public var autoPostFbState:int;
      public var autoActionFbState:int;
      public var facebookIdKey:String;
      public var facebookAuthenticationState:int;
      public var newsletter:int;
      public var oldPassword:String; 
      public var newUsername:String;
      public var organize:int;
      public var socialShareInterval:Number;
      public var dockStateForPW:int;
      public var welcomeTips:int;
      public var whiteMark:int;
      
      
      public var twitterLogin:int; 
      public var facebookLogin:int;
      
      
      public var location:String;
      public var realname:String;
      public var website:String;
      public var bio:String;
      public var pearlbarType:uint;
      public var creationDate:Number;
      public var locale:int;
      
      
      public var needsRefresh:Boolean = false;
      
      public function isPearlbarInstalled():Boolean {
         return (pearlbarType && pearlbarType != PEARLBAR_TYPE_NONE);
      }
      
      public static function isAutoShareNewAndUpdatedTreeEnabled(value:int):Boolean {
         if ((value & AUTOSHARE_NEW_AND_UPADTED_TREES) == AUTOSHARE_NEW_AND_UPADTED_TREES) {
            return true;
         }
         return false;
      }
      
      public static function isAutoShareNewPearlsEnabled(value:int):Boolean {
         if ((value & AUTOSHARE_NEW_PEARLS) == AUTOSHARE_NEW_PEARLS) {
            return true;
         }
         return false;
      }
      
      public function needConnectIncentive():Boolean {
         return !(twitterAuthenticationState == UserSettings.TWITTER_AUTHENTICATED
            && (UserSettings.isAutoShareNewPearlsEnabled(autoTwittState)
               || UserSettings.isAutoShareNewAndUpdatedTreeEnabled(autoTwittState)
               || twitterAutopearlState == UserSettings.AUTOPEARL_ENABLED)
            || FacebookAuthenticationState.isAuthForThisBitField(facebookAuthenticationState, FacebookAuthenticationState.AUTH_ALL)
            && (UserSettings.isAutoShareNewPearlsEnabled(autoPostFbState)
               || UserSettings.isAutoShareNewAndUpdatedTreeEnabled(autoPostFbState)
               || facebookAutopearlState == UserSettings.AUTOPEARL_ENABLED));
      }
      
      public static function changeAutoShareState(originalValue:int, changingValue:int, add:Boolean):int {
         if (add) {
            return (originalValue | changingValue);
         }
         else {
            return (originalValue & (changingValue ^ AUTOSHARE_ALL));
         }
      }
      
      public function isPearlWindowDockedOnInit():Boolean {
         return (dockStateForPW == UserSettings.PW_IS_DOCKED);
      }
      
      
      public static function changeAutoActionFbState(originalValue:int, changingValue:int):int {
         return originalValue;
      }
   }
}