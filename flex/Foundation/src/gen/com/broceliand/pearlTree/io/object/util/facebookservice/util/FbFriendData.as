package com.broceliand.pearlTree.io.object.util.facebookservice.util {

import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="FbFriend")]
public class FbFriendData implements IExternalizable {

private var _fbId:String;
private var _fbName:String;
private var _ptUserId:int;
private var _ptUserName:String;
private var _selected:int;
private var _connectionStatus:int;

public function get fbId():String { return _fbId; }
public function set fbId(value:String):void { _fbId = value; }
public function get fbName():String { return _fbName; }
public function set fbName(value:String):void { _fbName = value; }
public function get ptUserId():int { return _ptUserId; }
public function set ptUserId(value:int):void { _ptUserId = value; }
public function get ptUserName():String { return _ptUserName; }
public function set ptUserName(value:String):void { _ptUserName = value; }
public function get selected():int { return _selected; }
public function set selected(value:int):void { _selected = value; }
public function get connectionStatus():int { return _connectionStatus; }
public function set connectionStatus(value:int):void { _connectionStatus = value; }

public function readExternal(input:IDataInput):void {
fbId = input.readObject() as String;
fbName = input.readObject() as String;
ptUserId = input.readInt();
ptUserName = input.readObject() as String;
selected = input.readInt();
connectionStatus = input.readInt();
}

public function writeExternal(output:IDataOutput):void {
output.writeObject(fbId);
output.writeObject(fbName);
output.writeInt(ptUserId);
output.writeObject(ptUserName);
output.writeInt(selected);
output.writeInt(connectionStatus);
}
}
}
