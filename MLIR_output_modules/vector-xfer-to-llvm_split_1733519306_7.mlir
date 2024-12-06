module {
  func.func @transfer_read_write_tensor(%arg0: tensor<?xf32>, %arg1: index) -> vector<4xf32> {
    %cst = arith.constant 7.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_read %arg0[%arg1], %cst : tensor<?xf32>, vector<4xf32>
    %1 = vector.transfer_write %0, %arg0[%c0] : vector<4xf32>, tensor<?xf32>
    "test.some_use"(%1) : (tensor<?xf32>) -> ()
    return %0 : vector<4xf32>
  }
}