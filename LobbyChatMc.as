package
{
   import fl.containers.ScrollPane;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="LobbyChatMc")]
   public dynamic class LobbyChatMc extends MovieClip
   {
       
      
      public var chatInput:TextField;
      
      public var sendButton:SimpleButton;
      
      public var scroll:ScrollPane;
      
      public var chatOutput:TextField;
      
      public function LobbyChatMc()
      {
         super();
      }
   }
}
