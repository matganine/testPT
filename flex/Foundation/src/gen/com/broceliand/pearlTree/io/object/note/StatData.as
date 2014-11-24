package com.broceliand.pearlTree.io.object.note {

import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="Stat")]
public class StatData implements IExternalizable {

private var _date:Number;
private var _type:String;
private var _name:String;
private var _duration:int;
private var _netTime:int;
private var _size:int;
private var _visibility:int;
private var _server:String;

public function get date():Number { return _date; }
public function set date(value:Number):void { _date = value; }
public function get type():String { return _type; }
public function set type(value:String):void { _type = value; }
public function get name():String { return _name; }
public function set name(value:String):void { _name = value; }
public function get duration():int { return _duration; }
public function set duration(value:int):void { _duration = value; }
public function get netTime():int { return _netTime; }
public function set netTime(value:int):void { _netTime = value; }
public function get size():int { return _size; }
public function set size(value:int):void { _size = value; }
public function get visibility():int { return _visibility; }
public function set visibility(value:int):void { _visibility = value; }
public function get server():String { return _server; }
public function set server(value:String):void { _server = value; }

public function readExternal(input:IDataInput):void {
date = input.readDouble();
type = input.readObject() as String;
name = input.readObject() as String;
duration = input.readInt();
netTime = input.readInt();
size = input.readInt();
visibility = input.readInt();
server = input.readObject() as String;
}

public function writeExternal(output:IDataOutput):void {
output.writeDouble(date);
output.writeObject(type);
output.writeObject(name);
output.writeInt(duration);
output.writeInt(netTime);
output.writeInt(size);
output.writeInt(visibility);
output.writeObject(server);
}
}
}
