package com.broceliand.pearlTree.io.object.tree.sync {

import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="SyncExclusion")]
public class SyncExclusionData implements IExternalizable {

private var _lastRightEclusion:Number;

public function get lastRightEclusion():Number { return _lastRightEclusion; }
public function set lastRightEclusion(value:Number):void { _lastRightEclusion = value; }

public function readExternal(input:IDataInput):void {
lastRightEclusion = input.readDouble();
}

public function writeExternal(output:IDataOutput):void {
output.writeDouble(lastRightEclusion);
}
}
}
