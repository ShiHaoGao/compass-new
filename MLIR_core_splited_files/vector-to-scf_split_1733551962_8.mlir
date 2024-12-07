module {
  func.func @transfer_write_progressive_inbounds(%arg0: memref<?x?xf32>, %arg1: index, %arg2: vector<3x15xf32>) {
    vector.transfer_write %arg2, %arg0[%arg1, %arg1] {in_bounds = [true, true]} : vector<3x15xf32>, memref<?x?xf32>
    return
  }
}