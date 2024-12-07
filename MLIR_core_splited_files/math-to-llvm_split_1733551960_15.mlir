module {
  func.func @ctlz(%arg0: i32) {
    %0 = math.ctlz %arg0 : i32
    return
  }
}