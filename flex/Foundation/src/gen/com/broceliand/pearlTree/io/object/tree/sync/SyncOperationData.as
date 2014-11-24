package com.broceliand.pearlTree.io.object.tree.sync {

import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="SyncOperation")]
public class SyncOperationData implements IExternalizable {

private var _type:int;
private var _opId:int;
private var _clientId:int;
private var _treeId:int;
private var _pearlId:int;
private var _urlId:int;
private var _fromTreeId:int;
private var _title:String;
private var _text:String;
private var _position:String;
private var _visibility:int;
private var _subOperations:Array;
private var _hash:String;

public function get type():int { return _type; }
public function set type(value:int):void { _type = value; }
public function get opId():int { return _opId; }
public function set opId(value:int):void { _opId = value; }
public function get clientId():int { return _clientId; }
public function set clientId(value:int):void { _clientId = value; }
public function get treeId():int { return _treeId; }
public function set treeId(value:int):void { _treeId = value; }
public function get pearlId():int { return _pearlId; }
public function set pearlId(value:int):void { _pearlId = value; }
public function get urlId():int { return _urlId; }
public function set urlId(value:int):void { _urlId = value; }
public function get fromTreeId():int { return _fromTreeId; }
public function set fromTreeId(value:int):void { _fromTreeId = value; }
public function get title():String { return _title; }
public function set title(value:String):void { _title = value; }
public function get text():String { return _text; }
public function set text(value:String):void { _text = value; }
public function get position():String { return _position; }
public function set position(value:String):void { _position = value; }
public function get visibility():int { return _visibility; }
public function set visibility(value:int):void { _visibility = value; }
public function get subOperations():Array { return _subOperations; }
public function set subOperations(value:Array):void { _subOperations = value; }
public function get hash():String { return _hash; }
public function set hash(value:String):void { _hash = value; }

public function readExternal(input:IDataInput):void {
type = input.readInt();
opId = input.readInt();
clientId = input.readInt();
treeId = input.readInt();
pearlId = input.readInt();
urlId = input.readInt();
fromTreeId = input.readInt();
title = input.readObject() as String;
text = input.readObject() as String;
position = input.readObject() as String;
visibility = input.readInt();
subOperations = input.readObject() as Array;
hash = input.readObject() as String;
}

public function writeExternal(output:IDataOutput):void {
output.writeInt(type);
output.writeInt(opId);
output.writeInt(clientId);
output.writeInt(treeId);
output.writeInt(pearlId);
output.writeInt(urlId);
output.writeInt(fromTreeId);
output.writeObject(title);
output.writeObject(text);
output.writeObject(position);
output.writeInt(visibility);
output.writeObject(subOperations);
output.writeObject(hash);
}
}
}
