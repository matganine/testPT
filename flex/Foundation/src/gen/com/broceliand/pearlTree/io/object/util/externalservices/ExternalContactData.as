package com.broceliand.pearlTree.io.object.util.externalservices {

import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="ExternalContact")]
public class ExternalContactData implements IExternalizable {

private var _firstName:String;
private var _lastName:String;
private var _emails:Array;

public function get firstName():String { return _firstName; }
public function set firstName(value:String):void { _firstName = value; }
public function get lastName():String { return _lastName; }
public function set lastName(value:String):void { _lastName = value; }
public function get emails():Array { return _emails; }
public function set emails(value:Array):void { _emails = value; }

public function readExternal(input:IDataInput):void {
firstName = input.readObject() as String;
lastName = input.readObject() as String;
emails = input.readObject() as Array;
}

public function writeExternal(output:IDataOutput):void {
output.writeObject(firstName);
output.writeObject(lastName);
output.writeObject(emails);
}
}
}
