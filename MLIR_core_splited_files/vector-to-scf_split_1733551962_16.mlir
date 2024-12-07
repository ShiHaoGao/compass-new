module {
  func.func @vector_print_scalable_vector(%arg0: vector<[4]xi32>) {
    vector.print %arg0 : vector<[4]xi32>
    return
  }
}