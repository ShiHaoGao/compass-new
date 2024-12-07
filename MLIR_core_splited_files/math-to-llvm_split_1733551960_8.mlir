module {
  func.func @expm1(%arg0: f32) {
    %0 = math.expm1 %arg0 : f32
    return
  }
}