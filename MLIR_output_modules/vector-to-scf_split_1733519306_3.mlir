#map = affine_map<(d0, d1, d2, d3, d4) -> (d3)>
#map1 = affine_map<(d0) -> (d0 + 1)>
module {
  func.func @materialize_read_1d_partially_specialized(%arg0: index, %arg1: index, %arg2: index) {
    %cst = arith.constant 0.000000e+00 : f32
    %alloc = memref.alloc(%arg0, %arg1, %arg2) : memref<7x?x?x42x?xf32>
    affine.for %arg3 = 0 to 7 {
      affine.for %arg4 = 0 to %arg0 {
        affine.for %arg5 = 0 to %arg1 {
          affine.for %arg6 = 0 to 42 step 2 {
            affine.for %arg7 = 0 to %arg2 {
              %0 = vector.transfer_read %alloc[%arg3, %arg4, %arg5, %arg6, %arg7], %cst {permutation_map = #map} : memref<7x?x?x42x?xf32>, vector<4xf32>
              %1 = affine.apply #map1(%arg6)
              %2 = vector.transfer_read %alloc[%arg3, %arg4, %arg5, %1, %arg7], %cst {permutation_map = #map} : memref<7x?x?x42x?xf32>, vector<4xf32>
              "dummy_use"(%0, %2) : (vector<4xf32>, vector<4xf32>) -> ()
            }
          }
        }
      }
    }
    return
  }
}