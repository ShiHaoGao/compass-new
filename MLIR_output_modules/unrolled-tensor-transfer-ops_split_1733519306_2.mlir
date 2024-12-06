module {
  func.func @transfer_write_2d(%arg0: tensor<?x?xf32>, %arg1: vector<2x3xf32>, %arg2: index, %arg3: index) -> tensor<?x?xf32> {
    %0 = vector.transfer_write %arg1, %arg0[%arg2, %arg3] {in_bounds = [true, true]} : vector<2x3xf32>, tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
}