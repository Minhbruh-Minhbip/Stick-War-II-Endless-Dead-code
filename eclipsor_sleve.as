package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="eclipsor_sleve")]
   public dynamic class eclipsor_sleve extends MovieClip
   {
       
      
      public function eclipsor_sleve()
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
