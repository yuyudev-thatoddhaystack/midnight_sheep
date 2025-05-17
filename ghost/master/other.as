//—————————————————————————————— Right click menu links ——————————————————————————————
function FormatLinks(links)
{
	local output = "";
	for (i = 0; i < links.length; i++)
	{
		//Name then 0x01, URL then 0x02
		output += links[i]["name"] + (1).ToAscii();
		output += links[i]["url"] + (2).ToAscii();
	}
	return output;
}

function sakura@recommendsites
{
	return FormatLinks([
		{name: "Vita's Ukagaka Hub", url: "https://thatoddhaystack.neocities.org/ukagaka/"},
		{name: "ひつじがいっぴき freeshell", url: "http://lilyreverd.web.fc2.com/sheep.html"},
		{name: "Aosora SHIORI", url: "https://github.com/kanadelab/aosora-shiori"}
	]);
}

function homeurl
{
	return "https://raw.githubusercontent.com/yuyudev-thatoddhaystack/midnight_sheep/refs/heads/main/";
}

//yoinked from hoard of shinies
//—————————————————————————————— Network Update ——————————————————————————————
//https://ukagakadreamteam.github.io/ukadoc/manual/list_shiori_event.html#OnUpdateBegin

function OnUpdateBegin
{
	return "\0\![set,serikotalk,false]Checking for updates.\w8";
}

//reference0 is the number of new files, starting from 0
function OnUpdateReady
{
	//Number of files starts from 0, so this displays the correct amount
	local newfiles = Shiori.Reference[0];
	newfiles = newfiles.ToNumber();
	newfiles += 1;
	
	//plural checks, adds an s and changes is to are if there's more than 1 file
	local s = ""; local are = "is";
	if (newfiles != 1) { s = "s"; are = "are"; }
	
	return "\0\![set,serikotalk,false]There {are} {newfiles} new file{s}.\w8";
}

//When the update finishes. Don't forget to initialize any new variables you've created! I highly highly recommend using OnInitialize for this, in case the user updates via the ghost explorer or some other means.
//reference0 is 'none' if there were no new files to update with
function OnUpdateComplete
{
	if (Shiori.Reference[0] == "none")
	{
		return "\0\![set,serikotalk,false]There are no new files.";
	}
	else
	{
		return "\0\![set,serikotalk,false]Update complete.";
	}
}

function OnUpdateFailure
{
	local reason = Shiori.Reference[0];
	
	if (Shiori.Reference[0] == "timeout") reason = "connection timed out";
	else if (Shiori.Reference[0] == "md5 miss") reason = "MD5 error on file {Shiori.Reference[1]}\n\nPlease contact the ghost author for assistance";
	else if (Shiori.Reference[0] == "artificial") reason = "canceled by user";
	
	return "\0\![set,serikotalk,false]Could not update: {reason}.";
}