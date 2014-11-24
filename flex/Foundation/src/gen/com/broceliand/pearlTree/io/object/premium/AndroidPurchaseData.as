package com.broceliand.pearlTree.io.object.premium {

import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="AndroidPurchase")]
public class AndroidPurchaseData implements IExternalizable {

private var _purchaseId:String;
private var _htmlPriceId:String;
private var _level:int;

public function get purchaseId():String { return _purchaseId; }
public function set purchaseId(value:String):void { _purchaseId = value; }
public function get htmlPriceId():String { return _htmlPriceId; }
public function set htmlPriceId(value:String):void { _htmlPriceId = value; }
public function get level():int { return _level; }
public function set level(value:int):void { _level = value; }

public function readExternal(input:IDataInput):void {
purchaseId = input.readObject() as String;
htmlPriceId = input.readObject() as String;
level = input.readInt();
}

public function writeExternal(output:IDataOutput):void {
output.writeObject(purchaseId);
output.writeObject(htmlPriceId);
output.writeInt(level);
}
}
}
