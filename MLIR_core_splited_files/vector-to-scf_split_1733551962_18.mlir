module {
  func.func @transfer_write_array_of_scalable(%arg0: vector<3x[4]xf32>, %arg1: memref<3x?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 0.000000e+00 : f32
    %dim = memref.dim %arg1, %c1 : memref<3x?xf32>
    %0 = vector.create_mask %c1, %dim : vector<3x[4]xi1>
    vector.transfer_write %arg0, %arg1[%c0, %c0], %0 {in_bounds = [true, true]} : vector<3x[4]xf32>, memref<3x?xf32>
    return
  }
}