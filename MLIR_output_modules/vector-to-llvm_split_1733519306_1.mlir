module {
  func.func @bitcast_f32_to_i32_vector_0d(%arg0: vector<f32>) -> vector<i32> {
    %0 = vector.bitcast %arg0 : vector<f32> to vector<i32>
    return %0 : vector<i32>
  }
}