module {
  func.func @transfer_read_2d_to_1d(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index) -> vector<17xf32> {
    %cst = arith.constant 7.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1, %arg2], %cst : memref<?x?xf32>, vector<17xf32>
    return %0 : vector<17xf32>
  }
  func.func @transfer_read_2d_to_1d_scalable(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index) -> vector<[17]xf32> {
    %cst = arith.constant 7.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1, %arg2], %cst : memref<?x?xf32>, vector<[17]xf32>
    return %0 : vector<[17]xf32>
  }
}