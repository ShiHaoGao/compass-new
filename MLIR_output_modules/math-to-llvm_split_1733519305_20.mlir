module {
  func.func @ctpop_vector(%arg0: vector<3xi32>) {
    %0 = math.ctpop %arg0 : vector<3xi32>
    return
  }
}