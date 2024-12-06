module {
  func.func @print_scalar_ui64(%arg0: ui64) {
    vector.print %arg0 : ui64
    return
  }
}