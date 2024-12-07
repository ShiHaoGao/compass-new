module {
  func.func @cttz(%arg0: i32) {
    %0 = math.cttz %arg0 : i32
    return
  }
}