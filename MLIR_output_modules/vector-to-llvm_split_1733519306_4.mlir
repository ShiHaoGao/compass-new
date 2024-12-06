module {
  func.func @bitcast_index_to_i8_vector(%arg0: vector<16xindex>) -> vector<128xi8> {
    %0 = vector.bitcast %arg0 : vector<16xindex> to vector<128xi8>
    return %0 : vector<128xi8>
  }
  func.func @bitcast_index_to_i8_vector_scalable(%arg0: vector<[16]xindex>) -> vector<[128]xi8> {
    %0 = vector.bitcast %arg0 : vector<[16]xindex> to vector<[128]xi8>
    return %0 : vector<[128]xi8>
  }
}