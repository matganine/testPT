package com.broceliand.pearlTree.io.object.tree {

import com.broceliand.pearlTree.io.object.tree.TreeData;
import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="TreeNeighbour")]
public class TreeNeighbourData implements IExternalizable {

private var _treeId:int;
private var _neighbourTreeId:int;
private var _posRadius:Number;
private var _posAngle:Number;
private var _neighbourTree:com.broceliand.pearlTree.io.object.tree.TreeData;

public function get treeId():int { return _treeId; }
public function set treeId(value:int):void { _treeId = value; }
public function get neighbourTreeId():int { return _neighbourTreeId; }
public function set neighbourTreeId(value:int):void { _neighbourTreeId = value; }
public function get posRadius():Number { return _posRadius; }
public function set posRadius(value:Number):void { _posRadius = value; }
public function get posAngle():Number { return _posAngle; }
public function set posAngle(value:Number):void { _posAngle = value; }
public function get neighbourTree():com.broceliand.pearlTree.io.object.tree.TreeData { return _neighbourTree; }
public function set neighbourTree(value:com.broceliand.pearlTree.io.object.tree.TreeData):void { _neighbourTree = value; }

public function readExternal(input:IDataInput):void {
treeId = input.readInt();
neighbourTreeId = input.readInt();
posRadius = input.readDouble();
posAngle = input.readDouble();
neighbourTree = input.readObject() as com.broceliand.pearlTree.io.object.tree.TreeData;
}

public function writeExternal(output:IDataOutput):void {
output.writeInt(treeId);
output.writeInt(neighbourTreeId);
output.writeDouble(posRadius);
output.writeDouble(posAngle);
output.writeObject(neighbourTree);
}
}
}
