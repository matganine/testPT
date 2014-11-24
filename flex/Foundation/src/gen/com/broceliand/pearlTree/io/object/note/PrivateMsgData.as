package com.broceliand.pearlTree.io.object.note {

import com.broceliand.pearlTree.io.object.user.UserData;
import com.broceliand.pearlTree.io.object.user.UserData;
import com.broceliand.pearlTree.io.object.tree.PearlData;
import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="PrivateMsg")]
public class PrivateMsgData implements IExternalizable {

private var _id:int;
private var _toUserId:int;
private var _toUser:com.broceliand.pearlTree.io.object.user.UserData;
private var _fromUserId:int;
private var _fromUser:com.broceliand.pearlTree.io.object.user.UserData;
private var _pearlId:int;
private var _pearl:com.broceliand.pearlTree.io.object.tree.PearlData;
private var _text:String;
private var _sendDate:Number;
private var _isRead:int;
private var _type:int;

public function get id():int { return _id; }
public function set id(value:int):void { _id = value; }
public function get toUserId():int { return _toUserId; }
public function set toUserId(value:int):void { _toUserId = value; }
public function get toUser():com.broceliand.pearlTree.io.object.user.UserData { return _toUser; }
public function set toUser(value:com.broceliand.pearlTree.io.object.user.UserData):void { _toUser = value; }
public function get fromUserId():int { return _fromUserId; }
public function set fromUserId(value:int):void { _fromUserId = value; }
public function get fromUser():com.broceliand.pearlTree.io.object.user.UserData { return _fromUser; }
public function set fromUser(value:com.broceliand.pearlTree.io.object.user.UserData):void { _fromUser = value; }
public function get pearlId():int { return _pearlId; }
public function set pearlId(value:int):void { _pearlId = value; }
public function get pearl():com.broceliand.pearlTree.io.object.tree.PearlData { return _pearl; }
public function set pearl(value:com.broceliand.pearlTree.io.object.tree.PearlData):void { _pearl = value; }
public function get text():String { return _text; }
public function set text(value:String):void { _text = value; }
public function get sendDate():Number { return _sendDate; }
public function set sendDate(value:Number):void { _sendDate = value; }
public function get isRead():int { return _isRead; }
public function set isRead(value:int):void { _isRead = value; }
public function get type():int { return _type; }
public function set type(value:int):void { _type = value; }

public function readExternal(input:IDataInput):void {
id = input.readInt();
toUserId = input.readInt();
toUser = input.readObject() as com.broceliand.pearlTree.io.object.user.UserData;
fromUserId = input.readInt();
fromUser = input.readObject() as com.broceliand.pearlTree.io.object.user.UserData;
pearlId = input.readInt();
pearl = input.readObject() as com.broceliand.pearlTree.io.object.tree.PearlData;
text = input.readObject() as String;
sendDate = input.readDouble();
isRead = input.readInt();
type = input.readInt();
}

public function writeExternal(output:IDataOutput):void {
output.writeInt(id);
output.writeInt(toUserId);
output.writeObject(toUser);
output.writeInt(fromUserId);
output.writeObject(fromUser);
output.writeInt(pearlId);
output.writeObject(pearl);
output.writeObject(text);
output.writeDouble(sendDate);
output.writeInt(isRead);
output.writeInt(type);
}
}
}
