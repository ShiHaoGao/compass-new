#map = affine_map<(d0, d1, d2, d3) -> (d3, d1, d0)>
module {
  func.func @materialize_write(%arg0: index, %arg1: index, %arg2: index, %arg3: index) {
    %alloc = memref.alloc(%arg0, %arg1, %arg2, %arg3) : memref<?x?x?x?xf32>
    %cst = arith.constant dense<1.000000e+00> : vector<5x4x3xf32>
    affine.for %arg4 = 0 to %arg0 step 3 {
      affine.for %arg5 = 0 to %arg1 step 4 {
        affine.for %arg6 = 0 to %arg2 {
          affine.for %arg7 = 0 to %arg3 step 5 {
            vector.transfer_write %cst, %alloc[%arg4, %arg5, %arg6, %arg7] {permutation_map = #map} : vector<5x4x3xf32>, memref<?x?x?x?xf32>
          }
        }
      }
    }
    return
  }
}