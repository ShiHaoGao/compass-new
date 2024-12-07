module {
  func.func @transfer_read_write_1d_mask(%arg0: memref<?xf32>, %arg1: index) -> vector<5xf32> {
    %cst = arith.constant dense<[false, false, true, false, true]> : vector<5xi1>
    %cst_0 = arith.constant 7.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1], %cst_0, %cst : memref<?xf32>, vector<5xf32>
    vector.transfer_write %0, %arg0[%arg1], %cst : vector<5xf32>, memref<?xf32>
    return %0 : vector<5xf32>
  }
  func.func @transfer_read_write_1d_mask_scalable(%arg0: memref<?xf32>, %arg1: index, %arg2: vector<[5]xi1>) -> vector<[5]xf32> {
    %cst = arith.constant 7.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1], %cst, %arg2 : memref<?xf32>, vector<[5]xf32>
    vector.transfer_write %0, %arg0[%arg1], %arg2 : vector<[5]xf32>, memref<?xf32>
    return %0 : vector<[5]xf32>
  }
}