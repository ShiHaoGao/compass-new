module {
  func.func @ctpop_scalable_vector(%arg0: vector<[4]xi32>) -> vector<[4]xi32> {
    %0 = math.ctpop %arg0 : vector<[4]xi32>
    return %0 : vector<[4]xi32>
  }
}