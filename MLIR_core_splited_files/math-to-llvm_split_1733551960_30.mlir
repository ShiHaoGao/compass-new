module {
  func.func @fpowi(%arg0: f64, %arg1: i32) {
    %0 = math.fpowi %arg0, %arg1 : f64, i32
    return
  }
}