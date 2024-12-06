module {
  func.func @expm1_vector_fmf(%arg0: vector<4xf32>) {
    %0 = math.expm1 %arg0 fastmath<fast> : vector<4xf32>
    return
  }
}