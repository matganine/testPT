package com.broceliand.pearlTree.io.object.user {

import com.broceliand.pearlTree.io.object.user.UserData;
import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="UserConnection")]
public class UserConnectionData implements IExternalizable {

private var _toUser:com.broceliand.pearlTree.io.object.user.UserData;
private var _status:int;
private var _toUserPearlCount:int;

public function get toUser():com.broceliand.pearlTree.io.object.user.UserData { return _toUser; }
public function set toUser(value:com.broceliand.pearlTree.io.object.user.UserData):void { _toUser = value; }
public function get status():int { return _status; }
public function set status(value:int):void { _status = value; }
public function get toUserPearlCount():int { return _toUserPearlCount; }
public function set toUserPearlCount(value:int):void { _toUserPearlCount = value; }

public function readExternal(input:IDataInput):void {
toUser = input.readObject() as com.broceliand.pearlTree.io.object.user.UserData;
status = input.readInt();
toUserPearlCount = input.readInt();
}

public function writeExternal(output:IDataOutput):void {
output.writeObject(toUser);
output.writeInt(status);
output.writeInt(toUserPearlCount);
}
}
}
