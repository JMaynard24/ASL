state("BioshockInfinite")
{
	int pauseGame     : 0x13D2A58, 0x534, 0x780, 0x730, 0x2f4;
    int pauseGame2    : 0x13D33C4, 0x35c, 0x704, 0x7c0, 0x2f4;
    int pauseGame3    : 0x141E1A0, 0x378, 0x640, 0x780, 0x230, 0x2f4;
	int loadingScreen : 0x137CF94, 0x3BC, 0x19C;
	int playerControl : 0x1423D18, 0x2c;
	int afterLogo     : 0x135697C;
}

start
{
	return current.afterLogo == 1 && old.afterLogo == 0;
}

isLoading
{
	return current.loadingScreen != 0 || (current.pauseGame == 0 && current.pauseGame2 == 0 && current.pauseGame3 == 0 && current.playerControl == 0);
}

init
{
    timer.IsGameTimePaused = false;
}

exit
{
    timer.IsGameTimePaused = true;
}