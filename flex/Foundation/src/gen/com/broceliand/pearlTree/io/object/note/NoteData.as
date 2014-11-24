package com.broceliand.pearlTree.io.object.note {

import com.broceliand.pearlTree.io.object.tree.TreeData;
import com.broceliand.pearlTree.io.object.user.UserData;
import com.broceliand.pearlTree.io.object.user.UserData;
import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="Note")]
public class NoteData implements IExternalizable {

private var _id:int;
private var _pearlId:int;
private var _tree:com.broceliand.pearlTree.io.object.tree.TreeData;
private var _userId:int;
private var _user:com.broceliand.pearlTree.io.object.user.UserData;
private var _urlId:int;
private var _text:String;
private var _date:Number;
private var _type:int;
private var _toUserId:int;
private var _toUser:com.broceliand.pearlTree.io.object.user.UserData;

public function get id():int { return _id; }
public function set id(value:int):void { _id = value; }
public function get pearlId():int { return _pearlId; }
public function set pearlId(value:int):void { _pearlId = value; }
public function get tree():com.broceliand.pearlTree.io.object.tree.TreeData { return _tree; }
public function set tree(value:com.broceliand.pearlTree.io.object.tree.TreeData):void { _tree = value; }
public function get userId():int { return _userId; }
public function set userId(value:int):void { _userId = value; }
public function get user():com.broceliand.pearlTree.io.object.user.UserData { return _user; }
public function set user(value:com.broceliand.pearlTree.io.object.user.UserData):void { _user = value; }
public function get urlId():int { return _urlId; }
public function set urlId(value:int):void { _urlId = value; }
public function get text():String { return _text; }
public function set text(value:String):void { _text = value; }
public function get date():Number { return _date; }
public function set date(value:Number):void { _date = value; }
public function get type():int { return _type; }
public function set type(value:int):void { _type = value; }
public function get toUserId():int { return _toUserId; }
public function set toUserId(value:int):void { _toUserId = value; }
public function get toUser():com.broceliand.pearlTree.io.object.user.UserData { return _toUser; }
public function set toUser(value:com.broceliand.pearlTree.io.object.user.UserData):void { _toUser = value; }

public function readExternal(input:IDataInput):void {
id = input.readInt();
pearlId = input.readInt();
tree = input.readObject() as com.broceliand.pearlTree.io.object.tree.TreeData;
userId = input.readInt();
user = input.readObject() as com.broceliand.pearlTree.io.object.user.UserData;
urlId = input.readInt();
text = input.readObject() as String;
date = input.readDouble();
type = input.readInt();
toUserId = input.readInt();
toUser = input.readObject() as com.broceliand.pearlTree.io.object.user.UserData;
}

public function writeExternal(output:IDataOutput):void {
output.writeInt(id);
output.writeInt(pearlId);
output.writeObject(tree);
output.writeInt(userId);
output.writeObject(user);
output.writeInt(urlId);
output.writeObject(text);
output.writeDouble(date);
output.writeInt(type);
output.writeInt(toUserId);
output.writeObject(toUser);
}
}
}
