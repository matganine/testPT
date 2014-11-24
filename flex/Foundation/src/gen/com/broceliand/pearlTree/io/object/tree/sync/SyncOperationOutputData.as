package com.broceliand.pearlTree.io.object.tree.sync {

import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="SyncOperationOutput")]
public class SyncOperationOutputData implements IExternalizable {

private var _opId:int;
private var _error:String;
private var _pearlId:int;
private var _treeId:int;
private var _urlId:int;

public function get opId():int { return _opId; }
public function set opId(value:int):void { _opId = value; }
public function get error():String { return _error; }
public function set error(value:String):void { _error = value; }
public function get pearlId():int { return _pearlId; }
public function set pearlId(value:int):void { _pearlId = value; }
public function get treeId():int { return _treeId; }
public function set treeId(value:int):void { _treeId = value; }
public function get urlId():int { return _urlId; }
public function set urlId(value:int):void { _urlId = value; }

public function readExternal(input:IDataInput):void {
opId = input.readInt();
error = input.readObject() as String;
pearlId = input.readInt();
treeId = input.readInt();
urlId = input.readInt();
}

public function writeExternal(output:IDataOutput):void {
output.writeInt(opId);
output.writeObject(error);
output.writeInt(pearlId);
output.writeInt(treeId);
output.writeInt(urlId);
}
}
}
