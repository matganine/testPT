package com.broceliand.ui.list
{
   import com.broceliand.ApplicationManager;
   import com.broceliand.pearlTree.model.BroAssociation;
   import com.broceliand.pearlTree.model.BroPearlTree;
   import com.broceliand.pearlTree.model.User;
   import com.broceliand.pearlTree.navigation.INavigationManager;
   import com.broceliand.ui.pearlWindow.ui.base.RoundedImage;
   import com.broceliand.util.GenericAction;
   import com.broceliand.util.resources.IResourceLoadedCallback;
   
   import flash.display.Bitmap;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.ByteArray;
   import flash.utils.setTimeout;
   
   import mx.containers.Canvas;
   
   public class PTListItem extends Canvas implements IResourceLoadedCallback {
      
      public static const STATE_OK:int = 0;
      public static const STATE_CHANGED:int = 1;
      public static const STATE_LOADING:int = 2;
      public static const STATE_BUILDING:int = 3;
      public static const STATE_DISPLAY:int = 4;
      
      public static const EVANT_IMAGE_DISPLAYED:String = "ImageDisplayedEvent";
      
      public static var _imageSharedCache:ImageBitmapCache;
      protected var _imageCache:ImageBitmapCache;
      protected var _hasChanged:Boolean;
      protected var _size:String;
      protected var _shape:String;
      protected var _buttonMode:Boolean;
      protected var _imageHash:String;
      protected var _pearlWindowTabToOpen:int = -1;
      protected var _softImageSwitch:Boolean;
      protected var _currentImage:RoundedImage;
      protected var _image1:RoundedImage;
      protected var _image2:RoundedImage;
      protected var _clearOnLoad:Boolean = false;      
      protected var _imgState:int = STATE_OK;
      protected var _useBitmapCache:Boolean = false;
      private var _isOnError:Boolean = false;
      
      public function PTListItem() {
         super();
         addEventListener(MouseEvent.CLICK, onClick);
         useHandCursor = false;
         super.buttonMode = false;
         _buttonMode = true;
         
      }
      
      protected function getImageUrl(isHover:Boolean = false):String {
         
         return "";
      }
      
      protected function onClick(event:MouseEvent):void {
         
      }
      
      protected function fitToSize():void {
         
      }
      
      protected function isReadyToLoad():Boolean {
         
         return true;
      }
      
      protected function getTypeFromSizeAndShape(size:String, shape:String):uint {
         
         return 0;
      }
      
      public function refreshImageHash():void {
         
      }
      
      public function onLoaded(loadedData:Object, url:String=null):void {
         if (url != getImageUrl()) return;
         isOnError = false;
         imgState = STATE_BUILDING;
         if(_softImageSwitch) {
            removeCurrentImageWithDelay();
            _currentImage = (_currentImage == _image1) ? _image2 : _image1;
         } else {
            _currentImage = _image1;
         }
         if (!loadedData) {
            _currentImage.source = new Bitmap(getBitmapCache().getBitmapFromUrl(url).bitmapData);
            imgState = STATE_DISPLAY;
         } else {
            if (_useBitmapCache) {
               getBitmapCache().setImageBinaryWithCaching(url, loadedData as ByteArray);
            } 
            _currentImage.addEventListener(Event.COMPLETE, onImageDisplayed);
            _currentImage.source =  loadedData as ByteArray;
         }
         _currentImage.smoothBitmapContent = true;
      }
      
      public function get clearOnLoad():Boolean {
         return _clearOnLoad;
      }
      
      public function set clearOnLoad(value:Boolean):void {
         _clearOnLoad = value;
      }
      
      public function get imageCache():ImageBitmapCache {
         return _imageCache;
      }
      
      public function set imageCache(value:ImageBitmapCache):void {
         _imageCache = value;
      }
      
      public function getBitmapCache():ImageBitmapCache {
         if (!imageCache) {
            if (!_imageSharedCache) {
               _imageSharedCache = new ImageBitmapCache();
            }
            return _imageSharedCache;
         }
         return _imageCache;
      }
      
      public function get useBitmapCache():Boolean {
         return _useBitmapCache;
      }
      
      public function set useBitmapCache(value:Boolean):void {
         _useBitmapCache = value;
      }
      
      override protected function createChildren():void {
         super.createChildren();
         addRemoteImage();
      }
      
      protected function addRemoteImage():void {
         _image1 = new RoundedImage();
         _image1.percentWidth = 100;
         _image1.percentHeight = 100;
         addChild(_image1);
         _image1.visible = _image1.includeInLayout = false;
         if(_softImageSwitch) {
            _image2 = new RoundedImage();
            _image2.percentWidth = 100;
            _image2.percentHeight = 100;
            addChild(_image2);
            _image2.visible = _image2.includeInLayout = false;
         }
      }
      
      public function set softImageSwitch(value:Boolean):void {
         _softImageSwitch = value;
      }
      
      override public function set buttonMode(value:Boolean):void{
         _buttonMode = value;
      }
      
      public function refreshImage():void {
         hasChanged = true;
         imgState = STATE_CHANGED;
         refreshImageHash();
         invalidateProperties();
      }
      
      override protected function commitProperties():void {
         super.commitProperties();
         var am:ApplicationManager = ApplicationManager.getInstance();
         if (hasChanged) {
            hasChanged = false;
            fitToSize();          
            if (isReadyToLoad()) {
               imgState = STATE_LOADING;
               var url:String = getImageUrl();
               if (useBitmapCache) {
                  var bmp:Bitmap = getBitmapCache().getBitmapFromUrl(url);
                  if (bmp) {
                     onLoaded(null, url);
                     return;
                  }
               }
               if (_clearOnLoad && _currentImage) {
                  _currentImage.visible = _currentImage.includeInLayout = false;
               }
               am.remoteResourceManagers.remoteImageManager.getRemoteResource(this, url);
            } else if (_currentImage) {
               imgState = STATE_OK;
               _currentImage.visible = _currentImage.includeInLayout = false;
            }
         }
      }
      
      public function set imgState(state:int):void {
         if (_imgState != state){
            _imgState = state;
            if (_imgState == STATE_DISPLAY) {
               if (!_currentImage.visible) {
                  _currentImage.visible = _currentImage.includeInLayout = true;
               }
               dispatchEvent(new Event(EVANT_IMAGE_DISPLAYED));
            }
         }
      }
      
      public function get imgState():int {
         return _imgState;
      }
      
      public function set cornerRadius(value:uint):void {
         _image1.cornerRadius = value;
         if(_softImageSwitch) {
            _image2.cornerRadius = value;
         }
      }
      
      public function get cornerRadius():uint {
         return (_image1) ? _image1.cornerRadius : 0;
      }
      
      protected function onImageDisplayed(event:Event):void {
         GenericAction.removeListener(event, onImageDisplayed);
         imgState = STATE_DISPLAY;
         _currentImage.visible = _currentImage.includeInLayout = true;
      }
      
      protected function removeCurrentImageWithDelay():void {
         if(_currentImage) {
            setTimeout(removeImage, 50, _currentImage);
         }
      }
      
      protected function removeImage(image:RoundedImage):void {
         image.source = null;
         image.visible = image.includeInLayout = false;
      }
      
      public function onError(fault:Object, url:String=null):void {
         if (!url || url != getImageUrl()) return;
         if (_image1) {
            removeImage(_image1);
         }
         if (_image2) {
            removeImage(_image2);
         }
         isOnError = true;
      }
      
      public function set size(value:String):void {
         
         if(value != _size){
            _size = value;
            hasChanged = true;
            refreshImage();
         }
         /*}else{
         trace('Invalid size for PTListItem');
         }*/
      }
      
      public function get size():String{
         return _size;
      }
      
      public function set shape(value:String):void {
         
         if (value != _shape){
            _shape = value;
            hasChanged = true;
            refreshImage();
         }
         /*}else{
         trace('Invalid shape for PTListItem');
         }*/
      }
      
      public function get shape():String{
         return _shape;
      }
      
      public function set pearlWindowTabToOpen(value:int):void{
         _pearlWindowTabToOpen = value;
      }
      
      public function get pearlWindowTabToOpen():int{
         return _pearlWindowTabToOpen;
      }
      
      public function set imageHash(value:String):void {
         if (_imageHash != value) {
            _imageHash = value;
            refreshImage();
         }
      }
      
      public function isImageNeedToBeDisplayed():Boolean {
         return _imgState != STATE_DISPLAY;
      }
      
      public function get hasChanged():Boolean {
         return _hasChanged;
      }
      
      public function set hasChanged(value:Boolean):void {
         _hasChanged = value;
      }
      
      public function get isOnError():Boolean {
         return _isOnError;
      }
      
      public function set isOnError(value:Boolean):void {
         _isOnError = value;
      }
   }
}
