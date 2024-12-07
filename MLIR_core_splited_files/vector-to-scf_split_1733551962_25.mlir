#map = affine_map<(d0, d1) -> (d1, d0)>
module {
  func.func @negative_scalable_transpose_store_1(%arg0: vector<4x[4]xf32>, %arg1: memref<?x?xf32>, %arg2: index, %arg3: index) {
    %0 = vector.transpose %arg0, [1, 0] : vector<4x[4]xf32> to vector<[4]x4xf32>
    vector.transfer_write %0, %arg1[%arg2, %arg3] {in_bounds = [true, true], permutation_map = #map} : vector<[4]x4xf32>, memref<?x?xf32>
    return
  }
}