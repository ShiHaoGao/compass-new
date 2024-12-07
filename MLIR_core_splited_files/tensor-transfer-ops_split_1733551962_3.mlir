module {
  func.func @scalable_transpose_store(%arg0: vector<4x[4]xf32>, %arg1: tensor<?x?xf32>, %arg2: index, %arg3: index) -> tensor<?x?xf32> {
    %0 = vector.transpose %arg0, [1, 0] : vector<4x[4]xf32> to vector<[4]x4xf32>
    %1 = vector.transfer_write %0, %arg1[%arg2, %arg3] {in_bounds = [true, true]} : vector<[4]x4xf32>, tensor<?x?xf32>
    return %1 : tensor<?x?xf32>
  }
}