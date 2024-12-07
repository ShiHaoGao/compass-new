module {
  func.func @ctpop(%arg0: i32) {
    %0 = math.ctpop %arg0 : i32
    return
  }
}