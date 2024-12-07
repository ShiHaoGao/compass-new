module {
  func.func @print_string() {
    vector.print str "Hello, World!"
    return
  }
}