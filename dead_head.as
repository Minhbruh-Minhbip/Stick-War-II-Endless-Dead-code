package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="dead_head")]
   public dynamic class dead_head extends MovieClip
   {
       
      
      public function dead_head()
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
