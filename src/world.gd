extends Node2D
 
@onready var collision_polygon_2d = $StaticBody2D/CollisionPolygon2D
@onready var polygon_2d = $StaticBody2D/CollisionPolygon2D/Polygon2D
@onready var level_completed = $CanvasLayer/LevelCompleted
@onready var garbages_collected = $CanvasLayer2/GarbagesCollected
@onready var health_collected = $CanvasLayer3/health_collected
@onready var luw_collected = $CanvasLayer4/luw_collected


# Called when the node enters the scene tree for the first time.
func _ready():
	RenderingServer.set_default_clear_color(Color.SKY_BLUE)	
	polygon_2d.polygon = collision_polygon_2d.polygon
	Events.garbages_collected.connect(show_garbages_collected)
	Events.luw_collected.connect(show_luw_collected)
	Events.health_collected.connect(show_health_collected)
	Events.level_compelted.connect(show_level_completed)
	

func show_luw_collected():
	health_collected.hide()
	garbages_collected.hide()
	luw_collected.show()
	await get_tree().create_timer(5.0).timeout
	luw_collected.hide()

func show_health_collected():
	luw_collected.hide()
	garbages_collected.hide()
	health_collected.show()
	await get_tree().create_timer(5.0).timeout
	health_collected.hide()

func show_garbages_collected():
	health_collected.hide()
	luw_collected.hide()
	garbages_collected.show()
	await get_tree().create_timer(5.0).timeout
	garbages_collected.hide()

func show_level_completed():
	garbages_collected.hide()
	health_collected.hide()
	luw_collected.hide()
	level_completed.show()

func _on_level_completed_quit():
	get_tree().change_scene_to_file("res://start_menu.tscn")
