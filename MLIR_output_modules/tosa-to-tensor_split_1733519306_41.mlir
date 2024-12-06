module {
  func.func @concat_axis_dyn(%arg0: tensor<?x3xf32>, %arg1: tensor<?x3xf32>) {
    %0 = tosa.concat %arg0, %arg1 {axis = 0 : i32} : (tensor<?x3xf32>, tensor<?x3xf32>) -> tensor<?x3xf32>
    return
  }
}