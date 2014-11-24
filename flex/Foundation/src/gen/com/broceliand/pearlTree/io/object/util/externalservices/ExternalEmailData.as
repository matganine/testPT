package com.broceliand.pearlTree.io.object.util.externalservices {

import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="ExternalEmail")]
public class ExternalEmailData implements IExternalizable {

private var _email:String;

public function get email():String { return _email; }
public function set email(value:String):void { _email = value; }

public function readExternal(input:IDataInput):void {
email = input.readObject() as String;
}

public function writeExternal(output:IDataOutput):void {
output.writeObject(email);
}
}
}
