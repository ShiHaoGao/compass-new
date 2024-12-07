module {
  func.func @entry() {
    %cst = arith.constant 1.000000e+00 : f32
    %cst_0 = arith.constant 2.000000e+00 : f32
    %0 = vector.splat %cst : vector<2x4xf32>
    %1 = vector.splat %cst_0 : vector<2x4xf32>
    vector.print %0 : vector<2x4xf32>
    vector.print %1 : vector<2x4xf32>
    %2 = vector.interleave %0, %1 : vector<2x4xf32> -> vector<2x8xf32>
    vector.print %2 : vector<2x8xf32>
    return
  }
}