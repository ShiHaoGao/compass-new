module {
  func.func @print_scalar_f32(%arg0: f32) {
    vector.print %arg0 : f32
    return
  }
}