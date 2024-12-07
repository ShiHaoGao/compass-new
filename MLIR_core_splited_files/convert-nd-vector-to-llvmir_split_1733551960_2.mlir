module {
  func.func @bitcast_2d(%arg0: vector<2x4xf32>) {
    %0 = arith.bitcast %arg0 : vector<2x4xf32> to vector<2x4xi32>
    return
  }
}