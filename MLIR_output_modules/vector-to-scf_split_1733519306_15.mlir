module {
  func.func @vector_print_vector(%arg0: vector<2x2xf32>) {
    vector.print %arg0 : vector<2x2xf32>
    return
  }
}