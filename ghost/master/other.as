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
	return "";
}