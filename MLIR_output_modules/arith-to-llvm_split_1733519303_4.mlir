module {
  func.func @addui_extended_scalar(%arg0: i32, %arg1: i32) -> (i32, i1) {
    %sum, %overflow = arith.addui_extended %arg0, %arg1 : i32, i1
    return %sum, %overflow : i32, i1
  }
  func.func @addui_extended_vector1d(%arg0: vector<3xi16>, %arg1: vector<3xi16>) -> (vector<3xi16>, vector<3xi1>) {
    %sum, %overflow = arith.addui_extended %arg0, %arg1 : vector<3xi16>, vector<3xi1>
    return %sum, %overflow : vector<3xi16>, vector<3xi1>
  }
}