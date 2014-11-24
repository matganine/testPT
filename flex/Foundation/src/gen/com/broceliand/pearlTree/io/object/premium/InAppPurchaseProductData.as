package com.broceliand.pearlTree.io.object.premium {

import flash.utils.IExternalizable;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

[RemoteClass(alias="InAppPurchaseProduct")]
public class InAppPurchaseProductData implements IExternalizable {

private var _title:String;
private var _productID:String;
private var _countries:Array;
private var _visualPrice:String;
private var _htmlPriceId:String;
private var _htmlActionId:String;
private var _level:int;

public function get title():String { return _title; }
public function set title(value:String):void { _title = value; }
public function get productID():String { return _productID; }
public function set productID(value:String):void { _productID = value; }
public function get countries():Array { return _countries; }
public function set countries(value:Array):void { _countries = value; }
public function get visualPrice():String { return _visualPrice; }
public function set visualPrice(value:String):void { _visualPrice = value; }
public function get htmlPriceId():String { return _htmlPriceId; }
public function set htmlPriceId(value:String):void { _htmlPriceId = value; }
public function get htmlActionId():String { return _htmlActionId; }
public function set htmlActionId(value:String):void { _htmlActionId = value; }
public function get level():int { return _level; }
public function set level(value:int):void { _level = value; }

public function readExternal(input:IDataInput):void {
title = input.readObject() as String;
productID = input.readObject() as String;
countries = input.readObject() as Array;
visualPrice = input.readObject() as String;
htmlPriceId = input.readObject() as String;
htmlActionId = input.readObject() as String;
level = input.readInt();
}

public function writeExternal(output:IDataOutput):void {
output.writeObject(title);
output.writeObject(productID);
output.writeObject(countries);
output.writeObject(visualPrice);
output.writeObject(htmlPriceId);
output.writeObject(htmlActionId);
output.writeInt(level);
}
}
}
