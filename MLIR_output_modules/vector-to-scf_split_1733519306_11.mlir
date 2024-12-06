module {
  func.func private @fake_side_effecting_fun(vector<2x2xf32>)
  func.func @transfer_read_within_async_execute(%arg0: memref<2x2xf32>) -> !async.token {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %token = async.execute {
      %0 = vector.transfer_read %arg0[%c0, %c0], %cst : memref<2x2xf32>, vector<2x2xf32>
      func.call @fake_side_effecting_fun(%0) : (vector<2x2xf32>) -> ()
      async.yield
    }
    return %token : !async.token
  }
}