module {
  func.func @transfer_read_write_1d_non_zero_addrspace(%arg0: memref<?xf32, 3>, %arg1: index) -> vector<17xf32> {
    %cst = arith.constant 7.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1], %cst : memref<?xf32, 3>, vector<17xf32>
    vector.transfer_write %0, %arg0[%arg1] : vector<17xf32>, memref<?xf32, 3>
    return %0 : vector<17xf32>
  }
  func.func @transfer_read_write_1d_non_zero_addrspace_scalable(%arg0: memref<?xf32, 3>, %arg1: index) -> vector<[17]xf32> {
    %cst = arith.constant 7.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1], %cst : memref<?xf32, 3>, vector<[17]xf32>
    vector.transfer_write %0, %arg0[%arg1] : vector<[17]xf32>, memref<?xf32, 3>
    return %0 : vector<[17]xf32>
  }
}