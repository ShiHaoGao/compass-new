module {
  func.func @reduce_f16(%arg0: vector<16xf16>) -> f16 {
    %0 = vector.reduction <add>, %arg0 : vector<16xf16> into f16
    return %0 : f16
  }
  func.func @reduce_f16_scalable(%arg0: vector<[16]xf16>) -> f16 {
    %0 = vector.reduction <add>, %arg0 : vector<[16]xf16> into f16
    return %0 : f16
  }
}