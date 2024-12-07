module {
  func.func @vector_step() -> vector<4xindex> {
    %0 = vector.step : vector<4xindex>
    return %0 : vector<4xindex>
  }
}