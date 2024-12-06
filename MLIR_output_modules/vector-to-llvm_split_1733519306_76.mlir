module {
  func.func @print_scalar_f64(%arg0: f64) {
    vector.print %arg0 : f64
    return
  }
}