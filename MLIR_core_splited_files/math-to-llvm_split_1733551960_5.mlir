module {
  func.func @log1p_2dvector(%arg0: vector<4x3xf32>) {
    %0 = math.log1p %arg0 : vector<4x3xf32>
    return
  }
}