package elementalAssets_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="elementalAssets_fla.earthhead1_26")]
   public dynamic class earthhead1_26 extends MovieClip
   {
       
      
      public var hat:_earthHat;
      
      public var glare:MovieClip;
      
      public function earthhead1_26()
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
