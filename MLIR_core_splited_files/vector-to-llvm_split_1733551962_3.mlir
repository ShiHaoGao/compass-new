module {
  func.func @bitcast_i8_to_f32_vector(%arg0: vector<64xi8>) -> vector<16xf32> {
    %0 = vector.bitcast %arg0 : vector<64xi8> to vector<16xf32>
    return %0 : vector<16xf32>
  }
  func.func @bitcast_i8_to_f32_vector_scalable(%arg0: vector<[64]xi8>) -> vector<[16]xf32> {
    %0 = vector.bitcast %arg0 : vector<[64]xi8> to vector<[16]xf32>
    return %0 : vector<[16]xf32>
  }
}