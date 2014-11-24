package com.broceliand.pearlTree.io.object.tool.stat {

import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="ClientStat")]
public class ClientStatData implements IExternalizable {

private var _bucket:String;
private var _value:int;
private var _metric:int;
private var _provider:int;
private var _log:String;
private var _country:int;
private var _session:int;
private var _computedAb:String;

public function get bucket():String { return _bucket; }
public function set bucket(value:String):void { _bucket = value; }
public function get value():int { return _value; }
public function set value(value:int):void { _value = value; }
public function get metric():int { return _metric; }
public function set metric(value:int):void { _metric = value; }
public function get provider():int { return _provider; }
public function set provider(value:int):void { _provider = value; }
public function get log():String { return _log; }
public function set log(value:String):void { _log = value; }
public function get country():int { return _country; }
public function set country(value:int):void { _country = value; }
public function get session():int { return _session; }
public function set session(value:int):void { _session = value; }
public function get computedAb():String { return _computedAb; }
public function set computedAb(value:String):void { _computedAb = value; }

public function readExternal(input:IDataInput):void {
bucket = input.readObject() as String;
value = input.readInt();
metric = input.readInt();
provider = input.readInt();
log = input.readObject() as String;
country = input.readInt();
session = input.readInt();
computedAb = input.readObject() as String;
}

public function writeExternal(output:IDataOutput):void {
output.writeObject(bucket);
output.writeInt(value);
output.writeInt(metric);
output.writeInt(provider);
output.writeObject(log);
output.writeInt(country);
output.writeInt(session);
output.writeObject(computedAb);
}
}
}
