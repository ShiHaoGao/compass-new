module {
  func.func @print_scalar_i64(%arg0: i64) {
    vector.print %arg0 : i64
    return
  }
}