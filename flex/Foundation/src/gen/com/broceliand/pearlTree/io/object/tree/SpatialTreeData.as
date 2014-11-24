package com.broceliand.pearlTree.io.object.tree {

import com.broceliand.pearlTree.io.object.tree.TreeData;
import com.broceliand.pearlTree.io.object.tree.PearlData;
import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="SpatialTree")]
public class SpatialTreeData implements IExternalizable {

private var _treeId:int;
private var _hexX:int;
private var _hexY:int;
private var _relativeX:int;
private var _relativeY:int;
private var _tree:com.broceliand.pearlTree.io.object.tree.TreeData;
private var _pearl:com.broceliand.pearlTree.io.object.tree.PearlData;

public function get treeId():int { return _treeId; }
public function set treeId(value:int):void { _treeId = value; }
public function get hexX():int { return _hexX; }
public function set hexX(value:int):void { _hexX = value; }
public function get hexY():int { return _hexY; }
public function set hexY(value:int):void { _hexY = value; }
public function get relativeX():int { return _relativeX; }
public function set relativeX(value:int):void { _relativeX = value; }
public function get relativeY():int { return _relativeY; }
public function set relativeY(value:int):void { _relativeY = value; }
public function get tree():com.broceliand.pearlTree.io.object.tree.TreeData { return _tree; }
public function set tree(value:com.broceliand.pearlTree.io.object.tree.TreeData):void { _tree = value; }
public function get pearl():com.broceliand.pearlTree.io.object.tree.PearlData { return _pearl; }
public function set pearl(value:com.broceliand.pearlTree.io.object.tree.PearlData):void { _pearl = value; }

public function readExternal(input:IDataInput):void {
treeId = input.readInt();
hexX = input.readInt();
hexY = input.readInt();
relativeX = input.readInt();
relativeY = input.readInt();
tree = input.readObject() as com.broceliand.pearlTree.io.object.tree.TreeData;
pearl = input.readObject() as com.broceliand.pearlTree.io.object.tree.PearlData;
}

public function writeExternal(output:IDataOutput):void {
output.writeInt(treeId);
output.writeInt(hexX);
output.writeInt(hexY);
output.writeInt(relativeX);
output.writeInt(relativeY);
output.writeObject(tree);
output.writeObject(pearl);
}
}
}
