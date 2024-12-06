module {
  func.func @log1p_fmf(%arg0: f32) {
    %0 = math.log1p %arg0 fastmath<fast> : f32
    return
  }
}