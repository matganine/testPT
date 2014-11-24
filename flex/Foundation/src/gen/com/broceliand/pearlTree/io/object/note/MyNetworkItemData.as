package com.broceliand.pearlTree.io.object.note {

import com.broceliand.pearlTree.io.object.tree.PearlData;
import com.broceliand.pearlTree.io.object.note.NotifData;
import com.broceliand.pearlTree.io.object.note.NoveltyData;
import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="MyNetworkItem")]
public class MyNetworkItemData implements IExternalizable {

private var _id:int;
private var _type:int;
private var _state:int;
private var _date:Number;
private var _avatarHash:flash.utils.ByteArray;
private var _title:String;
private var _fakePearl:com.broceliand.pearlTree.io.object.tree.PearlData;
private var _category:int;
private var _aggregated:Array;
private var _targetTreeId:int;
private var _targetPearlId:int;
private var _teamRequestId:int;
private var _notifAssociated:com.broceliand.pearlTree.io.object.note.NotifData;
private var _noveltyAssociated:com.broceliand.pearlTree.io.object.note.NoveltyData;
private var _permissionKey:String;
private var _genericRenderedId:int;
private var _textContent:String;

public function get id():int { return _id; }
public function set id(value:int):void { _id = value; }
public function get type():int { return _type; }
public function set type(value:int):void { _type = value; }
public function get state():int { return _state; }
public function set state(value:int):void { _state = value; }
public function get date():Number { return _date; }
public function set date(value:Number):void { _date = value; }
public function get avatarHash():flash.utils.ByteArray { return _avatarHash; }
public function set avatarHash(value:flash.utils.ByteArray):void { _avatarHash = value; }
public function get title():String { return _title; }
public function set title(value:String):void { _title = value; }
public function get fakePearl():com.broceliand.pearlTree.io.object.tree.PearlData { return _fakePearl; }
public function set fakePearl(value:com.broceliand.pearlTree.io.object.tree.PearlData):void { _fakePearl = value; }
public function get category():int { return _category; }
public function set category(value:int):void { _category = value; }
public function get aggregated():Array { return _aggregated; }
public function set aggregated(value:Array):void { _aggregated = value; }
public function get targetTreeId():int { return _targetTreeId; }
public function set targetTreeId(value:int):void { _targetTreeId = value; }
public function get targetPearlId():int { return _targetPearlId; }
public function set targetPearlId(value:int):void { _targetPearlId = value; }
public function get teamRequestId():int { return _teamRequestId; }
public function set teamRequestId(value:int):void { _teamRequestId = value; }
public function get notifAssociated():com.broceliand.pearlTree.io.object.note.NotifData { return _notifAssociated; }
public function set notifAssociated(value:com.broceliand.pearlTree.io.object.note.NotifData):void { _notifAssociated = value; }
public function get noveltyAssociated():com.broceliand.pearlTree.io.object.note.NoveltyData { return _noveltyAssociated; }
public function set noveltyAssociated(value:com.broceliand.pearlTree.io.object.note.NoveltyData):void { _noveltyAssociated = value; }
public function get permissionKey():String { return _permissionKey; }
public function set permissionKey(value:String):void { _permissionKey = value; }
public function get genericRenderedId():int { return _genericRenderedId; }
public function set genericRenderedId(value:int):void { _genericRenderedId = value; }
public function get textContent():String { return _textContent; }
public function set textContent(value:String):void { _textContent = value; }

public function readExternal(input:IDataInput):void {
id = input.readInt();
type = input.readInt();
state = input.readInt();
date = input.readDouble();
avatarHash = input.readObject() as flash.utils.ByteArray;
title = input.readObject() as String;
fakePearl = input.readObject() as com.broceliand.pearlTree.io.object.tree.PearlData;
category = input.readInt();
aggregated = input.readObject() as Array;
targetTreeId = input.readInt();
targetPearlId = input.readInt();
teamRequestId = input.readInt();
notifAssociated = input.readObject() as com.broceliand.pearlTree.io.object.note.NotifData;
noveltyAssociated = input.readObject() as com.broceliand.pearlTree.io.object.note.NoveltyData;
permissionKey = input.readObject() as String;
genericRenderedId = input.readInt();
textContent = input.readObject() as String;
}

public function writeExternal(output:IDataOutput):void {
output.writeInt(id);
output.writeInt(type);
output.writeInt(state);
output.writeDouble(date);
output.writeObject(avatarHash);
output.writeObject(title);
output.writeObject(fakePearl);
output.writeInt(category);
output.writeObject(aggregated);
output.writeInt(targetTreeId);
output.writeInt(targetPearlId);
output.writeInt(teamRequestId);
output.writeObject(notifAssociated);
output.writeObject(noveltyAssociated);
output.writeObject(permissionKey);
output.writeInt(genericRenderedId);
output.writeObject(textContent);
}
}
}
