package com.broceliand.pearlTree.io.object.util.paginatedlist {

import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="LimitItem")]
public class LimitItemData implements IExternalizable {

private var _limit:int;

public function get limit():int { return _limit; }
public function set limit(value:int):void { _limit = value; }

public function readExternal(input:IDataInput):void {
limit = input.readInt();
}

public function writeExternal(output:IDataOutput):void {
output.writeInt(limit);
}
}
}
