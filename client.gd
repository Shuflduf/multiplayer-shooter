extends Node3D

const ADDRESS = "127.0.0.1"
const PORT = 7890

func _ready() -> void:
    var peer = ENetMultiplayerPeer.new()
    peer.create_client(ADDRESS, PORT)
    multiplayer.multiplayer_peer = peer
