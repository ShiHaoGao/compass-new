module {
  func.func @max_pool(%arg0: tensor<1x6x34x62xf32>) {
    %0 = tosa.max_pool2d %arg0 {kernel = array<i64: 3, 3>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x6x34x62xf32>) -> tensor<1x4x32x62xf32>
    return
  }
  func.func @max_pool_padded(%arg0: tensor<1x6x34x62xf32>) {
    %0 = tosa.max_pool2d %arg0 {kernel = array<i64: 3, 3>, pad = array<i64: 0, 0, 0, 1>, stride = array<i64: 1, 1>} : (tensor<1x6x34x62xf32>) -> tensor<1x4x33x62xf32>
    return
  }
  func.func @max_pool_dyn(%arg0: tensor<?x6x34x62xf32>) {
    %0 = tosa.max_pool2d %arg0 {kernel = array<i64: 3, 3>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<?x6x34x62xf32>) -> tensor<?x4x32x62xf32>
    return
  }
  func.func @max_pool_i8(%arg0: tensor<1x6x34x62xi8>) {
    %0 = tosa.max_pool2d %arg0 {kernel = array<i64: 3, 3>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x6x34x62xi8>) -> tensor<1x4x32x62xi8>
    return
  }
  func.func @max_pool_i16(%arg0: tensor<1x6x34x62xi16>) {
    %0 = tosa.max_pool2d %arg0 {kernel = array<i64: 3, 3>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x6x34x62xi16>) -> tensor<1x4x32x62xi16>
    return
  }
  func.func @max_pool_i32(%arg0: tensor<1x6x34x62xi32>) {
    %0 = tosa.max_pool2d %arg0 {kernel = array<i64: 3, 3>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x6x34x62xi32>) -> tensor<1x4x32x62xi32>
    return
  }
  func.func @max_pool_all_dynamic(%arg0: tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> {
    %0 = tosa.max_pool2d %arg0 {kernel = array<i64: 2, 5>, pad = array<i64: 0, 0, 2, 2>, stride = array<i64: 1, 1>} : (tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    return %0 : tensor<?x?x?x?xf32>
  }
}