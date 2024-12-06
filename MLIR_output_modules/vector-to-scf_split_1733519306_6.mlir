module {
  func.func @transfer_read_progressive(%arg0: memref<?x?xf32>, %arg1: index) -> vector<3x15xf32> {
    %cst = arith.constant 7.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1, %arg1], %cst : memref<?x?xf32>, vector<3x15xf32>
    return %0 : vector<3x15xf32>
  }
}