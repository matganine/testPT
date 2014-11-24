package com.broceliand.pearlTree.io.object.tool.stat {

import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="InteractionStat")]
public class InteractionStatData implements IExternalizable {

private var _trigger:String;
private var _from:String;
private var _to:String;
private var _target:String;
private var _url:String;

public function get trigger():String { return _trigger; }
public function set trigger(value:String):void { _trigger = value; }
public function get from():String { return _from; }
public function set from(value:String):void { _from = value; }
public function get to():String { return _to; }
public function set to(value:String):void { _to = value; }
public function get target():String { return _target; }
public function set target(value:String):void { _target = value; }
public function get url():String { return _url; }
public function set url(value:String):void { _url = value; }

public function readExternal(input:IDataInput):void {
trigger = input.readObject() as String;
from = input.readObject() as String;
to = input.readObject() as String;
target = input.readObject() as String;
url = input.readObject() as String;
}

public function writeExternal(output:IDataOutput):void {
output.writeObject(trigger);
output.writeObject(from);
output.writeObject(to);
output.writeObject(target);
output.writeObject(url);
}
}
}
