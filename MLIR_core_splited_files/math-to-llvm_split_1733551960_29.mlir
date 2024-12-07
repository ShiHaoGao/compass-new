module {
  func.func @rsqrt_multidim_scalable_vector(%arg0: vector<4x[4]xf32>) -> vector<4x[4]xf32> {
    %0 = math.rsqrt %arg0 : vector<4x[4]xf32>
    return %0 : vector<4x[4]xf32>
  }
}