package com.broceliand.pearlTree.io.object.premium {

import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="AndroidViewPortController")]
public class AndroidViewPortControllerData implements IExternalizable {

private var _width:int;
private var _height:int;
private var _paddingLeft:int;
private var _paddingTop:int;
private var _paddingRight:int;
private var _paddingBottom:int;

public function get width():int { return _width; }
public function set width(value:int):void { _width = value; }
public function get height():int { return _height; }
public function set height(value:int):void { _height = value; }
public function get paddingLeft():int { return _paddingLeft; }
public function set paddingLeft(value:int):void { _paddingLeft = value; }
public function get paddingTop():int { return _paddingTop; }
public function set paddingTop(value:int):void { _paddingTop = value; }
public function get paddingRight():int { return _paddingRight; }
public function set paddingRight(value:int):void { _paddingRight = value; }
public function get paddingBottom():int { return _paddingBottom; }
public function set paddingBottom(value:int):void { _paddingBottom = value; }

public function readExternal(input:IDataInput):void {
width = input.readInt();
height = input.readInt();
paddingLeft = input.readInt();
paddingTop = input.readInt();
paddingRight = input.readInt();
paddingBottom = input.readInt();
}

public function writeExternal(output:IDataOutput):void {
output.writeInt(width);
output.writeInt(height);
output.writeInt(paddingLeft);
output.writeInt(paddingTop);
output.writeInt(paddingRight);
output.writeInt(paddingBottom);
}
}
}
