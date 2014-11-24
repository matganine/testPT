package com.broceliand.pearlTree.io.object.util.paginatedlist {

import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="PaginatedList")]
public class PaginatedListData implements IExternalizable {

private var _pageNumber:int;
private var _limit:Array;
private var _nonLoadedNumber:int;
private var _newestItemDate:Number;
private var _oldestItemDate:Number;

public function get pageNumber():int { return _pageNumber; }
public function set pageNumber(value:int):void { _pageNumber = value; }
public function get limit():Array { return _limit; }
public function set limit(value:Array):void { _limit = value; }
public function get nonLoadedNumber():int { return _nonLoadedNumber; }
public function set nonLoadedNumber(value:int):void { _nonLoadedNumber = value; }
public function get newestItemDate():Number { return _newestItemDate; }
public function set newestItemDate(value:Number):void { _newestItemDate = value; }
public function get oldestItemDate():Number { return _oldestItemDate; }
public function set oldestItemDate(value:Number):void { _oldestItemDate = value; }

public function readExternal(input:IDataInput):void {
pageNumber = input.readInt();
limit = input.readObject() as Array;
nonLoadedNumber = input.readInt();
newestItemDate = input.readDouble();
oldestItemDate = input.readDouble();
}

public function writeExternal(output:IDataOutput):void {
output.writeInt(pageNumber);
output.writeObject(limit);
output.writeInt(nonLoadedNumber);
output.writeDouble(newestItemDate);
output.writeDouble(oldestItemDate);
}
}
}
