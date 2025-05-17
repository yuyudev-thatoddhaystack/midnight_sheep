function OnAosoraDefaultSaveData {
	Save.Data.UserName = "sib";
	Save.Data.TalkInterval = 180;	
}


function OnAosoraLoad {
  TalkTimer.RandomTalk = OnAITalk;
  TalkTimer.RandomTalkIntervalSeconds = Save.Data.TalkInterval;
  LastTalk = "";
  if (Save.Data.UserName == "") {
    Save.Data.UserName = "sib";
  }
}


talk OnBoot {
    \s[4]Oh,\w4 {username},\w4 are you unable to sleep as well?\w8 Since neither of us can sleep,\w4 let's chat for a minute.\w8\w8
}
talk OnClose {
    \s[0]Headed to bed now?\w8 Or at least,\w4 going to try to sleep again?\w8 Good night.\w8 I'll try to sleep soon too.\_w[1500]\-
}

talk OnMouseDoubleClick {
    {OnSakuraMenu}
    
}

function OnNotifyUserInfo {

    Save.Data.UserName = Shiori.Reference[0];
    Save.Data.Birthday = Shiori.Reference[2];
    Save.Data.Gender = Shiori.Reference[3];
    if (Save.Data.UserName == "") {
        Save.Data.UserName = "sib";
    }
    

}

function userbirth {
   
   return Save.Data.Birthday[1] + "/" + Save.Data.Birthday[2] + "/" + Save.Data.Birthday;

}

function username {

    return Save.Data.UserName;

}

function SetTalkInterval(intervalSeconds){
	TalkTimer.RandomTalkIntervalSeconds = intervalSeconds;
	TalkTimer.RandomTalkElapsedSeconds = 0;
	Save.Data.TalkInterval = intervalSeconds;
}