module {
  func.func @bitcast_f32_to_i32_vector(%arg0: vector<16xf32>) -> vector<16xi32> {
    %0 = vector.bitcast %arg0 : vector<16xf32> to vector<16xi32>
    return %0 : vector<16xi32>
  }
  func.func @bitcast_f32_to_i32_vector_scalable(%arg0: vector<[16]xf32>) -> vector<[16]xi32> {
    %0 = vector.bitcast %arg0 : vector<[16]xf32> to vector<[16]xi32>
    return %0 : vector<[16]xi32>
  }
}