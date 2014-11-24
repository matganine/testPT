package com.broceliand.pearlTree.io.object.util.externalservices {

import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="FacebookPostAction")]
public class FacebookPostActionData implements IExternalizable {

private var _name:String;
private var _link:String;

public function get name():String { return _name; }
public function set name(value:String):void { _name = value; }
public function get link():String { return _link; }
public function set link(value:String):void { _link = value; }

public function readExternal(input:IDataInput):void {
name = input.readObject() as String;
link = input.readObject() as String;
}

public function writeExternal(output:IDataOutput):void {
output.writeObject(name);
output.writeObject(link);
}
}
}
