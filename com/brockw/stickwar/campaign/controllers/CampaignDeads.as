package com.brockw.stickwar.campaign.controllers
{
   import com.brockw.game.*;
   import com.brockw.stickwar.GameScreen;
   import com.brockw.stickwar.campaign.*;
   import com.brockw.stickwar.engine.*;
   import com.brockw.stickwar.engine.Ai.command.*;
   import com.brockw.stickwar.engine.Team.*;
   import com.brockw.stickwar.engine.Team.Elementals.*;
   import com.brockw.stickwar.engine.units.*;
   import flash.display.*;
   import flash.filters.*;
   import flash.geom.*;
   import flash.utils.*;
   
   public class CampaignDeads extends CampaignController
   {
       
      
      private var message:InGameMessage;
      
      private var night:InGameMessage;
      
      private var frames:int;
      
      private var counter:Boolean;
      
      private var nah:Boolean;
      
      private var dead:Boolean;
      
      private var archer:Archer;
      
      private var nightDay:int;
      
      private var directionAtBurrow:int;
      
      public function CampaignDeads(param1:GameScreen)
      {
         super(param1);
         this.nightDay = 1;
      }
      
      override public function update(param1:GameScreen) : void
      {
         var _loc2_:Unit = null;
         var _loc3_:Unit = null;
         var _loc4_:Unit = null;
         var _loc5_:Unit = null;
         var captureUnit:Unit = null;
         var captureUnit2:Unit = null;
         captureUnit = param1.team.unitGroups[Unit.U_MINER][0];
         captureUnit2 = param1.team.unitGroups[Unit.U_ARCHER][0];
         var meleeMin:int = 10;
         var meleeMax:int = 28;
         var rangeMin:int = 23;
         var rangeMax:int = 46;
         var heavyMin:int = 36;
         var heavyMax:int = 59;
         var giantMin:int = 58;
         var giantMax:int = 78;
         var kaiMin:int = 46;
         var kaiMax:int = 69;
         var ramdomLight1:int = meleeMin + Math.floor(Math.random() * (meleeMax - meleeMin + 1));
         var ramdomLight2:int = meleeMin + Math.floor(Math.random() * (meleeMax - meleeMin + 1));
         var ramdomHeavy1:int = heavyMin + Math.floor(Math.random() * (heavyMax - heavyMin + 1));
         var ramdomHeavy2:int = heavyMin + Math.floor(Math.random() * (heavyMax - heavyMin + 1));
         var ramdomHeavy3:int = 41 + Math.floor(Math.random() * (68 - 41 + 1));
         var ramdomRange1:int = rangeMin + Math.floor(Math.random() * (rangeMax - rangeMin + 1));
         var ramdomRange2:int = rangeMin + Math.floor(Math.random() * (rangeMax - rangeMin + 1));
         var ramdomRange3:int = rangeMin + Math.floor(Math.random() * (rangeMax - rangeMin + 1));
         var ramdomGiant1:int = giantMin + Math.floor(Math.random() * (giantMax - giantMin + 1));
         var ramdomGiant2:int = giantMin + Math.floor(Math.random() * (giantMax - giantMin + 1));
         var ramdomKai1:int = kaiMin + Math.floor(Math.random() * (kaiMax - kaiMin + 1));
         var ramdomKai2:int = kaiMin + Math.floor(Math.random() * (kaiMax - kaiMin + 1));
         var time:int = 2 + Math.floor(Math.random() * (4 - 2 + 1));
         trace(ramdomLight1);
         trace(ramdomLight2);
         trace(ramdomHeavy1);
         trace(ramdomHeavy2);
         trace(ramdomRange1);
         trace(ramdomRange2);
         trace(ramdomRange3);
         trace(ramdomGiant1);
         trace(ramdomGiant2);
         trace(ramdomKai1);
         trace(ramdomKai2);
         trace(time);
         param1.team.enemyTeam.mana += 0.25;
         param1.team.enemyTeam.gold -= 0.25;
         param1.game.team.enemyTeam.attack(true);
         param1.game.fogOfWar.isFogOn = false;
         if(param1.game.frame % (30 * 3 * 60) == 0)
         {
            param1.game.targetScreenX = param1.team.homeX;
            this.counter = false;
            for each(_loc2_ in param1.game.team.units)
            {
               if(!_loc2_.isTowerSpawned)
               {
                  _loc2_.px = param1.team.statue.x - 900;
                  _loc2_.faceDirection(1);
                  param1.userInterface.selectedUnits.clear();
                  _loc2_.selected = false;
               }
               else
               {
                  _loc2_.kill();
               }
            }
            for each(_loc4_ in param1.game.team.enemyTeam.units)
            {
               _loc4_.kill();
            }
            param1.team.mana += 200;
            this.night = new InGameMessage("",param1.game);
            this.night.x = param1.game.stage.stageWidth / 2;
            this.night.y = param1.game.stage.stageHeight / 4 - 75;
            this.night.scaleX *= 1.3;
            this.night.scaleY *= 1.3;
            param1.addChild(this.night);
            this.night.setMessage("Night " + this.nightDay,"");
            this.frames = 0;
            param1.game.team.defend(true);
            this.nightDay += 1;
            param1.userInterface.hud.hud.fastForward.visible = false;
         }
         if(!this.nah)
         {
            for each(_loc5_ in param1.team.unitGroups[Unit.U_ARCHER])
            {
               Archer(_loc5_).normal();
               _loc5_.generalType = "";
            }
            param1.game.team.enemyTeam.statue.x += 900;
            param1.game.team.enemyTeam.statue.px += 1200;
            _loc3_ = Swordwrath(param1.game.unitFactory.getUnit(Unit.U_SWORDWRATH));
            param1.team.spawn(_loc3_,param1.game);
            Swordwrath(_loc3_).enableGeneral();
            _loc3_.generalType = "general";
            _loc3_ = Archer(param1.game.unitFactory.getUnit(Unit.U_ARCHER));
            param1.team.spawn(_loc3_,param1.game);
            Archer(_loc3_).enableGeneral();
            _loc3_.generalType = "general";
            _loc3_ = Spearton(param1.game.unitFactory.getUnit(Unit.U_SPEARTON));
            param1.team.spawn(_loc3_,param1.game);
            Spearton(_loc3_).enableGeneral();
            _loc3_.generalType = "general";
            param1.team.spawnUnitGroup([Unit.U_MINER]);
            this.nah = true;
         }
         if(param1.game.frame % (30 * ramdomLight1) == 0)
         {
            _loc4_ = Dead(param1.game.unitFactory.getUnit(Unit.U_DEAD));
            param1.team.enemyTeam.spawn(_loc4_,param1.game);
            Dead(_loc4_).light();
            _loc4_.deadType = "Light";
            _loc4_ = Dead(param1.game.unitFactory.getUnit(Unit.U_DEAD));
            param1.team.enemyTeam.spawn(_loc4_,param1.game);
            Dead(_loc4_).light();
            _loc4_.deadType = "Light";
         }
         if(this.nightDay < 10)
         {
            if(param1.game.frame % (30 * ramdomLight2) == 0)
            {
               _loc4_ = Dead(param1.game.unitFactory.getUnit(Unit.U_DEAD));
               param1.team.enemyTeam.spawn(_loc4_,param1.game);
               Dead(_loc4_).light();
               _loc4_.deadType = "Light";
               _loc4_ = Dead(param1.game.unitFactory.getUnit(Unit.U_DEAD));
               param1.team.enemyTeam.spawn(_loc4_,param1.game);
               Dead(_loc4_).light();
               _loc4_.deadType = "Light";
               _loc4_ = Dead(param1.game.unitFactory.getUnit(Unit.U_DEAD));
               param1.team.enemyTeam.spawn(_loc4_,param1.game);
               Dead(_loc4_).light();
               _loc4_.deadType = "Light";
            }
         }
         if(this.nightDay > 2 && this.nightDay < 9)
         {
            if(!this.counter && (captureUnit.px > param1.game.team.statue.x + 100 || captureUnit2.px > param1.game.team.statue.x + 300))
            {
               _loc4_ = Dead(param1.game.unitFactory.getUnit(Unit.U_DEAD));
               param1.team.enemyTeam.spawn(_loc4_,param1.game);
               Dead(_loc4_).light();
               _loc4_.deadType = "Light";
               _loc4_.px = captureUnit.px;
               _loc4_.py = captureUnit.py;
               _loc4_.team.game.projectileManager.initMound(_loc4_.px,_loc4_.py,0,_loc4_.team,-1);
               _loc4_ = Dead(param1.game.unitFactory.getUnit(Unit.U_DEAD));
               param1.team.enemyTeam.spawn(_loc4_,param1.game);
               Dead(_loc4_).light();
               _loc4_.deadType = "Light";
               _loc4_.px = captureUnit2.px;
               _loc4_.py = captureUnit2.py;
               _loc4_.team.game.projectileManager.initMound(_loc4_.px,_loc4_.py,0,_loc4_.team,-0.6);
               _loc4_ = Dead(param1.game.unitFactory.getUnit(Unit.U_DEAD));
               param1.team.enemyTeam.spawn(_loc4_,param1.game);
               Dead(_loc4_).light();
               _loc4_.deadType = "Light";
               _loc4_.px = captureUnit2.px;
               _loc4_.py = captureUnit2.py;
               this.counter = true;
            }
         }
         if(this.nightDay > 16 && this.nightDay < 23)
         {
            if(!this.counter && (captureUnit.px > param1.game.team.statue.x + 100 || captureUnit2.px > param1.game.team.statue.x + 300))
            {
               _loc4_ = Dead(param1.game.unitFactory.getUnit(Unit.U_DEAD));
               param1.team.enemyTeam.spawn(_loc4_,param1.game);
               Dead(_loc4_).heavy();
               _loc4_.deadType = "Heavy";
               _loc4_.px = captureUnit.px;
               _loc4_.py = captureUnit.py;
               _loc4_.team.game.projectileManager.initMound(_loc4_.px,_loc4_.py,0,_loc4_.team,-1);
               _loc4_ = Dead(param1.game.unitFactory.getUnit(Unit.U_DEAD));
               param1.team.enemyTeam.spawn(_loc4_,param1.game);
               Dead(_loc4_).heavy();
               _loc4_.deadType = "Heavy";
               _loc4_.px = captureUnit2.px;
               _loc4_.py = captureUnit2.py;
               _loc4_.team.game.projectileManager.initMound(_loc4_.px,_loc4_.py,0,_loc4_.team,-1);
               _loc4_ = Dead(param1.game.unitFactory.getUnit(Unit.U_DEAD));
               param1.team.enemyTeam.spawn(_loc4_,param1.game);
               Dead(_loc4_).heavy();
               _loc4_.deadType = "Heavy";
               _loc4_.px = captureUnit2.px;
               _loc4_.py = captureUnit2.py;
               this.counter = true;
            }
         }
         if(this.nightDay > 18)
         {
            if(param1.game.frame % (30 * ramdomKai1) == 0)
            {
               _loc3_ = Skelator(param1.game.unitFactory.getUnit(Unit.U_SKELATOR));
               param1.team.enemyTeam.spawn(_loc3_,param1.game);
            }
            if(param1.game.frame % (30 * ramdomKai2) == 0)
            {
               _loc3_ = Skelator(param1.game.unitFactory.getUnit(Unit.U_SKELATOR));
               param1.team.enemyTeam.spawn(_loc3_,param1.game);
            }
         }
         if(this.nightDay > 3)
         {
            if(param1.game.frame % (30 * 12) == 0)
            {
               _loc4_ = Dead(param1.game.unitFactory.getUnit(Unit.U_DEAD));
               param1.team.enemyTeam.spawn(_loc4_,param1.game);
               Dead(_loc4_).range();
               _loc4_.deadType = "";
            }
            if(param1.game.frame % (30 * ramdomRange2) == 0)
            {
               _loc4_ = Dead(param1.game.unitFactory.getUnit(Unit.U_DEAD));
               param1.team.enemyTeam.spawn(_loc4_,param1.game);
               Dead(_loc4_).range();
               _loc4_.deadType = "";
            }
         }
         if(this.nightDay > 6 && this.nightDay < 16)
         {
            if(param1.game.frame % (30 * ramdomRange1) == 0)
            {
               _loc4_ = Dead(param1.game.unitFactory.getUnit(Unit.U_DEAD));
               param1.team.enemyTeam.spawn(_loc4_,param1.game);
               Dead(_loc4_).range();
               _loc4_.deadType = "";
            }
            if(param1.game.frame % (30 * ramdomRange3) == 0)
            {
               _loc4_ = Dead(param1.game.unitFactory.getUnit(Unit.U_DEAD));
               param1.team.enemyTeam.spawn(_loc4_,param1.game);
               Dead(_loc4_).range();
               _loc4_.deadType = "";
               _loc4_ = Dead(param1.game.unitFactory.getUnit(Unit.U_DEAD));
               param1.team.enemyTeam.spawn(_loc4_,param1.game);
               Dead(_loc4_).range();
               _loc4_.deadType = "";
            }
         }
         if(this.nightDay > 7)
         {
            if(param1.game.frame % (30 * 33) == 0)
            {
               _loc4_ = Dead(param1.game.unitFactory.getUnit(Unit.U_DEAD));
               param1.team.enemyTeam.spawn(_loc4_,param1.game);
               Dead(_loc4_).heavy();
               _loc4_.deadType = "Heavy";
            }
            if(param1.game.frame % (30 * ramdomHeavy2) == 0)
            {
               _loc4_ = Dead(param1.game.unitFactory.getUnit(Unit.U_DEAD));
               param1.team.enemyTeam.spawn(_loc4_,param1.game);
               Dead(_loc4_).heavy();
               _loc4_.deadType = "Heavy";
            }
         }
         if(this.nightDay > 8 && this.nightDay < 16)
         {
            if(param1.game.frame % (30 * ramdomHeavy1) == 0)
            {
               _loc4_ = Dead(param1.game.unitFactory.getUnit(Unit.U_DEAD));
               param1.team.enemyTeam.spawn(_loc4_,param1.game);
               Dead(_loc4_).heavy();
               _loc4_.deadType = "Heavy";
            }
         }
         if(this.nightDay > 9 && this.nightDay < 17)
         {
            if(param1.game.frame % (30 * ramdomHeavy3) == 0)
            {
               _loc4_ = Dead(param1.game.unitFactory.getUnit(Unit.U_DEAD));
               param1.team.enemyTeam.spawn(_loc4_,param1.game);
               Dead(_loc4_).heavy();
               _loc4_.deadType = "Heavy";
               _loc4_ = Dead(param1.game.unitFactory.getUnit(Unit.U_DEAD));
               param1.team.enemyTeam.spawn(_loc4_,param1.game);
               Dead(_loc4_).heavy();
               _loc4_.deadType = "Heavy";
            }
         }
         if(this.nightDay > 16)
         {
            if(param1.game.frame % (30 * 66) == 0)
            {
               _loc4_ = Dead(param1.game.unitFactory.getUnit(Unit.U_DEAD));
               param1.team.enemyTeam.spawn(_loc4_,param1.game);
               Dead(_loc4_).giant();
               _loc4_.deadType = "Giant";
            }
            if(param1.game.frame % (30 * ramdomGiant1) == 0)
            {
               _loc4_ = Dead(param1.game.unitFactory.getUnit(Unit.U_DEAD));
               param1.team.enemyTeam.spawn(_loc4_,param1.game);
               Dead(_loc4_).giant();
               _loc4_.deadType = "Giant";
            }
         }
         if(this.nightDay > 17 && this.nightDay < 23)
         {
            if(param1.game.frame % (30 * ramdomGiant2) == 0)
            {
               _loc4_ = Dead(param1.game.unitFactory.getUnit(Unit.U_DEAD));
               param1.team.enemyTeam.spawn(_loc4_,param1.game);
               Dead(_loc4_).giant();
               _loc4_.deadType = "Giant";
            }
         }
         if(Boolean(this.message) && param1.contains(this.message))
         {
            this.message.update();
            if(this.frames++ > 30 * 5)
            {
               param1.removeChild(this.message);
            }
         }
         if(Boolean(this.night) && param1.contains(this.night))
         {
            this.night.update();
            if(this.frames++ > 30 * 5)
            {
               param1.removeChild(this.night);
            }
         }
         for each(_loc2_ in param1.team.units)
         {
            if(_loc2_.isPoisoned())
            {
               if(!this.message)
               {
                  this.message = new InGameMessage("",param1.game);
                  this.message.x = param1.game.stage.stageWidth / 2;
                  this.message.y = param1.game.stage.stageHeight / 4 - 75;
                  this.message.scaleX *= 1.3;
                  this.message.scaleY *= 1.3;
                  param1.addChild(this.message);
                  this.message.setMessage("A unit has been poisoned. Garrison this unit or buy meric to cure the poison","");
                  this.frames = 0;
               }
            }
         }
      }
   }
}
