package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="itemSword")]
   public dynamic class itemSword extends MovieClip
   {
       
      
      public function itemSword()
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
