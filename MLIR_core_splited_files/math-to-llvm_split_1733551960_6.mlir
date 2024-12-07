module {
  func.func @log1p_2dvector_fmf(%arg0: vector<4x3xf32>) {
    %0 = math.log1p %arg0 fastmath<fast> : vector<4x3xf32>
    return
  }
}