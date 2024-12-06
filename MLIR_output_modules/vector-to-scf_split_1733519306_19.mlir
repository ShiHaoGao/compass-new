module {
  func.func @cannot_lower_transfer_write_with_leading_scalable(%arg0: vector<[4]x4xf32>, %arg1: memref<?x4xf32>) {
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant 0.000000e+00 : f32
    %dim = memref.dim %arg1, %c0 : memref<?x4xf32>
    %0 = vector.create_mask %dim, %c4 : vector<[4]x4xi1>
    vector.transfer_write %arg0, %arg1[%c0, %c0], %0 {in_bounds = [true, true]} : vector<[4]x4xf32>, memref<?x4xf32>
    return
  }
}