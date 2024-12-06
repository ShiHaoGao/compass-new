module {
  func.func @sine(%arg0: f32) {
    %0 = math.sin %arg0 : f32
    return
  }
}