module {
  func.func @if_test(%arg0: tensor<f32>, %arg1: tensor<f32>, %arg2: tensor<i1>) -> tensor<f32> {
    %0 = tosa.cond_if %arg2 -> (tensor<f32>) {
      tosa.yield %arg0 : tensor<f32>
    } else {
      tosa.yield %arg1 : tensor<f32>
    }
    return %0 : tensor<f32>
  }
}