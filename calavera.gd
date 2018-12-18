extends Node2D

var dial_cal = []
#var operaciones = [] #0 SUMA,1 RESTA, 2 MULTIP, 3 DIV
var ninput
var txt_dialcal
var index = 0
var resultado = 0
var gameover = false

func _ready():
	txt_dialcal = get_tree().get_nodes_in_group("diacal")[0]
	ninput = get_tree().get_nodes_in_group("input")[0]
	dial_cal.append("PENSA UN NUMERO")
	dial_cal.append("SUMA EL SIGUIENTE NUMERO")
	dial_cal.append("SUMA EL SIGUIENTE NUMERO")
	dial_cal.append("RESTA EL SIGUIENTE NUMERO")
	dial_cal.append("SUMA EL SIGUIENTE NUMERO")
	dial_cal.append("RESTALE EL NUMERO QUE PENSASTE")
	dial_cal.append("MULTIPLICA POR EL SIGUIENTE NUMERO")
	dial_cal.append("RESTA EL SIGUIENTE NUMERO")
	dial_cal.append("DIVIDI POR EL SIGUIENTE NUMERO")
	txt_dialcal.text = dial_cal[index]


func _on_TextureButton_button_up():
	pass

func _on_TextureButton_button_down():
	if(index < dial_cal.size()-1 && !gameover):
		index += 1
		txt_dialcal.text = dial_cal[index]
		if("SUMA" in dial_cal[index-1]):
			resultado += int(ninput.text)
		elif("RESTA" in dial_cal[index-1]):
			resultado -= int(ninput.text)
		elif("MULTIPLICA" in dial_cal[index-1]):
			resultado *= int(ninput.text)
		elif("DIVIDI" in dial_cal[index-1]):
			resultado /= int(ninput.text)
		if(index >= dial_cal.size()-1):
			dial_cal.append("EL RESULTADO ES " + String(resultado))
			index += 1
			txt_dialcal.text = dial_cal[index]
			gameover = true
