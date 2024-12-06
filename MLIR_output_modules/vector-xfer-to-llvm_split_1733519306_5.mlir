module {
  func.func @transfer_read_1d_inbounds(%arg0: memref<?xf32>, %arg1: index) -> vector<17xf32> {
    %cst = arith.constant 7.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1], %cst {in_bounds = [true]} : memref<?xf32>, vector<17xf32>
    return %0 : vector<17xf32>
  }
  func.func @transfer_read_1d_inbounds_scalable(%arg0: memref<?xf32>, %arg1: index) -> vector<[17]xf32> {
    %cst = arith.constant 7.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1], %cst {in_bounds = [true]} : memref<?xf32>, vector<[17]xf32>
    return %0 : vector<[17]xf32>
  }
}