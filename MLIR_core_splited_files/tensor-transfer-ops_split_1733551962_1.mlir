module {
  func.func @transfer_read_2d(%arg0: tensor<?x?xf32>, %arg1: index, %arg2: index) -> vector<4x9xf32> {
    %cst = arith.constant -4.200000e+01 : f32
    %0 = vector.transfer_read %arg0[%arg1, %arg2], %cst {in_bounds = [true, true]} : tensor<?x?xf32>, vector<4x9xf32>
    return %0 : vector<4x9xf32>
  }
}