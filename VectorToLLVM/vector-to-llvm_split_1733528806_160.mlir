module {
  func.func @splat_0d(%arg0: f32) -> vector<f32> {
    %0 = vector.splat %arg0 : vector<f32>
    return %0 : vector<f32>
  }
}