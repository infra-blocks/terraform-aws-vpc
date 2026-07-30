variables {
  example_input = "hello world!"
}

run "smoke_test" {
  assert {
    condition     = output.example_output == "HELLO WORLD!"
    error_message = "Tests fucked up!"
  }
}
