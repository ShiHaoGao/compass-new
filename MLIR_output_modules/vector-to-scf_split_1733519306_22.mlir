module {
  func.func @scalable_transpose_store_dynamic_mask(%arg0: vector<4x[4]xf32>, %arg1: memref<?x?xf32>, %arg2: index, %arg3: index, %arg4: index, %arg5: index) {
    %0 = vector.transpose %arg0, [1, 0] : vector<4x[4]xf32> to vector<[4]x4xf32>
    %1 = vector.create_mask %arg4, %arg5 : vector<[4]x4xi1>
    vector.transfer_write %0, %arg1[%arg2, %arg3], %1 {in_bounds = [true, true]} : vector<[4]x4xf32>, memref<?x?xf32>
    return
  }
}