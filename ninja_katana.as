package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="ninja_katana")]
   public dynamic class ninja_katana extends MovieClip
   {
       
      
      public function ninja_katana()
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
