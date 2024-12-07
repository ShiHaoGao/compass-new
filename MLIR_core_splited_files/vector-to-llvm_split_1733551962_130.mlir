module {
  func.func @flat_transpose(%arg0: vector<16xf32>) -> vector<16xf32> {
    %0 = vector.flat_transpose %arg0 {columns = 4 : i32, rows = 4 : i32} : vector<16xf32> -> vector<16xf32>
    return %0 : vector<16xf32>
  }
}