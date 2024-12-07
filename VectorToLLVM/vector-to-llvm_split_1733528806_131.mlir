module {
  func.func @flat_transpose_index(%arg0: vector<16xindex>) -> vector<16xindex> {
    %0 = vector.flat_transpose %arg0 {columns = 4 : i32, rows = 4 : i32} : vector<16xindex> -> vector<16xindex>
    return %0 : vector<16xindex>
  }
}