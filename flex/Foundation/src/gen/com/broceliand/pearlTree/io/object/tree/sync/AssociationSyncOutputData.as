package com.broceliand.pearlTree.io.object.tree.sync {

import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="AssociationSyncOutput")]
public class AssociationSyncOutputData implements IExternalizable {

private var _assoVersion:int;
private var _assoId:int;
private var _externallyUpdatedTrees:Array;
private var _createdPearls:Array;
private var _lostTrees:Array;

public function get assoVersion():int { return _assoVersion; }
public function set assoVersion(value:int):void { _assoVersion = value; }
public function get assoId():int { return _assoId; }
public function set assoId(value:int):void { _assoId = value; }
public function get externallyUpdatedTrees():Array { return _externallyUpdatedTrees; }
public function set externallyUpdatedTrees(value:Array):void { _externallyUpdatedTrees = value; }
public function get createdPearls():Array { return _createdPearls; }
public function set createdPearls(value:Array):void { _createdPearls = value; }
public function get lostTrees():Array { return _lostTrees; }
public function set lostTrees(value:Array):void { _lostTrees = value; }

public function readExternal(input:IDataInput):void {
assoVersion = input.readInt();
assoId = input.readInt();
externallyUpdatedTrees = input.readObject() as Array;
createdPearls = input.readObject() as Array;
lostTrees = input.readObject() as Array;
}

public function writeExternal(output:IDataOutput):void {
output.writeInt(assoVersion);
output.writeInt(assoId);
output.writeObject(externallyUpdatedTrees);
output.writeObject(createdPearls);
output.writeObject(lostTrees);
}
}
}
