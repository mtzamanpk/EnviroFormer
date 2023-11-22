extends Node2D
 
@onready var collision_polygon_2d = $StaticBody2D/CollisionPolygon2D
@onready var polygon_2d = $StaticBody2D/CollisionPolygon2D/Polygon2D
@onready var level_completed = $CanvasLayer/LevelCompleted
@onready var garbages_collected = $CanvasLayer2/GarbagesCollected
@onready var health_collected = $CanvasLayer3/health_collected


# Called when the node enters the scene tree for the first time.
func _ready():
	RenderingServer.set_default_clear_color(Color.SKY_BLUE)	
	polygon_2d.polygon = collision_polygon_2d.polygon
	Events.garbages_collected.connect(show_garbages_collected)
	Events.health_collected.connect(show_health_collected)
	Events.level_compelted.connect(show_level_completed)

func show_health_collected():
	health_collected.show()
	get_tree().paused = true
	await get_tree().create_timer(5.0).timeout
	get_tree().paused = false
	health_collected.hide()

func show_garbages_collected():
	garbages_collected.show()
	get_tree().paused = true
	await get_tree().create_timer(5.0).timeout
	get_tree().paused = false
	garbages_collected.hide()

func show_level_completed():
	level_completed.show()
	get_tree().paused = true
