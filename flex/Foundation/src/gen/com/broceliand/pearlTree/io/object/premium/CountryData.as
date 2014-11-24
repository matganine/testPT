package com.broceliand.pearlTree.io.object.premium {

import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="Country")]
public class CountryData implements IExternalizable {

private var _iso:String;

public function get iso():String { return _iso; }
public function set iso(value:String):void { _iso = value; }

public function readExternal(input:IDataInput):void {
iso = input.readObject() as String;
}

public function writeExternal(output:IDataOutput):void {
output.writeObject(iso);
}
}
}
