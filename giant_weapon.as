package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="giant_weapon")]
   public dynamic class giant_weapon extends MovieClip
   {
       
      
      public function giant_weapon()
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
