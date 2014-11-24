package com.broceliand.pearlTree.io.object.tree.sync {

import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="AssociationSyncInput")]
public class AssociationSyncInputData implements IExternalizable {

private var _associationId:int;
private var _version:int;
private var _updatedTrees:Array;
private var _deletedPearls:Array;

public function get associationId():int { return _associationId; }
public function set associationId(value:int):void { _associationId = value; }
public function get version():int { return _version; }
public function set version(value:int):void { _version = value; }
public function get updatedTrees():Array { return _updatedTrees; }
public function set updatedTrees(value:Array):void { _updatedTrees = value; }
public function get deletedPearls():Array { return _deletedPearls; }
public function set deletedPearls(value:Array):void { _deletedPearls = value; }

public function readExternal(input:IDataInput):void {
associationId = input.readInt();
version = input.readInt();
updatedTrees = input.readObject() as Array;
deletedPearls = input.readObject() as Array;
}

public function writeExternal(output:IDataOutput):void {
output.writeInt(associationId);
output.writeInt(version);
output.writeObject(updatedTrees);
output.writeObject(deletedPearls);
}
}
}
