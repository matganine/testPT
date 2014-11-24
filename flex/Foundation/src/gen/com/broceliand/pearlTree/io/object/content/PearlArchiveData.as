package com.broceliand.pearlTree.io.object.content {

import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="PearlArchive")]
public class PearlArchiveData implements IExternalizable {

private var _pearlId:int;
private var _date:Number;
private var _key:String;
private var _mode:int;
private var _isReady:int;

public function get pearlId():int { return _pearlId; }
public function set pearlId(value:int):void { _pearlId = value; }
public function get date():Number { return _date; }
public function set date(value:Number):void { _date = value; }
public function get key():String { return _key; }
public function set key(value:String):void { _key = value; }
public function get mode():int { return _mode; }
public function set mode(value:int):void { _mode = value; }
public function get isReady():int { return _isReady; }
public function set isReady(value:int):void { _isReady = value; }

public function readExternal(input:IDataInput):void {
pearlId = input.readInt();
date = input.readDouble();
key = input.readObject() as String;
mode = input.readInt();
isReady = input.readInt();
}

public function writeExternal(output:IDataOutput):void {
output.writeInt(pearlId);
output.writeDouble(date);
output.writeObject(key);
output.writeInt(mode);
output.writeInt(isReady);
}
}
}
