package com.broceliand.pearlTree.io.object.user {

import com.broceliand.pearlTree.io.object.user.UserData;
import com.broceliand.pearlTree.io.object.tree.AssociationData;
import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="ImageBiblio")]
public class ImageBiblioData implements IExternalizable {

private var _id:int;
private var _origin:int;
private var _userId:int;
private var _user:com.broceliand.pearlTree.io.object.user.UserData;
private var _assoId:int;
private var _asso:com.broceliand.pearlTree.io.object.tree.AssociationData;
private var _lastUse:Number;
private var _hash:flash.utils.ByteArray;
private var _width:int;
private var _height:int;
private var _urlHash:flash.utils.ByteArray;

public function get id():int { return _id; }
public function set id(value:int):void { _id = value; }
public function get origin():int { return _origin; }
public function set origin(value:int):void { _origin = value; }
public function get userId():int { return _userId; }
public function set userId(value:int):void { _userId = value; }
public function get user():com.broceliand.pearlTree.io.object.user.UserData { return _user; }
public function set user(value:com.broceliand.pearlTree.io.object.user.UserData):void { _user = value; }
public function get assoId():int { return _assoId; }
public function set assoId(value:int):void { _assoId = value; }
public function get asso():com.broceliand.pearlTree.io.object.tree.AssociationData { return _asso; }
public function set asso(value:com.broceliand.pearlTree.io.object.tree.AssociationData):void { _asso = value; }
public function get lastUse():Number { return _lastUse; }
public function set lastUse(value:Number):void { _lastUse = value; }
public function get hash():flash.utils.ByteArray { return _hash; }
public function set hash(value:flash.utils.ByteArray):void { _hash = value; }
public function get width():int { return _width; }
public function set width(value:int):void { _width = value; }
public function get height():int { return _height; }
public function set height(value:int):void { _height = value; }
public function get urlHash():flash.utils.ByteArray { return _urlHash; }
public function set urlHash(value:flash.utils.ByteArray):void { _urlHash = value; }

public function readExternal(input:IDataInput):void {
id = input.readInt();
origin = input.readInt();
userId = input.readInt();
user = input.readObject() as com.broceliand.pearlTree.io.object.user.UserData;
assoId = input.readInt();
asso = input.readObject() as com.broceliand.pearlTree.io.object.tree.AssociationData;
lastUse = input.readDouble();
hash = input.readObject() as flash.utils.ByteArray;
width = input.readInt();
height = input.readInt();
urlHash = input.readObject() as flash.utils.ByteArray;
}

public function writeExternal(output:IDataOutput):void {
output.writeInt(id);
output.writeInt(origin);
output.writeInt(userId);
output.writeObject(user);
output.writeInt(assoId);
output.writeObject(asso);
output.writeDouble(lastUse);
output.writeObject(hash);
output.writeInt(width);
output.writeInt(height);
output.writeObject(urlHash);
}
}
}
