package com.broceliand.pearlTree.io.object.note {

import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="PageContent")]
public class PageContentData implements IExternalizable {

private var _text:String;
private var _picture1:String;
private var _width1:int;
private var _picture2:String;
private var _width2:int;
private var _picture3:String;
private var _width3:int;
private var _picture4:String;
private var _width4:int;
private var _picture5:String;
private var _width5:int;

public function get text():String { return _text; }
public function set text(value:String):void { _text = value; }
public function get picture1():String { return _picture1; }
public function set picture1(value:String):void { _picture1 = value; }
public function get width1():int { return _width1; }
public function set width1(value:int):void { _width1 = value; }
public function get picture2():String { return _picture2; }
public function set picture2(value:String):void { _picture2 = value; }
public function get width2():int { return _width2; }
public function set width2(value:int):void { _width2 = value; }
public function get picture3():String { return _picture3; }
public function set picture3(value:String):void { _picture3 = value; }
public function get width3():int { return _width3; }
public function set width3(value:int):void { _width3 = value; }
public function get picture4():String { return _picture4; }
public function set picture4(value:String):void { _picture4 = value; }
public function get width4():int { return _width4; }
public function set width4(value:int):void { _width4 = value; }
public function get picture5():String { return _picture5; }
public function set picture5(value:String):void { _picture5 = value; }
public function get width5():int { return _width5; }
public function set width5(value:int):void { _width5 = value; }

public function readExternal(input:IDataInput):void {
text = input.readObject() as String;
picture1 = input.readObject() as String;
width1 = input.readInt();
picture2 = input.readObject() as String;
width2 = input.readInt();
picture3 = input.readObject() as String;
width3 = input.readInt();
picture4 = input.readObject() as String;
width4 = input.readInt();
picture5 = input.readObject() as String;
width5 = input.readInt();
}

public function writeExternal(output:IDataOutput):void {
output.writeObject(text);
output.writeObject(picture1);
output.writeInt(width1);
output.writeObject(picture2);
output.writeInt(width2);
output.writeObject(picture3);
output.writeInt(width3);
output.writeObject(picture4);
output.writeInt(width4);
output.writeObject(picture5);
output.writeInt(width5);
}
}
}
