package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="archidon_head")]
   public dynamic class archidon_head extends MovieClip
   {
       
      
      public function archidon_head()
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
