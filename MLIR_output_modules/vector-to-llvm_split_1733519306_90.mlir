module {
  func.func @reduce_f64(%arg0: vector<16xf64>) -> f64 {
    %0 = vector.reduction <add>, %arg0 : vector<16xf64> into f64
    return %0 : f64
  }
  func.func @reduce_f64_scalable(%arg0: vector<[16]xf64>) -> f64 {
    %0 = vector.reduction <add>, %arg0 : vector<[16]xf64> into f64
    return %0 : f64
  }
}