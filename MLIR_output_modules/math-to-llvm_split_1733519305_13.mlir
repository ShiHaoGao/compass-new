module {
  func.func @rsqrt(%arg0: f32) {
    %0 = math.rsqrt %arg0 : f32
    return
  }
}