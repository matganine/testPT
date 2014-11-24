package com.broceliand.pearlTree.io.object.user {

import com.broceliand.pearlTree.io.object.user.UserData;
import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="Friend")]
public class FriendData implements IExternalizable {

private var _userId:int;
private var _user:com.broceliand.pearlTree.io.object.user.UserData;
private var _follow:int;

public function get userId():int { return _userId; }
public function set userId(value:int):void { _userId = value; }
public function get user():com.broceliand.pearlTree.io.object.user.UserData { return _user; }
public function set user(value:com.broceliand.pearlTree.io.object.user.UserData):void { _user = value; }
public function get follow():int { return _follow; }
public function set follow(value:int):void { _follow = value; }

public function readExternal(input:IDataInput):void {
userId = input.readInt();
user = input.readObject() as com.broceliand.pearlTree.io.object.user.UserData;
follow = input.readInt();
}

public function writeExternal(output:IDataOutput):void {
output.writeInt(userId);
output.writeObject(user);
output.writeInt(follow);
}
}
}
