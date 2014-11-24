package com.broceliand.pearlTree.io.object.tree.sync {

import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="SpecificOperation")]
public class SpecificOperationData implements IExternalizable {

private var _type:int;
private var _treeId:int;
private var _pearlClientId:int;

public function get type():int { return _type; }
public function set type(value:int):void { _type = value; }
public function get treeId():int { return _treeId; }
public function set treeId(value:int):void { _treeId = value; }
public function get pearlClientId():int { return _pearlClientId; }
public function set pearlClientId(value:int):void { _pearlClientId = value; }

public function readExternal(input:IDataInput):void {
type = input.readInt();
treeId = input.readInt();
pearlClientId = input.readInt();
}

public function writeExternal(output:IDataOutput):void {
output.writeInt(type);
output.writeInt(treeId);
output.writeInt(pearlClientId);
}
}
}
