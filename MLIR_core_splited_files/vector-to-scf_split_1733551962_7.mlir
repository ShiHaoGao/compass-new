module {
  func.func @transfer_write_progressive(%arg0: memref<?x?xf32>, %arg1: index, %arg2: vector<3x15xf32>) {
    vector.transfer_write %arg2, %arg0[%arg1, %arg1] : vector<3x15xf32>, memref<?x?xf32>
    return
  }
}