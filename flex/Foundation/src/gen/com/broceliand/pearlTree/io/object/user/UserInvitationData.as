package com.broceliand.pearlTree.io.object.user {

import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="UserInvitation")]
public class UserInvitationData implements IExternalizable {

private var _id:int;
private var _uniqueKey:String;
private var _invitationUserId:int;
private var _email:String;
private var _creationDate:Number;
private var _usedDate:Number;
private var _newUserId:int;
private var _message:String;
private var _guestName:String;
private var _fromEmail:String;
private var _status:int;
private var _nbSent:int;
private var _lastSent:Number;
private var _teamUpTreeId:int;
private var _fbRequestId:String;
private var _displayName:String;
private var _groupMemberId:int;

public function get id():int { return _id; }
public function set id(value:int):void { _id = value; }
public function get uniqueKey():String { return _uniqueKey; }
public function set uniqueKey(value:String):void { _uniqueKey = value; }
public function get invitationUserId():int { return _invitationUserId; }
public function set invitationUserId(value:int):void { _invitationUserId = value; }
public function get email():String { return _email; }
public function set email(value:String):void { _email = value; }
public function get creationDate():Number { return _creationDate; }
public function set creationDate(value:Number):void { _creationDate = value; }
public function get usedDate():Number { return _usedDate; }
public function set usedDate(value:Number):void { _usedDate = value; }
public function get newUserId():int { return _newUserId; }
public function set newUserId(value:int):void { _newUserId = value; }
public function get message():String { return _message; }
public function set message(value:String):void { _message = value; }
public function get guestName():String { return _guestName; }
public function set guestName(value:String):void { _guestName = value; }
public function get fromEmail():String { return _fromEmail; }
public function set fromEmail(value:String):void { _fromEmail = value; }
public function get status():int { return _status; }
public function set status(value:int):void { _status = value; }
public function get nbSent():int { return _nbSent; }
public function set nbSent(value:int):void { _nbSent = value; }
public function get lastSent():Number { return _lastSent; }
public function set lastSent(value:Number):void { _lastSent = value; }
public function get teamUpTreeId():int { return _teamUpTreeId; }
public function set teamUpTreeId(value:int):void { _teamUpTreeId = value; }
public function get fbRequestId():String { return _fbRequestId; }
public function set fbRequestId(value:String):void { _fbRequestId = value; }
public function get displayName():String { return _displayName; }
public function set displayName(value:String):void { _displayName = value; }
public function get groupMemberId():int { return _groupMemberId; }
public function set groupMemberId(value:int):void { _groupMemberId = value; }

public function readExternal(input:IDataInput):void {
id = input.readInt();
uniqueKey = input.readObject() as String;
invitationUserId = input.readInt();
email = input.readObject() as String;
creationDate = input.readDouble();
usedDate = input.readDouble();
newUserId = input.readInt();
message = input.readObject() as String;
guestName = input.readObject() as String;
fromEmail = input.readObject() as String;
status = input.readInt();
nbSent = input.readInt();
lastSent = input.readDouble();
teamUpTreeId = input.readInt();
fbRequestId = input.readObject() as String;
displayName = input.readObject() as String;
groupMemberId = input.readInt();
}

public function writeExternal(output:IDataOutput):void {
output.writeInt(id);
output.writeObject(uniqueKey);
output.writeInt(invitationUserId);
output.writeObject(email);
output.writeDouble(creationDate);
output.writeDouble(usedDate);
output.writeInt(newUserId);
output.writeObject(message);
output.writeObject(guestName);
output.writeObject(fromEmail);
output.writeInt(status);
output.writeInt(nbSent);
output.writeDouble(lastSent);
output.writeInt(teamUpTreeId);
output.writeObject(fbRequestId);
output.writeObject(displayName);
output.writeInt(groupMemberId);
}
}
}
