module {
  func.func @transfer_read_simple(%arg0: memref<2x2xf32>) -> vector<2x2xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst : memref<2x2xf32>, vector<2x2xf32>
    return %0 : vector<2x2xf32>
  }
  func.func @transfer_read_minor_identity(%arg0: memref<?x?x?x?xf32>) -> vector<3x3xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%c0, %c0, %c0, %c0], %cst : memref<?x?x?x?xf32>, vector<3x3xf32>
    return %0 : vector<3x3xf32>
  }
  func.func @transfer_write_minor_identity(%arg0: vector<3x3xf32>, %arg1: memref<?x?x?x?xf32>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    vector.transfer_write %arg0, %arg1[%c0, %c0, %c0, %c0] : vector<3x3xf32>, memref<?x?x?x?xf32>
    return
  }
}