package com.brockw.stickwar.engine.Ai
{
   import com.brockw.stickwar.engine.Ai.command.*;
   import com.brockw.stickwar.engine.StickWar;
   import com.brockw.stickwar.engine.units.Dead;
   
   public class MeleeDeadAi extends UnitAi
   {
       
      
      public function MeleeDeadAi(param1:Dead)
      {
         super();
         unit = param1;
      }
      
      override public function update(param1:StickWar) : void
      {
         baseUpdate(param1);
         if(currentCommand.type == UnitCommand.DEAD_POISON)
         {
            Dead(unit).isPoisonedToggled = !Dead(unit).isPoisonedToggled;
            restoreMove(param1);
         }
      }
   }
}
