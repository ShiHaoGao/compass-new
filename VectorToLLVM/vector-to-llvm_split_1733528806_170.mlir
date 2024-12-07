module {
  func.func @vector_deinterleave_1d(%arg0: vector<4xi32>) -> (vector<2xi32>, vector<2xi32>) {
    %res1, %res2 = vector.deinterleave %arg0 : vector<4xi32> -> vector<2xi32>
    return %res1, %res2 : vector<2xi32>, vector<2xi32>
  }
  func.func @vector_deinterleave_1d_scalable(%arg0: vector<[4]xi32>) -> (vector<[2]xi32>, vector<[2]xi32>) {
    %res1, %res2 = vector.deinterleave %arg0 : vector<[4]xi32> -> vector<[2]xi32>
    return %res1, %res2 : vector<[2]xi32>, vector<[2]xi32>
  }
  func.func @vector_deinterleave_2d(%arg0: vector<2x8xf32>) -> (vector<2x4xf32>, vector<2x4xf32>) {
    %res1, %res2 = vector.deinterleave %arg0 : vector<2x8xf32> -> vector<2x4xf32>
    return %res1, %res2 : vector<2x4xf32>, vector<2x4xf32>
  }
  func.func @vector_deinterleave_2d_scalable(%arg0: vector<2x[8]xf32>) -> (vector<2x[4]xf32>, vector<2x[4]xf32>) {
    %res1, %res2 = vector.deinterleave %arg0 : vector<2x[8]xf32> -> vector<2x[4]xf32>
    return %res1, %res2 : vector<2x[4]xf32>, vector<2x[4]xf32>
  }
}