extends Control

var PlayerCoins = 0;

func _process(delta):
	PlayerCoins = $"../Player/PlayerBody".CoinCount;
	$Label.set_text("Coins: " + str(PlayerCoins));
