rule hello_world_rule3 {
    strings:
            $hello_world = "Hello World!"
            $type = ".txt"
    condition:
            $hello_world and $type

}
