package com.broceliand.pearlTree.io.object.tree.sync {

import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="SyncOutput")]
public class SyncOutputData implements IExternalizable {

private var _updatedTrees:Array;
private var _outputOps:Array;

public function get updatedTrees():Array { return _updatedTrees; }
public function set updatedTrees(value:Array):void { _updatedTrees = value; }
public function get outputOps():Array { return _outputOps; }
public function set outputOps(value:Array):void { _outputOps = value; }

public function readExternal(input:IDataInput):void {
updatedTrees = input.readObject() as Array;
outputOps = input.readObject() as Array;
}

public function writeExternal(output:IDataOutput):void {
output.writeObject(updatedTrees);
output.writeObject(outputOps);
}
}
}
