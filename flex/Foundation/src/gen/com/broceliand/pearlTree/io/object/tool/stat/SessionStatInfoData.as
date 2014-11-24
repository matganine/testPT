package com.broceliand.pearlTree.io.object.tool.stat {

import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="SessionStatInfo")]
public class SessionStatInfoData implements IExternalizable {

private var _session:int;
private var _computedAb:String;

public function get session():int { return _session; }
public function set session(value:int):void { _session = value; }
public function get computedAb():String { return _computedAb; }
public function set computedAb(value:String):void { _computedAb = value; }

public function readExternal(input:IDataInput):void {
session = input.readInt();
computedAb = input.readObject() as String;
}

public function writeExternal(output:IDataOutput):void {
output.writeInt(session);
output.writeObject(computedAb);
}
}
}
