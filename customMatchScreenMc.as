package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="customMatchScreenMc")]
   public dynamic class customMatchScreenMc extends MovieClip
   {
       
      
      public var chooseFriendContainer:MovieClip;
      
      public var invitationResponse:TextField;
      
      public var chooseGameTypeContainer:MovieClip;
      
      public var chooseMapContainer:MovieClip;
      
      public var playButton:SimpleButton;
      
      public function customMatchScreenMc()
      {
         super();
      }
   }
}
