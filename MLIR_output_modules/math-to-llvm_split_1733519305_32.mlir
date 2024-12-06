module {
  func.func @round(%arg0: f32) {
    %0 = math.round %arg0 : f32
    return
  }
}