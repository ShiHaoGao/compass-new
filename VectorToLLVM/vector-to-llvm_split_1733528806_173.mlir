module {
  func.func @vector_from_elements_0d(%arg0: f32) -> vector<f32> {
    %0 = vector.from_elements %arg0 : vector<f32>
    return %0 : vector<f32>
  }
}