package com.broceliand.pearlTree.io.object.user {

import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="PromoPrompt")]
public class PromoPromptData implements IExternalizable {

private var _promptType:int;
private var _title:String;
private var _content:String;
private var _buttonTitle:String;

public function get promptType():int { return _promptType; }
public function set promptType(value:int):void { _promptType = value; }
public function get title():String { return _title; }
public function set title(value:String):void { _title = value; }
public function get content():String { return _content; }
public function set content(value:String):void { _content = value; }
public function get buttonTitle():String { return _buttonTitle; }
public function set buttonTitle(value:String):void { _buttonTitle = value; }

public function readExternal(input:IDataInput):void {
promptType = input.readInt();
title = input.readObject() as String;
content = input.readObject() as String;
buttonTitle = input.readObject() as String;
}

public function writeExternal(output:IDataOutput):void {
output.writeInt(promptType);
output.writeObject(title);
output.writeObject(content);
output.writeObject(buttonTitle);
}
}
}
