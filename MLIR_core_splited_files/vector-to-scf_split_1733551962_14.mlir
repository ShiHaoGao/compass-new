module {
  func.func @vector_print_vector_0d(%arg0: vector<f32>) {
    vector.print %arg0 : vector<f32>
    return
  }
}