package com.broceliand.pearlTree.io.object.tree {

import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="TreeAppInfo")]
public class TreeAppInfoData implements IExternalizable {

private var _isCurrentUserOwner:int;

public function get isCurrentUserOwner():int { return _isCurrentUserOwner; }
public function set isCurrentUserOwner(value:int):void { _isCurrentUserOwner = value; }

public function readExternal(input:IDataInput):void {
isCurrentUserOwner = input.readInt();
}

public function writeExternal(output:IDataOutput):void {
output.writeInt(isCurrentUserOwner);
}
}
}
