module {
  func.func @log1p_scalable_vector(%arg0: vector<[4]xf32>) -> vector<[4]xf32> {
    %0 = math.log1p %arg0 : vector<[4]xf32>
    return %0 : vector<[4]xf32>
  }
}