module {
  func.func @avg_pool_dyn(%arg0: tensor<?x6x34x62xf32>) -> tensor<?x5x33x62xf32> {
    %0 = tosa.avg_pool2d %arg0 {acc_type = f32, kernel = array<i64: 4, 4>, pad = array<i64: 1, 1, 1, 1>, stride = array<i64: 1, 1>} : (tensor<?x6x34x62xf32>) -> tensor<?x5x33x62xf32>
    return %0 : tensor<?x5x33x62xf32>
  }
}