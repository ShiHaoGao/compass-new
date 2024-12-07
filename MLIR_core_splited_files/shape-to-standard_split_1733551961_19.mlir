module {
  func.func @shape_of_zero_d(%arg0: tensor<f32>) {
    %0 = shape.shape_of %arg0 : tensor<f32> -> tensor<?xindex>
    return
  }
}