package com.broceliand.pearlTree.io.object.tool.stat {

import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="FunnelStat")]
public class FunnelStatData implements IExternalizable {

private var _funnelName:String;
private var _funnelKey:String;
private var _value:int;

public function get funnelName():String { return _funnelName; }
public function set funnelName(value:String):void { _funnelName = value; }
public function get funnelKey():String { return _funnelKey; }
public function set funnelKey(value:String):void { _funnelKey = value; }
public function get value():int { return _value; }
public function set value(value:int):void { _value = value; }

public function readExternal(input:IDataInput):void {
funnelName = input.readObject() as String;
funnelKey = input.readObject() as String;
value = input.readInt();
}

public function writeExternal(output:IDataOutput):void {
output.writeObject(funnelName);
output.writeObject(funnelKey);
output.writeInt(value);
}
}
}
