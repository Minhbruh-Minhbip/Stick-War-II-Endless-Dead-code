package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="chaosminer_pickaxe")]
   public dynamic class chaosminer_pickaxe extends MovieClip
   {
       
      
      public function chaosminer_pickaxe()
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
