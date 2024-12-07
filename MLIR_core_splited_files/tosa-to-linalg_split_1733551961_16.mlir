module {
  func.func @test_simple_i16(%arg0: tensor<1xi16>) {
    %0 = tosa.mul %arg0, %arg0 {shift = 0 : i8} : (tensor<1xi16>, tensor<1xi16>) -> tensor<1xi32>
    return
  }
}