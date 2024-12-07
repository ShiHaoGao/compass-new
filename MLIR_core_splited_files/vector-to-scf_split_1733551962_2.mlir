#map = affine_map<(d0, d1) -> (d0)>
#map1 = affine_map<(d0) -> (d0 + 1)>
#map2 = affine_map<(d0) -> (d0 + 2)>
#map3 = affine_map<(d0) -> (d0 + 3)>
module {
  func.func @materialize_read_1d() {
    %cst = arith.constant 0.000000e+00 : f32
    %alloc = memref.alloc() : memref<7x42xf32>
    affine.for %arg0 = 0 to 7 step 4 {
      affine.for %arg1 = 0 to 42 step 4 {
        %0 = vector.transfer_read %alloc[%arg0, %arg1], %cst {permutation_map = #map} : memref<7x42xf32>, vector<4xf32>
        %1 = affine.apply #map1(%arg1)
        %2 = vector.transfer_read %alloc[%arg0, %1], %cst {permutation_map = #map} : memref<7x42xf32>, vector<4xf32>
        %3 = affine.apply #map2(%arg1)
        %4 = vector.transfer_read %alloc[%arg0, %3], %cst {permutation_map = #map} : memref<7x42xf32>, vector<4xf32>
        %5 = affine.apply #map3(%arg1)
        %6 = vector.transfer_read %alloc[%arg0, %5], %cst {permutation_map = #map} : memref<7x42xf32>, vector<4xf32>
        "dummy_use"(%0, %2, %4, %6) : (vector<4xf32>, vector<4xf32>, vector<4xf32>, vector<4xf32>) -> ()
      }
    }
    return
  }
}