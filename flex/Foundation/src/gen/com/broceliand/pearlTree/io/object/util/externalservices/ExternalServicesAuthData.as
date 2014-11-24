package com.broceliand.pearlTree.io.object.util.externalservices {

import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="ExternalServicesAuth")]
public class ExternalServicesAuthData implements IExternalizable {

private var _userId:int;
private var _service:int;
private var _status:int;
private var _requestToken:String;
private var _authUrl:String;

public function get userId():int { return _userId; }
public function set userId(value:int):void { _userId = value; }
public function get service():int { return _service; }
public function set service(value:int):void { _service = value; }
public function get status():int { return _status; }
public function set status(value:int):void { _status = value; }
public function get requestToken():String { return _requestToken; }
public function set requestToken(value:String):void { _requestToken = value; }
public function get authUrl():String { return _authUrl; }
public function set authUrl(value:String):void { _authUrl = value; }

public function readExternal(input:IDataInput):void {
userId = input.readInt();
service = input.readInt();
status = input.readInt();
requestToken = input.readObject() as String;
authUrl = input.readObject() as String;
}

public function writeExternal(output:IDataOutput):void {
output.writeInt(userId);
output.writeInt(service);
output.writeInt(status);
output.writeObject(requestToken);
output.writeObject(authUrl);
}
}
}
