rule helloworld_finder {
    strings:
            $hello_world = "Hello World!"
            $hello_world_up = "HELLO WORLD!"
            $hello_world_low = "hello world!"
    condition:
            any of them
}
