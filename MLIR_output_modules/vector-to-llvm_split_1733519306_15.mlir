module {
  func.func @broadcast_vec3d_from_vec1d(%arg0: vector<2xf32>) -> vector<4x3x2xf32> {
    %0 = vector.broadcast %arg0 : vector<2xf32> to vector<4x3x2xf32>
    return %0 : vector<4x3x2xf32>
  }
  func.func @broadcast_vec3d_from_vec1d_scalable(%arg0: vector<[2]xf32>) -> vector<4x3x[2]xf32> {
    %0 = vector.broadcast %arg0 : vector<[2]xf32> to vector<4x3x[2]xf32>
    return %0 : vector<4x3x[2]xf32>
  }
}