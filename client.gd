extends Node3D

@onready var offset = Time.get_ticks_msec()

const ADDRESS = "127.0.0.1"
const PORT = 7890

func _ready() -> void:
    var peer = ENetMultiplayerPeer.new()
    peer.create_client(ADDRESS, PORT)
    multiplayer.multiplayer_peer = peer

func _on_text_box_text_submitted(new_text: String) -> void:
    %TextBox.text = ""
    send_message.rpc(new_text)
    #send_message.rpc_id(1, new_text)

@rpc("any_peer", "call_local")
func send_message(message: String) -> void:
    var sender_id = multiplayer.get_remote_sender_id()
    var new_message = Label.new()
    var format_string = "[ %d ] %s - %s"
    var actual_string = format_string % [ Time.get_ticks_msec() - offset, sender_id, message ]
    new_message.text = actual_string
    %Messages.add_child(new_message)
