module {
  func.func @rsqrt_vector_fmf(%arg0: vector<4xf32>) {
    %0 = math.rsqrt %arg0 fastmath<fast> : vector<4xf32>
    return
  }
}