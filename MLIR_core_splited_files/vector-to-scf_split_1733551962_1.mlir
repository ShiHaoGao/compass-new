module {
  func.func @vector_transfer_ops_0d(%arg0: memref<f32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[], %cst : memref<f32>, vector<f32>
    vector.transfer_write %0, %arg0[] : vector<f32>, memref<f32>
    return
  }
}