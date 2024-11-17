package com.brockw.stickwar.engine.projectile
{
   import com.brockw.stickwar.engine.StickWar;
   import flash.display.MovieClip;
   
   public class Bite extends Projectile
   {
       
      
      private var spellMc:MovieClip;
      
      public function Bite(param1:StickWar)
      {
         super();
         type = BITE;
         this.spellMc = new deadprojectile();
         this.spellMc.scaleX *= 0;
         this.spellMc.scaleY *= 0;
         this.addChild(this.spellMc);
         damageToDeal = 50;
         _drotation = 0;
         rot = 0;
      }
      
      override public function cleanUp() : void
      {
         super.cleanUp();
         removeChild(this.spellMc);
         this.spellMc = null;
      }
      
      override public function update(param1:StickWar) : void
      {
         super.update(param1);
         this.rotation = rot;
         rot += _drotation;
      }
   }
}
