rule helloworld_finder {
    strings:
            $hello_world = "Hello World!"
    condition:
            $hello_world
}
