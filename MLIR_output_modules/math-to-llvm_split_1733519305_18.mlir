module {
  func.func @cttz_scalable_vec(%arg0: vector<[4]xi32>) -> vector<[4]xi32> {
    %0 = math.cttz %arg0 : vector<[4]xi32>
    return %0 : vector<[4]xi32>
  }
}