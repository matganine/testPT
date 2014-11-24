package com.broceliand.pearlTree.io.object.note {

import com.broceliand.pearlTree.io.object.user.UserData;
import com.broceliand.pearlTree.io.object.tree.AssociationData;
import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="Notification")]
public class NotificationData implements IExternalizable {

private var _type:int;
private var _date:Number;
private var _containerType:int;
private var _containerId:int;
private var _treeContainerId:int;
private var _treeContainerTitle:String;
private var _containerAssociationOwner:int;
private var _containerTitle:String;
private var _feedId:int;
private var _aggregationKey:int;
private var _userTreeId:int;
private var _userPearlId:int;
private var _user1:com.broceliand.pearlTree.io.object.user.UserData;
private var _asso1:com.broceliand.pearlTree.io.object.tree.AssociationData;
private var _username2:String;
private var _baseDate:Number;
private var _pearlName:String;
private var _pearlCount:int;

public function get type():int { return _type; }
public function set type(value:int):void { _type = value; }
public function get date():Number { return _date; }
public function set date(value:Number):void { _date = value; }
public function get containerType():int { return _containerType; }
public function set containerType(value:int):void { _containerType = value; }
public function get containerId():int { return _containerId; }
public function set containerId(value:int):void { _containerId = value; }
public function get treeContainerId():int { return _treeContainerId; }
public function set treeContainerId(value:int):void { _treeContainerId = value; }
public function get treeContainerTitle():String { return _treeContainerTitle; }
public function set treeContainerTitle(value:String):void { _treeContainerTitle = value; }
public function get containerAssociationOwner():int { return _containerAssociationOwner; }
public function set containerAssociationOwner(value:int):void { _containerAssociationOwner = value; }
public function get containerTitle():String { return _containerTitle; }
public function set containerTitle(value:String):void { _containerTitle = value; }
public function get feedId():int { return _feedId; }
public function set feedId(value:int):void { _feedId = value; }
public function get aggregationKey():int { return _aggregationKey; }
public function set aggregationKey(value:int):void { _aggregationKey = value; }
public function get userTreeId():int { return _userTreeId; }
public function set userTreeId(value:int):void { _userTreeId = value; }
public function get userPearlId():int { return _userPearlId; }
public function set userPearlId(value:int):void { _userPearlId = value; }
public function get user1():com.broceliand.pearlTree.io.object.user.UserData { return _user1; }
public function set user1(value:com.broceliand.pearlTree.io.object.user.UserData):void { _user1 = value; }
public function get asso1():com.broceliand.pearlTree.io.object.tree.AssociationData { return _asso1; }
public function set asso1(value:com.broceliand.pearlTree.io.object.tree.AssociationData):void { _asso1 = value; }
public function get username2():String { return _username2; }
public function set username2(value:String):void { _username2 = value; }
public function get baseDate():Number { return _baseDate; }
public function set baseDate(value:Number):void { _baseDate = value; }
public function get pearlName():String { return _pearlName; }
public function set pearlName(value:String):void { _pearlName = value; }
public function get pearlCount():int { return _pearlCount; }
public function set pearlCount(value:int):void { _pearlCount = value; }

public function readExternal(input:IDataInput):void {
type = input.readInt();
date = input.readDouble();
containerType = input.readInt();
containerId = input.readInt();
treeContainerId = input.readInt();
treeContainerTitle = input.readObject() as String;
containerAssociationOwner = input.readInt();
containerTitle = input.readObject() as String;
feedId = input.readInt();
aggregationKey = input.readInt();
userTreeId = input.readInt();
userPearlId = input.readInt();
user1 = input.readObject() as com.broceliand.pearlTree.io.object.user.UserData;
asso1 = input.readObject() as com.broceliand.pearlTree.io.object.tree.AssociationData;
username2 = input.readObject() as String;
baseDate = input.readDouble();
pearlName = input.readObject() as String;
pearlCount = input.readInt();
}

public function writeExternal(output:IDataOutput):void {
output.writeInt(type);
output.writeDouble(date);
output.writeInt(containerType);
output.writeInt(containerId);
output.writeInt(treeContainerId);
output.writeObject(treeContainerTitle);
output.writeInt(containerAssociationOwner);
output.writeObject(containerTitle);
output.writeInt(feedId);
output.writeInt(aggregationKey);
output.writeInt(userTreeId);
output.writeInt(userPearlId);
output.writeObject(user1);
output.writeObject(asso1);
output.writeObject(username2);
output.writeDouble(baseDate);
output.writeObject(pearlName);
output.writeInt(pearlCount);
}
}
}
