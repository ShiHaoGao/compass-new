module {
  func.func @vector_interleave_2d_scalable(%arg0: vector<2x[8]xi16>, %arg1: vector<2x[8]xi16>) -> vector<2x[16]xi16> {
    %0 = vector.interleave %arg0, %arg1 : vector<2x[8]xi16> -> vector<2x[16]xi16>
    return %0 : vector<2x[16]xi16>
  }
}