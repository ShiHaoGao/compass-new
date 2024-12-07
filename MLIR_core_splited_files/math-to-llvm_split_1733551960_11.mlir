module {
  func.func @expm1_scalable_vector(%arg0: vector<[4]xf32>) -> vector<[4]xf32> {
    %0 = math.expm1 %arg0 : vector<[4]xf32>
    return %0 : vector<[4]xf32>
  }
}