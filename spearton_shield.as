package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="spearton_shield")]
   public dynamic class spearton_shield extends MovieClip
   {
       
      
      public function spearton_shield()
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
