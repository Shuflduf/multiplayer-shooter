extends Control

const PORT = 7890

func _ready() -> void:
    log_event("Server Started")
    var peer = ENetMultiplayerPeer.new()
    peer.create_server(PORT)
    multiplayer.multiplayer_peer = peer
    multiplayer.peer_connected.connect(_on_client_connected)

func log_event(event: String):
    var new_log = RichTextLabel.new()
    new_log.fit_content = true
    new_log.bbcode_enabled = true

    var format_string = "[b][ %d ][/b] - %s"
    var actual_string = format_string % [ Time.get_ticks_msec(), event ]

    new_log.text = actual_string
    %Logs.add_child(new_log)

func _on_client_connected(id):
    log_event("Client %d connected" % id)


func _on_command_input_text_submitted(new_text: String) -> void:
    log_event(new_text)
    %CommandInput.text = ""
