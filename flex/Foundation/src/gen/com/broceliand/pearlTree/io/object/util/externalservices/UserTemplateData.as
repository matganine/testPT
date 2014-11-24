package com.broceliand.pearlTree.io.object.util.externalservices {

import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="UserTemplate")]
public class UserTemplateData implements IExternalizable {

private var _userName:String;
private var _originalName:String;
private var _email:String;
private var _location:String;
private var _realName:String;
private var _webSite:String;
private var _bio:String;
private var _locale:int;
private var _avatarUrl:String;
private var _permission:int;

public function get userName():String { return _userName; }
public function set userName(value:String):void { _userName = value; }
public function get originalName():String { return _originalName; }
public function set originalName(value:String):void { _originalName = value; }
public function get email():String { return _email; }
public function set email(value:String):void { _email = value; }
public function get location():String { return _location; }
public function set location(value:String):void { _location = value; }
public function get realName():String { return _realName; }
public function set realName(value:String):void { _realName = value; }
public function get webSite():String { return _webSite; }
public function set webSite(value:String):void { _webSite = value; }
public function get bio():String { return _bio; }
public function set bio(value:String):void { _bio = value; }
public function get locale():int { return _locale; }
public function set locale(value:int):void { _locale = value; }
public function get avatarUrl():String { return _avatarUrl; }
public function set avatarUrl(value:String):void { _avatarUrl = value; }
public function get permission():int { return _permission; }
public function set permission(value:int):void { _permission = value; }

public function readExternal(input:IDataInput):void {
userName = input.readObject() as String;
originalName = input.readObject() as String;
email = input.readObject() as String;
location = input.readObject() as String;
realName = input.readObject() as String;
webSite = input.readObject() as String;
bio = input.readObject() as String;
locale = input.readInt();
avatarUrl = input.readObject() as String;
permission = input.readInt();
}

public function writeExternal(output:IDataOutput):void {
output.writeObject(userName);
output.writeObject(originalName);
output.writeObject(email);
output.writeObject(location);
output.writeObject(realName);
output.writeObject(webSite);
output.writeObject(bio);
output.writeInt(locale);
output.writeObject(avatarUrl);
output.writeInt(permission);
}
}
}
