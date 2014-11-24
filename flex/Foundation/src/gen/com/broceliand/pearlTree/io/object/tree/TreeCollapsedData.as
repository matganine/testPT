package com.broceliand.pearlTree.io.object.tree {

import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="TreeCollapsed")]
public class TreeCollapsedData implements IExternalizable {

private var _userId:int;
private var _treeId:int;
private var _collapsed:int;

public function get userId():int { return _userId; }
public function set userId(value:int):void { _userId = value; }
public function get treeId():int { return _treeId; }
public function set treeId(value:int):void { _treeId = value; }
public function get collapsed():int { return _collapsed; }
public function set collapsed(value:int):void { _collapsed = value; }

public function readExternal(input:IDataInput):void {
userId = input.readInt();
treeId = input.readInt();
collapsed = input.readInt();
}

public function writeExternal(output:IDataOutput):void {
output.writeInt(userId);
output.writeInt(treeId);
output.writeInt(collapsed);
}
}
}
