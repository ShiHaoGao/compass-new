module {
  func.func @print_scalar_index(%arg0: index) {
    vector.print %arg0 : index
    return
  }
}