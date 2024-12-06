module {
  func.func @reduce_i8(%arg0: vector<16xi8>) -> i8 {
    %0 = vector.reduction <add>, %arg0 : vector<16xi8> into i8
    return %0 : i8
  }
  func.func @reduce_i8_scalable(%arg0: vector<[16]xi8>) -> i8 {
    %0 = vector.reduction <add>, %arg0 : vector<[16]xi8> into i8
    return %0 : i8
  }
}