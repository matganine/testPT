package com.broceliand.ui.list
{
import flash.display.Bitmap;
import flash.display.Loader;
import flash.utils.ByteArray;
import flash.utils.Dictionary;

public class ImageBitmapCache {
   
   private var _url2ImagesBitmap:Dictionary;
   
   public function ImageBitmapCache() {
      clear();
   }
   
   public function getBitmapFromUrl(url:String):Bitmap {
      return _url2ImagesBitmap[url];      
   }
   
   public function saveBitmapFromUrl(url:String, bitmap:Bitmap):void {
      _url2ImagesBitmap[url] = bitmap; 
   }
   
   public function setImageBinaryWithCaching(url:String, binary:ByteArray):void {
      new BitmapCacheSaver(this, url, binary, new Loader());  
   }
   
   public function clear():void {
      _url2ImagesBitmap = new Dictionary();
   }
}
}
import com.broceliand.ui.list.ImageBitmapCache;

import flash.display.Bitmap;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IEventDispatcher;
import flash.utils.ByteArray;

class BitmapCacheSaver {
   
   private var _cache:ImageBitmapCache;
   private var _url:String;
   
   public function BitmapCacheSaver(cache:ImageBitmapCache, url:String, binaryData:ByteArray, image:Loader):void {
      _url = url;
      _cache = cache;
      image.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoaded);
      image.loadBytes(binaryData);
   }
   
   public function onLoaded(event:Event):void {
      var bitmap:Bitmap = event.target.content as Bitmap;
      _cache.saveBitmapFromUrl(_url, bitmap);
      (event.target as IEventDispatcher).removeEventListener(Event.COMPLETE,onLoaded); 
   }
}