package com.broceliand.pearlTree.io.object.tree {

import com.broceliand.pearlTree.io.object.tree.TreeData;
import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="TreeHistory")]
public class TreeHistoryData implements IExternalizable {

private var _treeId:int;
private var _tree:com.broceliand.pearlTree.io.object.tree.TreeData;
private var _originAssoId:int;
private var _originAssoVersion:int;
private var _destAssoId:int;
private var _destAssoVersion:int;
private var _actingUserId:int;

public function get treeId():int { return _treeId; }
public function set treeId(value:int):void { _treeId = value; }
public function get tree():com.broceliand.pearlTree.io.object.tree.TreeData { return _tree; }
public function set tree(value:com.broceliand.pearlTree.io.object.tree.TreeData):void { _tree = value; }
public function get originAssoId():int { return _originAssoId; }
public function set originAssoId(value:int):void { _originAssoId = value; }
public function get originAssoVersion():int { return _originAssoVersion; }
public function set originAssoVersion(value:int):void { _originAssoVersion = value; }
public function get destAssoId():int { return _destAssoId; }
public function set destAssoId(value:int):void { _destAssoId = value; }
public function get destAssoVersion():int { return _destAssoVersion; }
public function set destAssoVersion(value:int):void { _destAssoVersion = value; }
public function get actingUserId():int { return _actingUserId; }
public function set actingUserId(value:int):void { _actingUserId = value; }

public function readExternal(input:IDataInput):void {
treeId = input.readInt();
tree = input.readObject() as com.broceliand.pearlTree.io.object.tree.TreeData;
originAssoId = input.readInt();
originAssoVersion = input.readInt();
destAssoId = input.readInt();
destAssoVersion = input.readInt();
actingUserId = input.readInt();
}

public function writeExternal(output:IDataOutput):void {
output.writeInt(treeId);
output.writeObject(tree);
output.writeInt(originAssoId);
output.writeInt(originAssoVersion);
output.writeInt(destAssoId);
output.writeInt(destAssoVersion);
output.writeInt(actingUserId);
}
}
}
