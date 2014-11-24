package com.broceliand.pearlTree.io.object.tree {

import com.broceliand.pearlTree.io.object.user.UserData;
import com.broceliand.pearlTree.io.object.tree.PearlData;
import com.broceliand.pearlTree.io.object.tree.TreeData;
import com.broceliand.pearlTree.io.object.tree.TreeData;
import com.broceliand.pearlTree.io.object.tree.AssociationData;
import com.broceliand.pearlTree.io.object.tree.AssociationData;
import com.broceliand.pearlTree.io.object.tree.AssociationData;
import com.broceliand.pearlTree.io.object.tree.PearlData;
import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="TeamHistoryEvent")]
public class TeamHistoryEventData implements IExternalizable {

private var _type:int;
private var _user:com.broceliand.pearlTree.io.object.user.UserData;
private var _date:Number;
private var _pearl:com.broceliand.pearlTree.io.object.tree.PearlData;
private var _contentType:int;
private var _tree1:com.broceliand.pearlTree.io.object.tree.TreeData;
private var _tree2:com.broceliand.pearlTree.io.object.tree.TreeData;
private var _asso1:com.broceliand.pearlTree.io.object.tree.AssociationData;
private var _asso2:com.broceliand.pearlTree.io.object.tree.AssociationData;
private var _targetAsso:com.broceliand.pearlTree.io.object.tree.AssociationData;
private var _actionOrigin:int;
private var _originalId:int;
private var _targetPearl:com.broceliand.pearlTree.io.object.tree.PearlData;

public function get type():int { return _type; }
public function set type(value:int):void { _type = value; }
public function get user():com.broceliand.pearlTree.io.object.user.UserData { return _user; }
public function set user(value:com.broceliand.pearlTree.io.object.user.UserData):void { _user = value; }
public function get date():Number { return _date; }
public function set date(value:Number):void { _date = value; }
public function get pearl():com.broceliand.pearlTree.io.object.tree.PearlData { return _pearl; }
public function set pearl(value:com.broceliand.pearlTree.io.object.tree.PearlData):void { _pearl = value; }
public function get contentType():int { return _contentType; }
public function set contentType(value:int):void { _contentType = value; }
public function get tree1():com.broceliand.pearlTree.io.object.tree.TreeData { return _tree1; }
public function set tree1(value:com.broceliand.pearlTree.io.object.tree.TreeData):void { _tree1 = value; }
public function get tree2():com.broceliand.pearlTree.io.object.tree.TreeData { return _tree2; }
public function set tree2(value:com.broceliand.pearlTree.io.object.tree.TreeData):void { _tree2 = value; }
public function get asso1():com.broceliand.pearlTree.io.object.tree.AssociationData { return _asso1; }
public function set asso1(value:com.broceliand.pearlTree.io.object.tree.AssociationData):void { _asso1 = value; }
public function get asso2():com.broceliand.pearlTree.io.object.tree.AssociationData { return _asso2; }
public function set asso2(value:com.broceliand.pearlTree.io.object.tree.AssociationData):void { _asso2 = value; }
public function get targetAsso():com.broceliand.pearlTree.io.object.tree.AssociationData { return _targetAsso; }
public function set targetAsso(value:com.broceliand.pearlTree.io.object.tree.AssociationData):void { _targetAsso = value; }
public function get actionOrigin():int { return _actionOrigin; }
public function set actionOrigin(value:int):void { _actionOrigin = value; }
public function get originalId():int { return _originalId; }
public function set originalId(value:int):void { _originalId = value; }
public function get targetPearl():com.broceliand.pearlTree.io.object.tree.PearlData { return _targetPearl; }
public function set targetPearl(value:com.broceliand.pearlTree.io.object.tree.PearlData):void { _targetPearl = value; }

public function readExternal(input:IDataInput):void {
type = input.readInt();
user = input.readObject() as com.broceliand.pearlTree.io.object.user.UserData;
date = input.readDouble();
pearl = input.readObject() as com.broceliand.pearlTree.io.object.tree.PearlData;
contentType = input.readInt();
tree1 = input.readObject() as com.broceliand.pearlTree.io.object.tree.TreeData;
tree2 = input.readObject() as com.broceliand.pearlTree.io.object.tree.TreeData;
asso1 = input.readObject() as com.broceliand.pearlTree.io.object.tree.AssociationData;
asso2 = input.readObject() as com.broceliand.pearlTree.io.object.tree.AssociationData;
targetAsso = input.readObject() as com.broceliand.pearlTree.io.object.tree.AssociationData;
actionOrigin = input.readInt();
originalId = input.readInt();
targetPearl = input.readObject() as com.broceliand.pearlTree.io.object.tree.PearlData;
}

public function writeExternal(output:IDataOutput):void {
output.writeInt(type);
output.writeObject(user);
output.writeDouble(date);
output.writeObject(pearl);
output.writeInt(contentType);
output.writeObject(tree1);
output.writeObject(tree2);
output.writeObject(asso1);
output.writeObject(asso2);
output.writeObject(targetAsso);
output.writeInt(actionOrigin);
output.writeInt(originalId);
output.writeObject(targetPearl);
}
}
}
