package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="allbowtross_frontwing")]
   public dynamic class allbowtross_frontwing extends MovieClip
   {
       
      
      public function allbowtross_frontwing()
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
