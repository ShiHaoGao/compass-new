module {
  func.func @powf(%arg0: f64) {
    %0 = math.powf %arg0, %arg0 : f64
    return
  }
}