module {
  func.func @rsqrt_scalable_vector_fmf(%arg0: vector<[4]xf32>) -> vector<[4]xf32> {
    %0 = math.rsqrt %arg0 fastmath<fast> : vector<[4]xf32>
    return %0 : vector<[4]xf32>
  }
}