module {
  func.func @vector_fma(%arg0: vector<8xf32>, %arg1: vector<2x4xf32>, %arg2: vector<1x1x1xf32>, %arg3: vector<f32>) -> (vector<8xf32>, vector<2x4xf32>, vector<1x1x1xf32>, vector<f32>) {
    %0 = vector.fma %arg0, %arg0, %arg0 : vector<8xf32>
    %1 = vector.fma %arg1, %arg1, %arg1 : vector<2x4xf32>
    %2 = vector.fma %arg2, %arg2, %arg2 : vector<1x1x1xf32>
    %3 = vector.fma %arg3, %arg3, %arg3 : vector<f32>
    return %0, %1, %2, %3 : vector<8xf32>, vector<2x4xf32>, vector<1x1x1xf32>, vector<f32>
  }
  func.func @vector_fma_scalable(%arg0: vector<[8]xf32>, %arg1: vector<2x[4]xf32>, %arg2: vector<1x1x[1]xf32>, %arg3: vector<f32>) -> (vector<[8]xf32>, vector<2x[4]xf32>, vector<1x1x[1]xf32>) {
    %0 = vector.fma %arg0, %arg0, %arg0 : vector<[8]xf32>
    %1 = vector.fma %arg1, %arg1, %arg1 : vector<2x[4]xf32>
    %2 = vector.fma %arg2, %arg2, %arg2 : vector<1x1x[1]xf32>
    return %0, %1, %2 : vector<[8]xf32>, vector<2x[4]xf32>, vector<1x1x[1]xf32>
  }
}