package com.broceliand.pearlTree.io.object.util.externalservices {

import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="FacebookWallPost")]
public class FacebookWallPostData implements IExternalizable {

private var _message:String;
private var _picture:String;
private var _link:String;
private var _pearlId:int;
private var _urlId:int;
private var _name:String;
private var _caption:String;
private var _source:String;
private var _description:String;
private var _actions:Array;

public function get message():String { return _message; }
public function set message(value:String):void { _message = value; }
public function get picture():String { return _picture; }
public function set picture(value:String):void { _picture = value; }
public function get link():String { return _link; }
public function set link(value:String):void { _link = value; }
public function get pearlId():int { return _pearlId; }
public function set pearlId(value:int):void { _pearlId = value; }
public function get urlId():int { return _urlId; }
public function set urlId(value:int):void { _urlId = value; }
public function get name():String { return _name; }
public function set name(value:String):void { _name = value; }
public function get caption():String { return _caption; }
public function set caption(value:String):void { _caption = value; }
public function get source():String { return _source; }
public function set source(value:String):void { _source = value; }
public function get description():String { return _description; }
public function set description(value:String):void { _description = value; }
public function get actions():Array { return _actions; }
public function set actions(value:Array):void { _actions = value; }

public function readExternal(input:IDataInput):void {
message = input.readObject() as String;
picture = input.readObject() as String;
link = input.readObject() as String;
pearlId = input.readInt();
urlId = input.readInt();
name = input.readObject() as String;
caption = input.readObject() as String;
source = input.readObject() as String;
description = input.readObject() as String;
actions = input.readObject() as Array;
}

public function writeExternal(output:IDataOutput):void {
output.writeObject(message);
output.writeObject(picture);
output.writeObject(link);
output.writeInt(pearlId);
output.writeInt(urlId);
output.writeObject(name);
output.writeObject(caption);
output.writeObject(source);
output.writeObject(description);
output.writeObject(actions);
}
}
}
