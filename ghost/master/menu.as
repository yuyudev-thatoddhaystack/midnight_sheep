


talk OnSakuraMenu{

	\s[0]\b2\_q
    \![*]\q[Say something,OnRandomTalk] | {OnLastTalkMenu}
    
    Change talk interval:
    {OnChangeTalkInterval}
    {OnChangeLantern}
    \![*]\q[Close,OnMenuClose]
}

function OnRandomTalk{
    LastTalk = Reflection.Get("RandomTalk")();
    return LastTalk;
}

function OnLastTalkMenu{
    
    if (LastTalk == "") { 
        return "\f[color,disable]Repeat that?\f[color,default]"; 
    }
	else { 
        return "\q[Repeat that?,OnLastTalk]"; 
    }
	

}

function OnLastTalk{
    return LastTalk;
}

function OnAITalk
{
	LastTalk = Reflection.Get("RandomTalk")();
	return LastTalk;
}

talk OnChangeTalkInterval {
	{TalkIntervalItem(120, "2 minutes")}
	{TalkIntervalItem(180, "3 minutes")}
	{TalkIntervalItem(240, "4 minutes")}
	{TalkIntervalItem(0, "No talking")}
    
}

function TalkIntervalItem(seconds, label) {
	local item = "\![*]\q[{label},OnSetTalkInterval,{seconds}]";
	if(seconds == Save.Data.TalkInterval){
		item = item + "← current";
	}
	return item;
}

function OnSetTalkInterval {
	local interval = Shiori.Reference[0];
	SetTalkInterval(interval);
	return OnSakuraMenu();
}

talk OnChangeLantern {
    Change lantern color:
	{ChangeLanternItem("赤", "Red")}
	{ChangeLanternItem("青", "Blue")}
	{ChangeLanternItem("黄", "Yellow")}

}

function ChangeLanternItem (color, label){

   local item = "\![*]\q[{label},script:\![bind,ランタン,{color},1\]]";
   return item;

}

function OnChangeLanternChosen (color, label){
    return "\![bind,ランタン,{color}";
    
}