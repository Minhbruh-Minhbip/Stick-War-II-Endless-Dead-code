package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="medusa_cape")]
   public dynamic class medusa_cape extends MovieClip
   {
       
      
      public function medusa_cape()
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
