package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="confirmSaveMessage")]
   public dynamic class confirmSaveMessage extends MovieClip
   {
       
      
      public var okButton:SimpleButton;
      
      public var messageText:TextField;
      
      public function confirmSaveMessage()
      {
         super();
      }
   }
}
