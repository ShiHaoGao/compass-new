module {
  func.func @vector_step_scalable() -> vector<[4]xindex> {
    %0 = vector.step : vector<[4]xindex>
    return %0 : vector<[4]xindex>
  }
}