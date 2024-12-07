module {
  func.func @rsqrt_double_fmf(%arg0: f64) {
    %0 = math.rsqrt %arg0 fastmath<fast> : f64
    return
  }
}