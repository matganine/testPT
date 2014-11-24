package com.broceliand.pearlTree.io.object.note {

import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="NoteSubscriber")]
public class NoteSubscriberData implements IExternalizable {

private var _userId:int;
private var _streamId:int;
private var _streamType:int;

public function get userId():int { return _userId; }
public function set userId(value:int):void { _userId = value; }
public function get streamId():int { return _streamId; }
public function set streamId(value:int):void { _streamId = value; }
public function get streamType():int { return _streamType; }
public function set streamType(value:int):void { _streamType = value; }

public function readExternal(input:IDataInput):void {
userId = input.readInt();
streamId = input.readInt();
streamType = input.readInt();
}

public function writeExternal(output:IDataOutput):void {
output.writeInt(userId);
output.writeInt(streamId);
output.writeInt(streamType);
}
}
}
