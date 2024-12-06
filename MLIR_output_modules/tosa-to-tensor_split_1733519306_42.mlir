module {
  func.func @concat_axis_dyn_mixed(%arg0: tensor<?x1xf32>, %arg1: tensor<?x1xf32>, %arg2: tensor<?x1xf32>) {
    %0 = tosa.concat %arg0, %arg1, %arg2 {axis = 0 : i32} : (tensor<?x1xf32>, tensor<?x1xf32>, tensor<?x1xf32>) -> tensor<5x1xf32>
    return
  }
}