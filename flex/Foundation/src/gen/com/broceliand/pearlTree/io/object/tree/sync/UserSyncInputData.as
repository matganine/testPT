package com.broceliand.pearlTree.io.object.tree.sync {

import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="UserSyncInput")]
public class UserSyncInputData implements IExternalizable {

private var _lastRightsUpdate:Number;
private var _lastRightsUpdateExclusions:Array;

public function get lastRightsUpdate():Number { return _lastRightsUpdate; }
public function set lastRightsUpdate(value:Number):void { _lastRightsUpdate = value; }
public function get lastRightsUpdateExclusions():Array { return _lastRightsUpdateExclusions; }
public function set lastRightsUpdateExclusions(value:Array):void { _lastRightsUpdateExclusions = value; }

public function readExternal(input:IDataInput):void {
lastRightsUpdate = input.readDouble();
lastRightsUpdateExclusions = input.readObject() as Array;
}

public function writeExternal(output:IDataOutput):void {
output.writeDouble(lastRightsUpdate);
output.writeObject(lastRightsUpdateExclusions);
}
}
}
