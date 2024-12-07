module {
  func.func @trunc(%arg0: f32) {
    %0 = math.trunc %arg0 : f32
    return
  }
}