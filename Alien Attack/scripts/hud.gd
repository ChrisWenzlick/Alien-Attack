extends Control


@onready var score = $Score
@onready var life_units:Array = [$LifeUnit_01, $LifeUnit_02, $LifeUnit_03, $LifeUnit_04, $LifeUnit_05]

var hp = 0


func set_score(new_score):
	score.text = "SCORE: " + str(new_score)


func set_hp(new_hp):
	hp = new_hp
	update_life_meter()


func update_life_meter():
	for i in life_units.size():
		if hp <= i:
			life_units[i].visible = false
