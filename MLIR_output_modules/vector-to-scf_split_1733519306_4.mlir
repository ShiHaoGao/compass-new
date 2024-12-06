#map = affine_map<(d0, d1, d2, d3) -> (d3, 0, d0)>
module {
  func.func @materialize_read(%arg0: index, %arg1: index, %arg2: index, %arg3: index) {
    %cst = arith.constant 0.000000e+00 : f32
    %alloc = memref.alloc(%arg0, %arg1, %arg2, %arg3) : memref<?x?x?x?xf32>
    affine.for %arg4 = 0 to %arg0 step 3 {
      affine.for %arg5 = 0 to %arg1 {
        affine.for %arg6 = 0 to %arg2 {
          affine.for %arg7 = 0 to %arg3 step 5 {
            %0 = vector.transfer_read %alloc[%arg4, %arg5, %arg6, %arg7], %cst {permutation_map = #map} : memref<?x?x?x?xf32>, vector<5x4x3xf32>
            "dummy_use"(%0) : (vector<5x4x3xf32>) -> ()
          }
        }
      }
    }
    return
  }
}