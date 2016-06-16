state("jk2sp")
{
	int isLoading      :  0x41D45C;
	int Loading2       :  0xEF5200;
	int map            :  0x5E6098;
	int desannHealth   :  "jk2gamex86.dll", 0x26CF78, 0x218;
	int start          :  0x40D370;
	string9 mapString  :  0xCB3208;
}

start
{
	return current.map == 17 && current.start == 4;
}

reset
{
	return current.map == 17 && old.map != 17;
}
split
{
	return current.map != old.map && current.map > 2 ||
		   current.mapString == "yavin_fin" && current.desannHealth == 0 && old.desannHealth > 0;
}

isLoading
{
	return current.isLoading == 0 || current.isLoading == 1 && current.Loading2 == 0;
}