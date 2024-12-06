module {
  func.func @expm1_fmf(%arg0: f32) {
    %0 = math.expm1 %arg0 fastmath<fast> : f32
    return
  }
}