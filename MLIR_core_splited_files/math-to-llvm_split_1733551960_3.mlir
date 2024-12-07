module {
  func.func @log1p(%arg0: f32) {
    %0 = math.log1p %arg0 : f32
    return
  }
}