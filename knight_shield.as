package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="knight_shield")]
   public dynamic class knight_shield extends MovieClip
   {
       
      
      public function knight_shield()
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
