module {
  func.func @make_fixed_vector_of_scalable_vector(%arg0: f64) -> vector<3x[2]xf64> {
    %0 = vector.broadcast %arg0 : f64 to vector<3x[2]xf64>
    return %0 : vector<3x[2]xf64>
  }
}