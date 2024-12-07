module {
  func.func @avg_pool_i8(%arg0: tensor<1x6x34x62xi8>) -> tensor<1x5x33x62xi8> {
    %0 = tosa.avg_pool2d %arg0 {acc_type = i32, kernel = array<i64: 4, 4>, pad = array<i64: 1, 1, 1, 1>, stride = array<i64: 1, 1>} : (tensor<1x6x34x62xi8>) -> tensor<1x5x33x62xi8>
    return %0 : tensor<1x5x33x62xi8>
  }
}