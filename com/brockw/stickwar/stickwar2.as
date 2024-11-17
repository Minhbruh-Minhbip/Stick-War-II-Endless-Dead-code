package com.brockw.stickwar
{
   import com.brockw.game.*;
   import com.brockw.stickwar.campaign.*;
   import com.brockw.stickwar.engine.multiplayer.*;
   import com.brockw.stickwar.engine.multiplayer.clans.*;
   import com.brockw.stickwar.engine.replay.*;
   import com.brockw.stickwar.market.*;
   import com.brockw.stickwar.missions.*;
   import com.brockw.stickwar.singleplayer.*;
   import com.google.analytics.*;
   import flash.display.*;
   import flash.events.*;
   import flash.external.*;
   import flash.net.*;
   import flash.system.*;
   import flash.utils.*;
   
   public class stickwar2 extends BaseMain
   {
       
      
      private var campaignMenuScreen:CampaignMenuScreen;
      
      private var _postGameScreen:PostGameScreen;
      
      private var _replayGameScreen:ReplayGameScreen;
      
      private var _replayLoadingScreen:ReplayLoadingScreen;
      
      public function stickwar2()
      {
         super();
         var _loc1_:XMLLoader = new XMLLoader();
         this.xml = _loc1_;
         isCampaignDebug = _loc1_.xml.campaignDebug == 1;
         this.campaign = new Campaign(0,0);
         this.addEventListener(Event.ADDED_TO_STAGE,this.addedToStage);
         postGameScreen = new PostGameScreen(this);
         addScreen("postGame",postGameScreen);
         addScreen("campaignMap",new CampaignScreen(this));
         addScreen("campaignGameScreen",new CampaignGameScreen(this));
         addScreen("campaignUpgradeScreen",new CampaignUpgradeScreen(this));
         addScreen("summary",new EndOfGameSummary(this));
         addScreen("mainMenu",this.campaignMenuScreen = new CampaignMenuScreen(this));
      }
      
      public function init() : void
      {
         this._replayGameScreen = new ReplayGameScreen(this);
         addScreen("replayGame",this._replayGameScreen);
         addScreen("replayLoader",replayLoaderScreen = new ReplayLoaderScreen(this));
         addScreen("replayLoadingScreen",this._replayLoadingScreen = new ReplayLoadingScreen(stickwar2(this)));
      }
      
      public function get replayGameScreen() : ReplayGameScreen
      {
         return this._replayGameScreen;
      }
      
      public function set replayGameScreen(param1:ReplayGameScreen) : void
      {
         this._replayGameScreen = param1;
      }
      
      public function get replayLoadingScreen() : ReplayLoadingScreen
      {
         return this._replayLoadingScreen;
      }
      
      public function set replayLoadingScreen(param1:ReplayLoadingScreen) : void
      {
         this._replayLoadingScreen = param1;
      }
      
      private function addedToStage(param1:Event) : void
      {
         var _loc2_:Object = null;
         var _loc3_:String = null;
         var _loc4_:URLRequest = null;
         var _loc5_:Loader = null;
         var _loc6_:Object = LoaderInfo(stage.root.loaderInfo).parameters.replay;
         showScreen("mainMenu");
         tracker = null;
         if(Boolean(_loc6_))
         {
            isReplayMode = true;
            replayModeCode = _loc6_.toString();
            this.replayLoadingScreen.loadReplay(replayModeCode);
            showScreen("replayLoadingScreen");
         }
         if(ExternalInterface.available)
         {
            tracker = new GATracker(this,"UA-36522838-2","AS3",false);
            tracker.trackPageview("/play");
            tracker.trackEvent("hostname","url",stage.loaderInfo.url);
         }
         if(xml.xml.isKongregate == 1)
         {
            _loc2_ = LoaderInfo(stage.root.loaderInfo).parameters;
            _loc3_ = String(String(_loc2_.kongregate_api_path) || "http://www.kongregate.com/flash/API_AS3_Local.swf");
            isKongregate = true;
            Security.allowDomain(_loc3_);
            _loc4_ = new URLRequest(_loc3_);
            (_loc5_ = new Loader()).contentLoaderInfo.addEventListener(Event.COMPLETE,this.loadComplete);
            _loc5_.load(_loc4_);
            this.addChild(_loc5_);
         }
         this.init();
      }
      
      internal function loadComplete(param1:Event) : void
      {
         kongregate = param1.target.content;
         kongregate.services.connect();
      }
   }
}
