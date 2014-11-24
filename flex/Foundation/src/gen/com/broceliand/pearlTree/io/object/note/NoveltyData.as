package com.broceliand.pearlTree.io.object.note {

import com.broceliand.pearlTree.io.object.tree.PearlData;
import com.broceliand.pearlTree.io.object.tree.TreeData;
import com.broceliand.pearlTree.io.object.note.PageContentData;
import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="Novelty")]
public class NoveltyData implements IExternalizable {

private var _type:int;
private var _containerId:int;
private var _oldest:Number;
private var _pearl:com.broceliand.pearlTree.io.object.tree.PearlData;
private var _pearlCount:int;
private var _navTree:com.broceliand.pearlTree.io.object.tree.TreeData;
private var _layout:int;
private var _content:com.broceliand.pearlTree.io.object.note.PageContentData;
private var _documentType:int;

public function get type():int { return _type; }
public function set type(value:int):void { _type = value; }
public function get containerId():int { return _containerId; }
public function set containerId(value:int):void { _containerId = value; }
public function get oldest():Number { return _oldest; }
public function set oldest(value:Number):void { _oldest = value; }
public function get pearl():com.broceliand.pearlTree.io.object.tree.PearlData { return _pearl; }
public function set pearl(value:com.broceliand.pearlTree.io.object.tree.PearlData):void { _pearl = value; }
public function get pearlCount():int { return _pearlCount; }
public function set pearlCount(value:int):void { _pearlCount = value; }
public function get navTree():com.broceliand.pearlTree.io.object.tree.TreeData { return _navTree; }
public function set navTree(value:com.broceliand.pearlTree.io.object.tree.TreeData):void { _navTree = value; }
public function get layout():int { return _layout; }
public function set layout(value:int):void { _layout = value; }
public function get content():com.broceliand.pearlTree.io.object.note.PageContentData { return _content; }
public function set content(value:com.broceliand.pearlTree.io.object.note.PageContentData):void { _content = value; }
public function get documentType():int { return _documentType; }
public function set documentType(value:int):void { _documentType = value; }

public function readExternal(input:IDataInput):void {
type = input.readInt();
containerId = input.readInt();
oldest = input.readDouble();
pearl = input.readObject() as com.broceliand.pearlTree.io.object.tree.PearlData;
pearlCount = input.readInt();
navTree = input.readObject() as com.broceliand.pearlTree.io.object.tree.TreeData;
layout = input.readInt();
content = input.readObject() as com.broceliand.pearlTree.io.object.note.PageContentData;
documentType = input.readInt();
}

public function writeExternal(output:IDataOutput):void {
output.writeInt(type);
output.writeInt(containerId);
output.writeDouble(oldest);
output.writeObject(pearl);
output.writeInt(pearlCount);
output.writeObject(navTree);
output.writeInt(layout);
output.writeObject(content);
output.writeInt(documentType);
}
}
}
