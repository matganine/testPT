package com.broceliand.pearlTree.io.object.note {

import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="FeedNotificationsState")]
public class FeedNotificationsStateData implements IExternalizable {

private var _noteLimit:Number;
private var _neighbourLimit:Number;
private var _teamDiscussionLimit:Number;
private var _teamEditoLimit:Number;
private var _privateMsgLimit:Number;
private var _nonLoadedNumber:int;

public function get noteLimit():Number { return _noteLimit; }
public function set noteLimit(value:Number):void { _noteLimit = value; }
public function get neighbourLimit():Number { return _neighbourLimit; }
public function set neighbourLimit(value:Number):void { _neighbourLimit = value; }
public function get teamDiscussionLimit():Number { return _teamDiscussionLimit; }
public function set teamDiscussionLimit(value:Number):void { _teamDiscussionLimit = value; }
public function get teamEditoLimit():Number { return _teamEditoLimit; }
public function set teamEditoLimit(value:Number):void { _teamEditoLimit = value; }
public function get privateMsgLimit():Number { return _privateMsgLimit; }
public function set privateMsgLimit(value:Number):void { _privateMsgLimit = value; }
public function get nonLoadedNumber():int { return _nonLoadedNumber; }
public function set nonLoadedNumber(value:int):void { _nonLoadedNumber = value; }

public function readExternal(input:IDataInput):void {
noteLimit = input.readDouble();
neighbourLimit = input.readDouble();
teamDiscussionLimit = input.readDouble();
teamEditoLimit = input.readDouble();
privateMsgLimit = input.readDouble();
nonLoadedNumber = input.readInt();
}

public function writeExternal(output:IDataOutput):void {
output.writeDouble(noteLimit);
output.writeDouble(neighbourLimit);
output.writeDouble(teamDiscussionLimit);
output.writeDouble(teamEditoLimit);
output.writeDouble(privateMsgLimit);
output.writeInt(nonLoadedNumber);
}
}
}
