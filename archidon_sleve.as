package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="archidon_sleve")]
   public dynamic class archidon_sleve extends MovieClip
   {
       
      
      public function archidon_sleve()
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
