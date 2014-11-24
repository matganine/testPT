package com.broceliand.pearlTree.io.object.ajax.user {

import com.broceliand.pearlTree.io.object.tree.TreeData;
import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="UserOrAssoAsPearl")]
public class UserOrAssoAsPearlData implements IExternalizable {

private var _id:int;
private var _name:String;
private var _avatarHash:flash.utils.ByteArray;
private var _rootTreeId:int;
private var _rootTree:com.broceliand.pearlTree.io.object.tree.TreeData;
private var _follow:int;

public function get id():int { return _id; }
public function set id(value:int):void { _id = value; }
public function get name():String { return _name; }
public function set name(value:String):void { _name = value; }
public function get avatarHash():flash.utils.ByteArray { return _avatarHash; }
public function set avatarHash(value:flash.utils.ByteArray):void { _avatarHash = value; }
public function get rootTreeId():int { return _rootTreeId; }
public function set rootTreeId(value:int):void { _rootTreeId = value; }
public function get rootTree():com.broceliand.pearlTree.io.object.tree.TreeData { return _rootTree; }
public function set rootTree(value:com.broceliand.pearlTree.io.object.tree.TreeData):void { _rootTree = value; }
public function get follow():int { return _follow; }
public function set follow(value:int):void { _follow = value; }

public function readExternal(input:IDataInput):void {
id = input.readInt();
name = input.readObject() as String;
avatarHash = input.readObject() as flash.utils.ByteArray;
rootTreeId = input.readInt();
rootTree = input.readObject() as com.broceliand.pearlTree.io.object.tree.TreeData;
follow = input.readInt();
}

public function writeExternal(output:IDataOutput):void {
output.writeInt(id);
output.writeObject(name);
output.writeObject(avatarHash);
output.writeInt(rootTreeId);
output.writeObject(rootTree);
output.writeInt(follow);
}
}
}
