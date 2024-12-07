module {
  func.func @roundeven(%arg0: f32) {
    %0 = math.roundeven %arg0 : f32
    return
  }
}