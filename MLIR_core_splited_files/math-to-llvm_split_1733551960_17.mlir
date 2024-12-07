module {
  func.func @cttz_vec(%arg0: vector<4xi32>) {
    %0 = math.cttz %arg0 : vector<4xi32>
    return
  }
}