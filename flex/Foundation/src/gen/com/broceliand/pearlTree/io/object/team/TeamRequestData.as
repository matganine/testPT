package com.broceliand.pearlTree.io.object.team {

import com.broceliand.pearlTree.io.object.tree.PearlData;
import com.broceliand.pearlTree.io.object.user.UserData;
import com.broceliand.pearlTree.io.object.user.UserData;
import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="TeamRequest")]
public class TeamRequestData implements IExternalizable {

private var _requestId:int;
private var _aliasId:int;
private var _alias:com.broceliand.pearlTree.io.object.tree.PearlData;
private var _originalGuestAssoId:int;
private var _originalHostAssoId:int;
private var _targetAssoId:int;
private var _type:int;
private var _status:int;
private var _guestUserId:int;
private var _guestUser:com.broceliand.pearlTree.io.object.user.UserData;
private var _hostUserId:int;
private var _hostUser:com.broceliand.pearlTree.io.object.user.UserData;
private var _lastStatusChange:Number;
private var _message:String;

public function get requestId():int { return _requestId; }
public function set requestId(value:int):void { _requestId = value; }
public function get aliasId():int { return _aliasId; }
public function set aliasId(value:int):void { _aliasId = value; }
public function get alias():com.broceliand.pearlTree.io.object.tree.PearlData { return _alias; }
public function set alias(value:com.broceliand.pearlTree.io.object.tree.PearlData):void { _alias = value; }
public function get originalGuestAssoId():int { return _originalGuestAssoId; }
public function set originalGuestAssoId(value:int):void { _originalGuestAssoId = value; }
public function get originalHostAssoId():int { return _originalHostAssoId; }
public function set originalHostAssoId(value:int):void { _originalHostAssoId = value; }
public function get targetAssoId():int { return _targetAssoId; }
public function set targetAssoId(value:int):void { _targetAssoId = value; }
public function get type():int { return _type; }
public function set type(value:int):void { _type = value; }
public function get status():int { return _status; }
public function set status(value:int):void { _status = value; }
public function get guestUserId():int { return _guestUserId; }
public function set guestUserId(value:int):void { _guestUserId = value; }
public function get guestUser():com.broceliand.pearlTree.io.object.user.UserData { return _guestUser; }
public function set guestUser(value:com.broceliand.pearlTree.io.object.user.UserData):void { _guestUser = value; }
public function get hostUserId():int { return _hostUserId; }
public function set hostUserId(value:int):void { _hostUserId = value; }
public function get hostUser():com.broceliand.pearlTree.io.object.user.UserData { return _hostUser; }
public function set hostUser(value:com.broceliand.pearlTree.io.object.user.UserData):void { _hostUser = value; }
public function get lastStatusChange():Number { return _lastStatusChange; }
public function set lastStatusChange(value:Number):void { _lastStatusChange = value; }
public function get message():String { return _message; }
public function set message(value:String):void { _message = value; }

public function readExternal(input:IDataInput):void {
requestId = input.readInt();
aliasId = input.readInt();
alias = input.readObject() as com.broceliand.pearlTree.io.object.tree.PearlData;
originalGuestAssoId = input.readInt();
originalHostAssoId = input.readInt();
targetAssoId = input.readInt();
type = input.readInt();
status = input.readInt();
guestUserId = input.readInt();
guestUser = input.readObject() as com.broceliand.pearlTree.io.object.user.UserData;
hostUserId = input.readInt();
hostUser = input.readObject() as com.broceliand.pearlTree.io.object.user.UserData;
lastStatusChange = input.readDouble();
message = input.readObject() as String;
}

public function writeExternal(output:IDataOutput):void {
output.writeInt(requestId);
output.writeInt(aliasId);
output.writeObject(alias);
output.writeInt(originalGuestAssoId);
output.writeInt(originalHostAssoId);
output.writeInt(targetAssoId);
output.writeInt(type);
output.writeInt(status);
output.writeInt(guestUserId);
output.writeObject(guestUser);
output.writeInt(hostUserId);
output.writeObject(hostUser);
output.writeDouble(lastStatusChange);
output.writeObject(message);
}
}
}
