#map = affine_map<(d0, d1) -> (d0 + d1 * 8)>
module {
  func.func @transfer_read_strided(%arg0: memref<8x4xf32, #map>) -> vector<4xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst : memref<8x4xf32, #map>, vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @transfer_write_strided(%arg0: vector<4xf32>, %arg1: memref<8x4xf32, #map>) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg0, %arg1[%c0, %c0] : vector<4xf32>, memref<8x4xf32, #map>
    return
  }
}