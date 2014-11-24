package com.broceliand.pearlTree.io.object.tree {

import com.broceliand.pearlTree.io.object.tree.TreeData;
import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="SearchResult")]
public class SearchResultData implements IExternalizable {

private var _treeId:int;
private var _posRadius:Number;
private var _posAngle:Number;
private var _tree:com.broceliand.pearlTree.io.object.tree.TreeData;

public function get treeId():int { return _treeId; }
public function set treeId(value:int):void { _treeId = value; }
public function get posRadius():Number { return _posRadius; }
public function set posRadius(value:Number):void { _posRadius = value; }
public function get posAngle():Number { return _posAngle; }
public function set posAngle(value:Number):void { _posAngle = value; }
public function get tree():com.broceliand.pearlTree.io.object.tree.TreeData { return _tree; }
public function set tree(value:com.broceliand.pearlTree.io.object.tree.TreeData):void { _tree = value; }

public function readExternal(input:IDataInput):void {
treeId = input.readInt();
posRadius = input.readDouble();
posAngle = input.readDouble();
tree = input.readObject() as com.broceliand.pearlTree.io.object.tree.TreeData;
}

public function writeExternal(output:IDataOutput):void {
output.writeInt(treeId);
output.writeDouble(posRadius);
output.writeDouble(posAngle);
output.writeObject(tree);
}
}
}
