package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="giant_bag")]
   public dynamic class giant_bag extends MovieClip
   {
       
      
      public var giantstrapfront:MovieClip;
      
      public var giantstrapbehind:MovieClip;
      
      public function giant_bag()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}
