package com.broceliand.pearlTree.io.object.tree {

import com.broceliand.pearlTree.io.object.tree.TreeData;
import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="PearlNeighbour")]
public class PearlNeighbourData implements IExternalizable {

private var _pearlId:int;
private var _neighbourTreeId:int;
private var _neighbourTree:com.broceliand.pearlTree.io.object.tree.TreeData;
private var _neighbourPearlId:int;

public function get pearlId():int { return _pearlId; }
public function set pearlId(value:int):void { _pearlId = value; }
public function get neighbourTreeId():int { return _neighbourTreeId; }
public function set neighbourTreeId(value:int):void { _neighbourTreeId = value; }
public function get neighbourTree():com.broceliand.pearlTree.io.object.tree.TreeData { return _neighbourTree; }
public function set neighbourTree(value:com.broceliand.pearlTree.io.object.tree.TreeData):void { _neighbourTree = value; }
public function get neighbourPearlId():int { return _neighbourPearlId; }
public function set neighbourPearlId(value:int):void { _neighbourPearlId = value; }

public function readExternal(input:IDataInput):void {
pearlId = input.readInt();
neighbourTreeId = input.readInt();
neighbourTree = input.readObject() as com.broceliand.pearlTree.io.object.tree.TreeData;
neighbourPearlId = input.readInt();
}

public function writeExternal(output:IDataOutput):void {
output.writeInt(pearlId);
output.writeInt(neighbourTreeId);
output.writeObject(neighbourTree);
output.writeInt(neighbourPearlId);
}
}
}
