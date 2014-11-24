package com.broceliand.pearlTree.io.object.user {

import com.broceliand.pearlTree.io.object.user.UserData;
import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="UserPreference")]
public class UserPreferenceData implements IExternalizable {

private var _userId:int;
private var _user:com.broceliand.pearlTree.io.object.user.UserData;
private var _mailBlockCross:int;
private var _mailBlockTeam:int;
private var _mailBlockMessage:int;
private var _mailBlockNote:int;
private var _mailBlockPrivateMsg:int;
private var _twitterAutopearlState:int;
private var _facebookAutopearlState:int;
private var _autoTwittState:int;
private var _autoPostFbState:int;
private var _twitterAuthenticationState:int;
private var _newsletter:int;
private var _facebookIdKey:String;
private var _autoActionFbState:int;
private var _facebookAuthenticationState:int;
private var _organize:int;
private var _email:String;
private var _savingError:String;
private var _password:String;
private var _oldPassword:String;
private var _lostPasswordToken:String;
private var _changedUsername:String;
private var _pearlbarType:int;
private var _twitterLogin:int;
private var _facebookLogin:int;
private var _socialShareInterval:int;
private var _welcomeTips:int;
private var _reactivationMail:int;
private var _connectionMail:int;
private var _promoMail:int;
private var _reminderMail:int;
private var _gaugeMail:int;
private var _whiteMark:int;
private var _isPWDockedOnWeb:int;

public function get userId():int { return _userId; }
public function set userId(value:int):void { _userId = value; }
public function get user():com.broceliand.pearlTree.io.object.user.UserData { return _user; }
public function set user(value:com.broceliand.pearlTree.io.object.user.UserData):void { _user = value; }
public function get mailBlockCross():int { return _mailBlockCross; }
public function set mailBlockCross(value:int):void { _mailBlockCross = value; }
public function get mailBlockTeam():int { return _mailBlockTeam; }
public function set mailBlockTeam(value:int):void { _mailBlockTeam = value; }
public function get mailBlockMessage():int { return _mailBlockMessage; }
public function set mailBlockMessage(value:int):void { _mailBlockMessage = value; }
public function get mailBlockNote():int { return _mailBlockNote; }
public function set mailBlockNote(value:int):void { _mailBlockNote = value; }
public function get mailBlockPrivateMsg():int { return _mailBlockPrivateMsg; }
public function set mailBlockPrivateMsg(value:int):void { _mailBlockPrivateMsg = value; }
public function get twitterAutopearlState():int { return _twitterAutopearlState; }
public function set twitterAutopearlState(value:int):void { _twitterAutopearlState = value; }
public function get facebookAutopearlState():int { return _facebookAutopearlState; }
public function set facebookAutopearlState(value:int):void { _facebookAutopearlState = value; }
public function get autoTwittState():int { return _autoTwittState; }
public function set autoTwittState(value:int):void { _autoTwittState = value; }
public function get autoPostFbState():int { return _autoPostFbState; }
public function set autoPostFbState(value:int):void { _autoPostFbState = value; }
public function get twitterAuthenticationState():int { return _twitterAuthenticationState; }
public function set twitterAuthenticationState(value:int):void { _twitterAuthenticationState = value; }
public function get newsletter():int { return _newsletter; }
public function set newsletter(value:int):void { _newsletter = value; }
public function get facebookIdKey():String { return _facebookIdKey; }
public function set facebookIdKey(value:String):void { _facebookIdKey = value; }
public function get autoActionFbState():int { return _autoActionFbState; }
public function set autoActionFbState(value:int):void { _autoActionFbState = value; }
public function get facebookAuthenticationState():int { return _facebookAuthenticationState; }
public function set facebookAuthenticationState(value:int):void { _facebookAuthenticationState = value; }
public function get organize():int { return _organize; }
public function set organize(value:int):void { _organize = value; }
public function get email():String { return _email; }
public function set email(value:String):void { _email = value; }
public function get savingError():String { return _savingError; }
public function set savingError(value:String):void { _savingError = value; }
public function get password():String { return _password; }
public function set password(value:String):void { _password = value; }
public function get oldPassword():String { return _oldPassword; }
public function set oldPassword(value:String):void { _oldPassword = value; }
public function get lostPasswordToken():String { return _lostPasswordToken; }
public function set lostPasswordToken(value:String):void { _lostPasswordToken = value; }
public function get changedUsername():String { return _changedUsername; }
public function set changedUsername(value:String):void { _changedUsername = value; }
public function get pearlbarType():int { return _pearlbarType; }
public function set pearlbarType(value:int):void { _pearlbarType = value; }
public function get twitterLogin():int { return _twitterLogin; }
public function set twitterLogin(value:int):void { _twitterLogin = value; }
public function get facebookLogin():int { return _facebookLogin; }
public function set facebookLogin(value:int):void { _facebookLogin = value; }
public function get socialShareInterval():int { return _socialShareInterval; }
public function set socialShareInterval(value:int):void { _socialShareInterval = value; }
public function get welcomeTips():int { return _welcomeTips; }
public function set welcomeTips(value:int):void { _welcomeTips = value; }
public function get reactivationMail():int { return _reactivationMail; }
public function set reactivationMail(value:int):void { _reactivationMail = value; }
public function get connectionMail():int { return _connectionMail; }
public function set connectionMail(value:int):void { _connectionMail = value; }
public function get promoMail():int { return _promoMail; }
public function set promoMail(value:int):void { _promoMail = value; }
public function get reminderMail():int { return _reminderMail; }
public function set reminderMail(value:int):void { _reminderMail = value; }
public function get gaugeMail():int { return _gaugeMail; }
public function set gaugeMail(value:int):void { _gaugeMail = value; }
public function get whiteMark():int { return _whiteMark; }
public function set whiteMark(value:int):void { _whiteMark = value; }
public function get isPWDockedOnWeb():int { return _isPWDockedOnWeb; }
public function set isPWDockedOnWeb(value:int):void { _isPWDockedOnWeb = value; }

public function readExternal(input:IDataInput):void {
userId = input.readInt();
user = input.readObject() as com.broceliand.pearlTree.io.object.user.UserData;
mailBlockCross = input.readInt();
mailBlockTeam = input.readInt();
mailBlockMessage = input.readInt();
mailBlockNote = input.readInt();
mailBlockPrivateMsg = input.readInt();
twitterAutopearlState = input.readInt();
facebookAutopearlState = input.readInt();
autoTwittState = input.readInt();
autoPostFbState = input.readInt();
twitterAuthenticationState = input.readInt();
newsletter = input.readInt();
facebookIdKey = input.readObject() as String;
autoActionFbState = input.readInt();
facebookAuthenticationState = input.readInt();
organize = input.readInt();
email = input.readObject() as String;
savingError = input.readObject() as String;
password = input.readObject() as String;
oldPassword = input.readObject() as String;
lostPasswordToken = input.readObject() as String;
changedUsername = input.readObject() as String;
pearlbarType = input.readInt();
twitterLogin = input.readInt();
facebookLogin = input.readInt();
socialShareInterval = input.readInt();
welcomeTips = input.readInt();
reactivationMail = input.readInt();
connectionMail = input.readInt();
promoMail = input.readInt();
reminderMail = input.readInt();
gaugeMail = input.readInt();
whiteMark = input.readInt();
isPWDockedOnWeb = input.readInt();
}

public function writeExternal(output:IDataOutput):void {
output.writeInt(userId);
output.writeObject(user);
output.writeInt(mailBlockCross);
output.writeInt(mailBlockTeam);
output.writeInt(mailBlockMessage);
output.writeInt(mailBlockNote);
output.writeInt(mailBlockPrivateMsg);
output.writeInt(twitterAutopearlState);
output.writeInt(facebookAutopearlState);
output.writeInt(autoTwittState);
output.writeInt(autoPostFbState);
output.writeInt(twitterAuthenticationState);
output.writeInt(newsletter);
output.writeObject(facebookIdKey);
output.writeInt(autoActionFbState);
output.writeInt(facebookAuthenticationState);
output.writeInt(organize);
output.writeObject(email);
output.writeObject(savingError);
output.writeObject(password);
output.writeObject(oldPassword);
output.writeObject(lostPasswordToken);
output.writeObject(changedUsername);
output.writeInt(pearlbarType);
output.writeInt(twitterLogin);
output.writeInt(facebookLogin);
output.writeInt(socialShareInterval);
output.writeInt(welcomeTips);
output.writeInt(reactivationMail);
output.writeInt(connectionMail);
output.writeInt(promoMail);
output.writeInt(reminderMail);
output.writeInt(gaugeMail);
output.writeInt(whiteMark);
output.writeInt(isPWDockedOnWeb);
}
}
}
