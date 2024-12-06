module {
  func.func @rsqrt_vector(%arg0: vector<4xf32>) {
    %0 = math.rsqrt %arg0 : vector<4xf32>
    return
  }
}