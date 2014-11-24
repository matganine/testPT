package com.broceliand.pearlTree.io.object.note {

import com.broceliand.pearlTree.io.object.tree.TreeData;
import com.broceliand.pearlTree.io.object.user.UserData;
import com.broceliand.pearlTree.io.object.tree.AssociationData;
import com.broceliand.pearlTree.io.object.tree.TreeData;
import com.broceliand.pearlTree.io.object.tree.PearlData;
import com.broceliand.pearlTree.io.object.user.UserData;
import com.broceliand.pearlTree.io.object.tree.AssociationData;
import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="Notif")]
public class NotifData implements IExternalizable {

private var _id:flash.utils.ByteArray;
private var _date:Number;
private var _state:int;
private var _type:int;
private var _message:String;
private var _avatarHash:flash.utils.ByteArray;
private var _mainId:int;
private var _main:com.broceliand.pearlTree.io.object.tree.TreeData;
private var _userId:int;
private var _user:com.broceliand.pearlTree.io.object.user.UserData;
private var _assoId:int;
private var _asso:com.broceliand.pearlTree.io.object.tree.AssociationData;
private var _treeId:int;
private var _tree:com.broceliand.pearlTree.io.object.tree.TreeData;
private var _pearlId:int;
private var _pearl:com.broceliand.pearlTree.io.object.tree.PearlData;
private var _user2Id:int;
private var _user2:com.broceliand.pearlTree.io.object.user.UserData;
private var _asso2Id:int;
private var _asso2:com.broceliand.pearlTree.io.object.tree.AssociationData;
private var _key:String;
private var _navAssoId:int;
private var _navUserId:int;
private var _navTreeId:int;
private var _navPearlId:int;
private var _navNoteId:int;
private var _navTeamRequestId:int;
private var _navType:int;
private var _navString:String;
private var _folded:Array;

public function get id():flash.utils.ByteArray { return _id; }
public function set id(value:flash.utils.ByteArray):void { _id = value; }
public function get date():Number { return _date; }
public function set date(value:Number):void { _date = value; }
public function get state():int { return _state; }
public function set state(value:int):void { _state = value; }
public function get type():int { return _type; }
public function set type(value:int):void { _type = value; }
public function get message():String { return _message; }
public function set message(value:String):void { _message = value; }
public function get avatarHash():flash.utils.ByteArray { return _avatarHash; }
public function set avatarHash(value:flash.utils.ByteArray):void { _avatarHash = value; }
public function get mainId():int { return _mainId; }
public function set mainId(value:int):void { _mainId = value; }
public function get main():com.broceliand.pearlTree.io.object.tree.TreeData { return _main; }
public function set main(value:com.broceliand.pearlTree.io.object.tree.TreeData):void { _main = value; }
public function get userId():int { return _userId; }
public function set userId(value:int):void { _userId = value; }
public function get user():com.broceliand.pearlTree.io.object.user.UserData { return _user; }
public function set user(value:com.broceliand.pearlTree.io.object.user.UserData):void { _user = value; }
public function get assoId():int { return _assoId; }
public function set assoId(value:int):void { _assoId = value; }
public function get asso():com.broceliand.pearlTree.io.object.tree.AssociationData { return _asso; }
public function set asso(value:com.broceliand.pearlTree.io.object.tree.AssociationData):void { _asso = value; }
public function get treeId():int { return _treeId; }
public function set treeId(value:int):void { _treeId = value; }
public function get tree():com.broceliand.pearlTree.io.object.tree.TreeData { return _tree; }
public function set tree(value:com.broceliand.pearlTree.io.object.tree.TreeData):void { _tree = value; }
public function get pearlId():int { return _pearlId; }
public function set pearlId(value:int):void { _pearlId = value; }
public function get pearl():com.broceliand.pearlTree.io.object.tree.PearlData { return _pearl; }
public function set pearl(value:com.broceliand.pearlTree.io.object.tree.PearlData):void { _pearl = value; }
public function get user2Id():int { return _user2Id; }
public function set user2Id(value:int):void { _user2Id = value; }
public function get user2():com.broceliand.pearlTree.io.object.user.UserData { return _user2; }
public function set user2(value:com.broceliand.pearlTree.io.object.user.UserData):void { _user2 = value; }
public function get asso2Id():int { return _asso2Id; }
public function set asso2Id(value:int):void { _asso2Id = value; }
public function get asso2():com.broceliand.pearlTree.io.object.tree.AssociationData { return _asso2; }
public function set asso2(value:com.broceliand.pearlTree.io.object.tree.AssociationData):void { _asso2 = value; }
public function get key():String { return _key; }
public function set key(value:String):void { _key = value; }
public function get navAssoId():int { return _navAssoId; }
public function set navAssoId(value:int):void { _navAssoId = value; }
public function get navUserId():int { return _navUserId; }
public function set navUserId(value:int):void { _navUserId = value; }
public function get navTreeId():int { return _navTreeId; }
public function set navTreeId(value:int):void { _navTreeId = value; }
public function get navPearlId():int { return _navPearlId; }
public function set navPearlId(value:int):void { _navPearlId = value; }
public function get navNoteId():int { return _navNoteId; }
public function set navNoteId(value:int):void { _navNoteId = value; }
public function get navTeamRequestId():int { return _navTeamRequestId; }
public function set navTeamRequestId(value:int):void { _navTeamRequestId = value; }
public function get navType():int { return _navType; }
public function set navType(value:int):void { _navType = value; }
public function get navString():String { return _navString; }
public function set navString(value:String):void { _navString = value; }
public function get folded():Array { return _folded; }
public function set folded(value:Array):void { _folded = value; }

public function readExternal(input:IDataInput):void {
id = input.readObject() as flash.utils.ByteArray;
date = input.readDouble();
state = input.readInt();
type = input.readInt();
message = input.readObject() as String;
avatarHash = input.readObject() as flash.utils.ByteArray;
mainId = input.readInt();
main = input.readObject() as com.broceliand.pearlTree.io.object.tree.TreeData;
userId = input.readInt();
user = input.readObject() as com.broceliand.pearlTree.io.object.user.UserData;
assoId = input.readInt();
asso = input.readObject() as com.broceliand.pearlTree.io.object.tree.AssociationData;
treeId = input.readInt();
tree = input.readObject() as com.broceliand.pearlTree.io.object.tree.TreeData;
pearlId = input.readInt();
pearl = input.readObject() as com.broceliand.pearlTree.io.object.tree.PearlData;
user2Id = input.readInt();
user2 = input.readObject() as com.broceliand.pearlTree.io.object.user.UserData;
asso2Id = input.readInt();
asso2 = input.readObject() as com.broceliand.pearlTree.io.object.tree.AssociationData;
key = input.readObject() as String;
navAssoId = input.readInt();
navUserId = input.readInt();
navTreeId = input.readInt();
navPearlId = input.readInt();
navNoteId = input.readInt();
navTeamRequestId = input.readInt();
navType = input.readInt();
navString = input.readObject() as String;
folded = input.readObject() as Array;
}

public function writeExternal(output:IDataOutput):void {
output.writeObject(id);
output.writeDouble(date);
output.writeInt(state);
output.writeInt(type);
output.writeObject(message);
output.writeObject(avatarHash);
output.writeInt(mainId);
output.writeObject(main);
output.writeInt(userId);
output.writeObject(user);
output.writeInt(assoId);
output.writeObject(asso);
output.writeInt(treeId);
output.writeObject(tree);
output.writeInt(pearlId);
output.writeObject(pearl);
output.writeInt(user2Id);
output.writeObject(user2);
output.writeInt(asso2Id);
output.writeObject(asso2);
output.writeObject(key);
output.writeInt(navAssoId);
output.writeInt(navUserId);
output.writeInt(navTreeId);
output.writeInt(navPearlId);
output.writeInt(navNoteId);
output.writeInt(navTeamRequestId);
output.writeInt(navType);
output.writeObject(navString);
output.writeObject(folded);
}
}
}
