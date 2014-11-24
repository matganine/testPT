package com.broceliand.pearlTree.io.object.tree {

import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="Section")]
public class SectionData implements IExternalizable {

private var _id:int;
private var _pearlId:int;
private var _text:String;
private var _lastUpdate:Number;

public function get id():int { return _id; }
public function set id(value:int):void { _id = value; }
public function get pearlId():int { return _pearlId; }
public function set pearlId(value:int):void { _pearlId = value; }
public function get text():String { return _text; }
public function set text(value:String):void { _text = value; }
public function get lastUpdate():Number { return _lastUpdate; }
public function set lastUpdate(value:Number):void { _lastUpdate = value; }

public function readExternal(input:IDataInput):void {
id = input.readInt();
pearlId = input.readInt();
text = input.readObject() as String;
lastUpdate = input.readDouble();
}

public function writeExternal(output:IDataOutput):void {
output.writeInt(id);
output.writeInt(pearlId);
output.writeObject(text);
output.writeDouble(lastUpdate);
}
}
}
