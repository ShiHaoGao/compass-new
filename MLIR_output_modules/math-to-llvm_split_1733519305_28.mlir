module {
  func.func @rsqrt_multidim_vector(%arg0: vector<4x3xf32>) {
    %0 = math.rsqrt %arg0 : vector<4x3xf32>
    return
  }
}