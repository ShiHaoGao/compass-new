module {
  func.func @rsqrt_double(%arg0: f64) {
    %0 = math.rsqrt %arg0 : f64
    return
  }
}