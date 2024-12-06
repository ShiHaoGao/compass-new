#map = affine_map<() -> (0)>
module {
  func.func @transfer_read_with_tensor(%arg0: tensor<f32>) -> vector<1xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[], %cst {permutation_map = #map} : tensor<f32>, vector<1xf32>
    return %0 : vector<1xf32>
  }
}