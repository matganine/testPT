package com.broceliand.pearlTree.io.object.tree.sync {

import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="UserSyncOutput")]
public class UserSyncOutputData implements IExternalizable {

private var _movedOutOfDropZone:Array;
private var _updatedRights:Array;
private var _currentTreeHierarchy:Array;
private var _currentRepresentativePearls:Array;
private var _lastRightsUpdate:Number;

public function get movedOutOfDropZone():Array { return _movedOutOfDropZone; }
public function set movedOutOfDropZone(value:Array):void { _movedOutOfDropZone = value; }
public function get updatedRights():Array { return _updatedRights; }
public function set updatedRights(value:Array):void { _updatedRights = value; }
public function get currentTreeHierarchy():Array { return _currentTreeHierarchy; }
public function set currentTreeHierarchy(value:Array):void { _currentTreeHierarchy = value; }
public function get currentRepresentativePearls():Array { return _currentRepresentativePearls; }
public function set currentRepresentativePearls(value:Array):void { _currentRepresentativePearls = value; }
public function get lastRightsUpdate():Number { return _lastRightsUpdate; }
public function set lastRightsUpdate(value:Number):void { _lastRightsUpdate = value; }

public function readExternal(input:IDataInput):void {
movedOutOfDropZone = input.readObject() as Array;
updatedRights = input.readObject() as Array;
currentTreeHierarchy = input.readObject() as Array;
currentRepresentativePearls = input.readObject() as Array;
lastRightsUpdate = input.readDouble();
}

public function writeExternal(output:IDataOutput):void {
output.writeObject(movedOutOfDropZone);
output.writeObject(updatedRights);
output.writeObject(currentTreeHierarchy);
output.writeObject(currentRepresentativePearls);
output.writeDouble(lastRightsUpdate);
}
}
}
