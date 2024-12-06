module {
  func.func @vector_from_elements_1d(%arg0: f32, %arg1: f32) -> vector<3xf32> {
    %0 = vector.from_elements %arg0, %arg1, %arg0 : vector<3xf32>
    return %0 : vector<3xf32>
  }
}