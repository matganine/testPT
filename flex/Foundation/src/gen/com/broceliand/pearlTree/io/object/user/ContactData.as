package com.broceliand.pearlTree.io.object.user {

import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="Contact")]
public class ContactData implements IExternalizable {

private var _id:int;
private var _email:String;
private var _displayName:String;

public function get id():int { return _id; }
public function set id(value:int):void { _id = value; }
public function get email():String { return _email; }
public function set email(value:String):void { _email = value; }
public function get displayName():String { return _displayName; }
public function set displayName(value:String):void { _displayName = value; }

public function readExternal(input:IDataInput):void {
id = input.readInt();
email = input.readObject() as String;
displayName = input.readObject() as String;
}

public function writeExternal(output:IDataOutput):void {
output.writeInt(id);
output.writeObject(email);
output.writeObject(displayName);
}
}
}
