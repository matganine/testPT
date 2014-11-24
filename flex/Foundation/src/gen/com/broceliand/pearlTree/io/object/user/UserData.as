package com.broceliand.pearlTree.io.object.user {

import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="User")]
public class UserData implements IExternalizable {

private var _id:int;
private var _userName:String;
private var _creationDate:Number;
private var _rootTreeId:int;
private var _rootPearlId:int;
private var _dropZoneTreeId:int;
private var _state:int;
private var _location:String;
private var _realName:String;
private var _webSite:String;
private var _bio:String;
private var _avatarHash:flash.utils.ByteArray;
private var _lastVisit:Number;
private var _locale:int;
private var _feedNotifAck:Number;
private var _feedNotifLastSeenAck:Number;
private var _structureLastSeenAck:Number;
private var _isPremium:int;
private var _premiumLevel:int;

public function get id():int { return _id; }
public function set id(value:int):void { _id = value; }
public function get userName():String { return _userName; }
public function set userName(value:String):void { _userName = value; }
public function get creationDate():Number { return _creationDate; }
public function set creationDate(value:Number):void { _creationDate = value; }
public function get rootTreeId():int { return _rootTreeId; }
public function set rootTreeId(value:int):void { _rootTreeId = value; }
public function get rootPearlId():int { return _rootPearlId; }
public function set rootPearlId(value:int):void { _rootPearlId = value; }
public function get dropZoneTreeId():int { return _dropZoneTreeId; }
public function set dropZoneTreeId(value:int):void { _dropZoneTreeId = value; }
public function get state():int { return _state; }
public function set state(value:int):void { _state = value; }
public function get location():String { return _location; }
public function set location(value:String):void { _location = value; }
public function get realName():String { return _realName; }
public function set realName(value:String):void { _realName = value; }
public function get webSite():String { return _webSite; }
public function set webSite(value:String):void { _webSite = value; }
public function get bio():String { return _bio; }
public function set bio(value:String):void { _bio = value; }
public function get avatarHash():flash.utils.ByteArray { return _avatarHash; }
public function set avatarHash(value:flash.utils.ByteArray):void { _avatarHash = value; }
public function get lastVisit():Number { return _lastVisit; }
public function set lastVisit(value:Number):void { _lastVisit = value; }
public function get locale():int { return _locale; }
public function set locale(value:int):void { _locale = value; }
public function get feedNotifAck():Number { return _feedNotifAck; }
public function set feedNotifAck(value:Number):void { _feedNotifAck = value; }
public function get feedNotifLastSeenAck():Number { return _feedNotifLastSeenAck; }
public function set feedNotifLastSeenAck(value:Number):void { _feedNotifLastSeenAck = value; }
public function get structureLastSeenAck():Number { return _structureLastSeenAck; }
public function set structureLastSeenAck(value:Number):void { _structureLastSeenAck = value; }
public function get isPremium():int { return _isPremium; }
public function set isPremium(value:int):void { _isPremium = value; }
public function get premiumLevel():int { return _premiumLevel; }
public function set premiumLevel(value:int):void { _premiumLevel = value; }

public function readExternal(input:IDataInput):void {
id = input.readInt();
userName = input.readObject() as String;
creationDate = input.readDouble();
rootTreeId = input.readInt();
rootPearlId = input.readInt();
dropZoneTreeId = input.readInt();
state = input.readInt();
location = input.readObject() as String;
realName = input.readObject() as String;
webSite = input.readObject() as String;
bio = input.readObject() as String;
avatarHash = input.readObject() as flash.utils.ByteArray;
lastVisit = input.readDouble();
locale = input.readInt();
feedNotifAck = input.readDouble();
feedNotifLastSeenAck = input.readDouble();
structureLastSeenAck = input.readDouble();
isPremium = input.readInt();
premiumLevel = input.readInt();
}

public function writeExternal(output:IDataOutput):void {
output.writeInt(id);
output.writeObject(userName);
output.writeDouble(creationDate);
output.writeInt(rootTreeId);
output.writeInt(rootPearlId);
output.writeInt(dropZoneTreeId);
output.writeInt(state);
output.writeObject(location);
output.writeObject(realName);
output.writeObject(webSite);
output.writeObject(bio);
output.writeObject(avatarHash);
output.writeDouble(lastVisit);
output.writeInt(locale);
output.writeDouble(feedNotifAck);
output.writeDouble(feedNotifLastSeenAck);
output.writeDouble(structureLastSeenAck);
output.writeInt(isPremium);
output.writeInt(premiumLevel);
}
}
}
