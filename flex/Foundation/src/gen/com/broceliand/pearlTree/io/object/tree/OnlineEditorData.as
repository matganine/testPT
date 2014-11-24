package com.broceliand.pearlTree.io.object.tree {

import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="OnlineEditor")]
public class OnlineEditorData implements IExternalizable {

private var _userId:int;
private var _assoId:int;
private var _lastSeen:Number;
private var _selectedTreeId:int;

public function get userId():int { return _userId; }
public function set userId(value:int):void { _userId = value; }
public function get assoId():int { return _assoId; }
public function set assoId(value:int):void { _assoId = value; }
public function get lastSeen():Number { return _lastSeen; }
public function set lastSeen(value:Number):void { _lastSeen = value; }
public function get selectedTreeId():int { return _selectedTreeId; }
public function set selectedTreeId(value:int):void { _selectedTreeId = value; }

public function readExternal(input:IDataInput):void {
userId = input.readInt();
assoId = input.readInt();
lastSeen = input.readDouble();
selectedTreeId = input.readInt();
}

public function writeExternal(output:IDataOutput):void {
output.writeInt(userId);
output.writeInt(assoId);
output.writeDouble(lastSeen);
output.writeInt(selectedTreeId);
}
}
}
