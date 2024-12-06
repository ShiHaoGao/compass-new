#map = affine_map<(d0, d1) -> (d0 * 20 + d1 + 1)>
#map1 = affine_map<(d0, d1)[s0] -> (d0 * s0 + d1 + 1)>
module {
  func.func @check_strided_memref_arguments(%arg0: memref<10x20xf32, #map>, %arg1: memref<?x?xf32, #map1>, %arg2: memref<10x?xf32, #map1>) {
    return
  }
}